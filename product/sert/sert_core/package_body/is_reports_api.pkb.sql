--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------

--changeset mzimon:create_package_spec_sert_core.is_reports_api_pkb stripComments:false endDelimiter:/ runOnChange:true runAlways:false rollbackEndDelimiter:/
create or replace package body sert_core.is_reports_api
as
  ------------------------------------------------------------------------------
  -- A collection of procdures used by the OCI Docgen print server 
  -- SERT IS reports.
  ------------------------------------------------------------------------------

  function report_generate (
     p_application_id NUMBER,
     p_data           CLOB,
     p_report_layout_static_id VARCHAR2,
     p_output_type    VARCHAR2,
     p_content_type   VARCHAR2,
     p_report_name    VARCHAR2,
     p_error_message  OUT VARCHAR2)
  return BOOLEAN is
  
    l_document BLOB;
    l_filename VARCHAR2(100);
    
  begin
  
    case p_report_name
      when 'EVALUATION_SUMMARY_REPORT' then
        l_filename := 'IS_application_evaluation_summary_report_'|| to_char(SYSDATE,'DDMMYYYYHH24MISS');     
        
      when 'EVALUATION_DETAIL_REPORT' then
        l_filename := 'IS_application_evaluation_detail_report_'|| to_char(SYSDATE,'DDMMYYYYHH24MISS');   
        
      when 'EVALUATION_EXCEPTION_REPORT' then
        l_filename := 'IS_application_evaluation_exception_report_'|| to_char(SYSDATE,'DDMMYYYYHH24MISS');   
        
      when 'ATTRIBUTES_MASTER_REPORT' then
        l_filename := 'IS_attributes_master_report_'|| to_char(SYSDATE,'DDMMYYYYHH24MISS');           
      else
        l_filename := 'unknown_report_type';
    end case;
  
  
    l_document :=
      apex_print.generate_document (
        p_application_id             => p_application_id,
        p_data                       => p_data,
        p_report_layout_static_id    => p_report_layout_static_id,
        p_output_type                => p_output_type
        );

    apex_http.download(
        p_blob           => l_document,
        p_content_type   => p_content_type,
        p_filename       => l_filename || '.pdf');

    p_error_message := NULL;
    return TRUE;

  exception
    when others then
      log_pkg.log(p_log => 'IS_REPORT_GENERATE fail - ' || SQLERRM, p_log_type => 'ERROR');                    
      p_error_message := 'Generate report failed. ' || SQLERRM;
      return FALSE;
  
  end report_generate;


  ------------------------------------------------------------------------------
  function evaluation_summary_report_json (
    p_eval_id NUMBER,
    p_app_id NUMBER)
  return clob
  ------------------------------------------------------------------------------
  is
    l_json clob;
    l_log_key  varchar2(10)  := log_pkg.get_log_key;
  begin

  log_pkg.log(p_log => 'EVAL_SUMMARY_EXPORT start eval_id: ' || p_eval_id,
              p_log_key => l_log_key, p_log_type => 'IS_REPORT', p_application_id => p_app_id);

    select json_serialize( 
                  json_object(   
                    'current_date'  value to_char(sysdate, 'DD MON YYYY'),
                    'category'      value
                     json_arrayagg( 
                        json_object('category_id'   value cat.category_id,
                                    'category_name' value cat.category_name,
                                    'application_name' value eva.application_name,
                                    'rule' value (
                                    select
                                    json_arrayagg(
                                      json_object('rule_id'   value ers1.rule_id,
                                                  'rule_name' value ers1.rule_name,
                                                  'result'    value ers1.result,
                                                  'page_id'   value ers1.page_id, 
                                                  'component_name' value ers1.component_name,
                                                  'current_value'  value ers1.current_value,
                                                  'region_name'  value ers1.region_name,
                                                  'column_name'  value ers1.column_name                                                
                                                  returning clob) 
                                                  order by ers1.rule_name, ers1.page_id, ers1.result
                                        returning clob)
                                       from 
                                         sert_core.eval_results_pub_v ers1,
                                         sert_core.categories cat1
                                       where ers1.category_key = cat.category_key
                                       and ers1.eval_id = p_eval_id
                                       and ers1.result not like '%PASS%'
                                       and ers1.category_key = cat1.category_key
                                       )
                                      returning clob
                                      ) order by cat.category_id
                        returning clob)
                returning clob) 
        returning clob pretty) as report_data
    into l_json
    from sert_core.categories cat,
         sert_core.evals_v eva
    where eva.eval_id = p_eval_id;

  log_pkg.log(p_log => 'EVAL_SUMMARY_EXPORT end eval_id: ' || p_eval_id || ' - ' || substr(l_json,1,1000),
              p_log_key => l_log_key, p_log_type => 'IS_REPORT', p_application_id => p_app_id);
              
  return l_json;

  end evaluation_summary_report_json;



  ------------------------------------------------------------------------------
  function evaluation_detail_report_json (
    p_eval_id NUMBER,
    p_app_id NUMBER)
  return clob
  ------------------------------------------------------------------------------
  is
    l_json clob;
    l_log_key  varchar2(10)  := log_pkg.get_log_key;
  begin

  log_pkg.log(p_log => 'EVAL_DETAIL_EXPORT start eval_id: ' || p_eval_id,
              p_log_key => l_log_key, p_log_type => 'IS_EXPORT', p_application_id => p_app_id);

    select json_serialize( 
              json_object(   
                    'current_date'  value to_char(sysdate, 'DD MON YYYY'),
                    'category'      value
                     json_arrayagg( 
                        json_object('category_id'   value cat.category_id,
                                    'category_name' value cat.category_name,
                                    'rule_name' value rul.rule_name,
                                    'info' value rul.info,
                                    'fix' value rul.fix,
                                    'application_name' value eva.application_name,
                                    'finding' value (
                                    select
                                    json_arrayagg(
                                      json_object('result'    value ers1.result,
                                                  'page_id'   value ers1.page, 
                                                  'component_name' value ers1.component_name,
                                                  'current_value'  value ers1.current_value,
                                                  'region_name'  value ers1.region_name,
                                                  'column_name'  value ers1.column_name                                                
                                                  returning clob) 
                                                  order by ers1.page_id, ers1.result
                                        returning clob) 
                                       from 
                                         sert_core.eval_results_pub_v ers1
                                       where ers1.category_key = cat.category_key
                                       and ers1.rule_id = rul.rule_id
                                       and ers1.eval_id = p_eval_id
                                       and ers1.result not like '%PASS%'
                                       )                                                                                                                                                
                                      returning clob
                                      ) order by cat.category_id, rul.rule_name
                        returning clob)
                returning clob) 
        returning clob pretty) as report_data
    into l_json        
    from sert_core.categories cat,
         sert_core.rules rul,
         sert_core.evals_v eva
    where rul.category_id = cat.category_id   
    and exists (select 1 from sert_core.eval_results er
                where er.eval_id = p_eval_id
                and er.rule_id = rul.rule_id
                and er.result not like '%PASS%')  
    and eva.eval_id = p_eval_id;           

    log_pkg.log(p_log => 'EVAL_DETAIL_EXPORT end eval_id: ' || p_eval_id || ' - ' || substr(l_json,1,1000),
                p_log_key => l_log_key, p_log_type => 'IS_REPORT', p_application_id => p_app_id);
              

    return l_json;

  end evaluation_detail_report_json;



  ------------------------------------------------------------------------------
  function evaluation_exception_report_json (
    p_eval_id NUMBER,
    p_app_id NUMBER)
  return clob
  ------------------------------------------------------------------------------
  is
    l_json clob;
    l_log_key  varchar2(10)  := log_pkg.get_log_key;
  begin

    log_pkg.log(p_log => 'EVAL_EXCEPTION_EXPORT start eval_id: ' || p_eval_id,
                p_log_key => l_log_key, p_log_type => 'IS_REPORT', p_application_id => p_app_id);

    select json_serialize( 
            json_object(   
                    'current_date'  value to_char(sysdate, 'DD MON YYYY'),
                    'category'      value
                     json_arrayagg( 
                        json_object('category_id'   value cat.category_id,
                                    'category_name' value cat.category_name,
                                    'rule_name' value rul.rule_name,
                                    'info' value rul.info,
                                    'fix' value rul.fix,
                                    'application_name' value eva.application_name,                                    
                                    'finding' value (
                                    select
                                    json_arrayagg(
                                      json_object('result'    value ers1.result,
                                                  'page_id'   value ers1.page_id, 
                                                  'component_name' value ers1.component_name,
                                                  'region_name'  value ers1.region_name,
                                                  'column_name'  value ers1.column_name,
                                                  'result' value ers1.result,
                                                  'current_value' value ers1.current_value
                                                  returning clob)  
                                                  order by ers1.page_id
                                        returning clob
                                        )
                                       from 
                                         sert_core.eval_results_exc_pub_v ers1
                                       where ers1.category_key = cat.category_key
                                       and ers1.rule_id = rul.rule_id
                                       and ers1.eval_id = p_eval_id
                                       and ers1.result not in ('PASS','FAIL')                                     
                                       )                                                                                                                                                
                                      returning clob
                                      ) order by cat.category_id, rul.rule_name
                        returning clob)
                returning clob) 
        returning clob pretty) as report_data
        into l_json
   from sert_core.categories cat,
        sert_core.rules rul,
       sert_core.evals_v eva
   where rul.category_id = cat.category_id   
  and exists (select 1 from sert_core.exceptions_v ev
              where ev.rule_id = rul.rule_id)  
  and eva.eval_id = p_eval_id;


  log_pkg.log(p_log => 'EVAL_EXCEPTION_EXPORT end eval_id: ' || p_eval_id || ' - ' || substr(l_json,1,1000),
              p_log_key => l_log_key, p_log_type => 'IS_REPORT', p_application_id => p_app_id);
              
  return l_json;

