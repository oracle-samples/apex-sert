--liquibase formatted sql
-------------------------------------------------------------------------------
-- Copyright (c) 2024 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
--changeset aes-ace:development_properties stripComments:false runOnChange:true runAlways:true endDelimiter:/
declare
  --For instructions
  --https://gbuconfluence.oraclecorp.com/pages/editpage.action?pageId=565421907

  l_api_schema         varchar2(4000) := null;
  l_code_schema        varchar2(4000) := upper(''); -- optional
  l_core_schema        varchar2(4000) := upper('sert_core');
  l_multi_tenant_yn    varchar2(4000) := 'N';                    -- Default:(N)o
  l_project_name       varchar2(4000) := 'sert';
  l_project_product    varchar2(4000) := 'sert';
  l_pub_schema         varchar2(4000) := upper('sert_pub');
  l_third_party_schema varchar2(4000) := '';          -- optional
  l_workspace          varchar2(4000) := 'sert';

/* DO NOT CHANGE ANYTHING BELOW THIS LINE */
begin

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'MULTI-TENANT_YN'
                                       ,p_property_value => l_multi_tenant_yn);

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'PROJECT_API'
                                       ,p_property_value => l_api_schema);

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'PROJECT_CODE'
                                       ,p_property_value => l_code_schema);

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'PROJECT_CORE'
                                       ,p_property_value => l_core_schema);

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'PROJECT_NAME'
                                       ,p_property_value => l_project_name);

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'PROJECT_PRODUCT'
                                       ,p_property_value => l_project_product);

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'PROJECT_PUB'
                                       ,p_property_value => l_pub_schema);

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'PROJECT_SCHEMAS'
                                       ,p_property_value => l_core_schema||':'||l_pub_schema||
                                                            case
                                                              when l_code_schema is not null
                                                              then ':'||l_code_schema
                                                              else ''
                                                            end);

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'PROJECT_WORKSPACE'
                                       ,p_property_value => l_workspace);

  gbu_properties_api.set_property_value(p_property_group => 'PROJECT'
                                       ,p_property_name  => 'THIRD-PARTY_SCHEMAS'
                                       ,p_property_value => l_third_party_schema);

  commit;
end;
/
--rollback not required