end evaluation_exception_report_json;



  ------------------------------------------------------------------------------
  function attributes_master_report_json (
    p_eval_id NUMBER,
    p_app_id NUMBER)
  return clob
  ------------------------------------------------------------------------------
  is
    l_json clob;
    l_log_key  varchar2(10)  := log_pkg.get_log_key;
  begin

    log_pkg.log(p_log => 'ATTRIBUTES_MASTER_REPORT start eval_id: ' || p_eval_id,
                p_log_key => l_log_key, p_log_type => 'IS_REPORT', p_application_id => p_app_id);
                
    select json_serialize( 
              json_object(   
                    'current_date'  value to_char(sysdate, 'DD MON YYYY'),
                    'category'      value
                     json_arrayagg( 
                        json_object('category_id'   value cat.category_id,
                                    'category_name' value cat.category_name,
                                    'application_name' value eva.application_name,
                                    'rule' value (
                                    select
                                    json_arrayagg(
                                      json_object('rule_id'   value rul1.rule_id,
                                                  'rule_name' value rul1.rule_name,
                                                  'rule_count' value count(*)
                                                 returning clob) 
                                                 order by rul1.rule_name
                                        returning clob)
                                       from 
                                         sert_core.rules rul1
                                       where rul1.category_id = cat.category_id
                                       group by rul1.rule_name, rul1.rule_id
                                       )
                                      returning clob
                                      ) order by cat.category_id
                        returning clob)
                returning clob) 
        returning clob pretty) as report_data
    into l_json
    from sert_core.categories cat,
         sert_core.evals_v eva
    where eva.eval_id = p_eval_id;        

    log_pkg.log(p_log => 'ATTRIBUTES_MASTER_REPORT end eval_id: ' || p_eval_id || ' - ' || substr(l_json,1,1000),
                p_log_key => l_log_key, p_log_type => 'IS_REPORT', p_application_id => p_app_id);             

    return l_json;
    
  end attributes_master_report_json;
  

end is_reports_api;
/
--rollback not required
