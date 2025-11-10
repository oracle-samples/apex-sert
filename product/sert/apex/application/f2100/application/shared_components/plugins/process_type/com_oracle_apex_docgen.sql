-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
-- file_checksum: 6C36D69F10CCA65A06657621CA3726E3D73D621A9BCC86D02897C9EE6336D3DA
prompt --application/shared_components/plugins/process_type/com_oracle_apex_docgen
begin
--   Manifest
--     PLUGIN: COM.ORACLE.APEX.DOCGEN
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(2751765081673686019)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'COM.ORACLE.APEX.DOCGEN'
,p_display_name=>'OCI Document Generator - Print Document'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_PROC:APEX_APPL_AUTOMATION_ACTIONS:APEX_APPL_TASKDEF_ACTIONS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','COM.ORACLE.APEX.DOCGEN'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'c_credential_name       constant varchar2( 30 ) := ''OCI$RESOURCE_PRINCIPAL'';',
'',
'--==============================================================================',
'-- Callback function to execute the Process',
'--==============================================================================',
'function exec_process (',
'    p_process in apex_plugin.t_process,',
'    p_plugin  in apex_plugin.t_plugin )',
'    return apex_plugin.t_process_exec_result',
'is',
'    -- Plug-in settings',
'    c_region            constant apex_appl_plugins.attribute_01%type := p_plugin.attribute_01;',
'    c_function_ocid     constant apex_appl_plugins.attribute_02%type := p_plugin.attribute_02;',
'    c_bucket_namespace  constant apex_appl_plugins.attribute_05%type := p_plugin.attribute_05;',
'    c_bucket_name       constant apex_appl_plugins.attribute_06%type := p_plugin.attribute_06;',
'    c_output_dir        constant apex_appl_plugins.attribute_03%type := p_plugin.attribute_03;',
'    c_template_dir      constant apex_appl_plugins.attribute_07%type := p_plugin.attribute_07;',
'',
'    -- Process settings ',
'    c_sql               constant varchar2( 23767 ) := p_process.attribute_01;',
'    c_template          constant varchar2( 23767 ) := p_process.attribute_02;',
'    c_file_name         constant varchar2( 23767 ) := p_process.attribute_03;',
'',
'    l_result            apex_plugin.t_process_exec_result;',
'    l_app_id            varchar2(100) := v(''APP_ID'');',
'',
'    -- Variables for template',
'    l_tmpl_name         varchar2( 32767 );',
'    l_template          blob;',
'    l_resp_put_object   dbms_cloud_oci_obs_object_storage_put_object_response_t;',
'    l_tmpl_object_name  varchar2( 32767 );',
'    ',
'    -- Variables for data',
'    l_context           pls_integer;',
'    l_data              sys.json_object_t;',
'',
'    -- Variables for invoking function',
'    l_payload           sys.json_object_t;',
'    l_resp_function     dbms_cloud_oci_fnc_functions_management_get_function_response_t;',
'    l_resp_invoke       dbms_cloud_oci_fnc_functions_invoke_invoke_function_response_t;',
'',
'    -- Variables for output',
'    l_out_object_name   varchar2( 32767 );',
'    l_resp_get_object   dbms_cloud_oci_obs_object_storage_get_object_response_t;',
'    l_output            blob;',
'    l_export            apex_data_export.t_export;',
'',
'    l_resp_json         sys.json_object_t;',
'',
'    l_nn VARCHAR2(200);',
'',
'begin',
'',
'    l_nn := '''';',
'    if c_region is null then l_nn := ''region''; end if;',
'    if c_function_ocid is null then l_nn := l_nn || ''-function_ocid''; end if;',
'    if c_bucket_namespace is null then l_nn := l_nn || ''-bucket_namespace''; end if;',
'    if c_bucket_name is null then l_nn := l_nn || ''-bucket_name''; end if;',
'    if c_output_dir is null then l_nn := l_nn || ''-output_dir''; end if;',
'    if c_template_dir is null then l_nn := l_nn || ''-template_dir''; end if;',
' ',
'    if     c_region             is null',
'        or c_function_ocid      is null',
'        or c_bucket_namespace   is null',
'        or c_bucket_name        is null',
'        or c_output_dir         is null',
'        or c_template_dir       is null',
'    then',
'',
'        apex_error.add_error (',
'            p_message          => ''Please provide a value for all attributes in the Component Settings for the <strong>"OCI Document Generator - Print Document"</strong> plug-in.'' || l_nn,',
'            p_display_location => apex_error.c_inline_in_notification );',
'        ',
'        return l_result;',
'',
'    end if;',
'',
'    -- ',
'    -- Get the DOCX template file as BLOB',
'    --',
'    select file_content',
'      into l_template',
'      from apex_application_static_files',
'     where file_name        = c_template',
'       and application_id   = l_app_id;',
'',
'    --',
'    -- Generate the correct object names',
'    --',
'    l_tmpl_name         := regexp_substr( c_template , ''[^/]+$'', 1, 1 );',
'    l_tmpl_object_name  := c_template_dir || l_tmpl_name;',
'    l_out_object_name   := c_output_dir || c_file_name;',
'',
'    --',
'    -- Upload DOCX template to OCI Object Storage Bucket',
'    --',
'    l_resp_put_object := ',
'        dbms_cloud_oci_obs_object_storage.put_object(',
'            namespace_name  => c_bucket_namespace,',
'            bucket_name     => c_bucket_name,',
'            object_name     => l_tmpl_object_name,',
'            put_object_body => l_template,',
'            credential_name => c_credential_name,',
'            region          => c_region );',
'    --',
'    -- Execute the query to get the JSON data',
'    -- ',
'    l_context := apex_exec.open_query_context(',
'        p_location  => apex_exec.c_location_local_db,',
'        p_sql_query => c_sql );',
'',
'    if apex_exec.next_row( p_context => l_context ) then',
'        l_data := sys.json_object_t( apex_exec.get_clob( l_context, 1 ) );',
'    else',
'        l_data := sys.json_object_t();',
'    end if;',
'',
'    --',
'    -- Generate the layload to invoke the Document Generator function',
'    --    ',
'    l_payload := ',
'        sys.json_object_t(',
'            ''{',
'                "requestType": "SINGLE",',
'                "tagSyntax": "DOCGEN_1_0",',
'                "data": {',
'                    "source": "INLINE",',
'                    "content": '' || l_data.to_clob() || ''',
'                },',
'                "template": {',
'                    "source": "OBJECT_STORAGE",',
'                    "namespace": "'' || c_bucket_namespace || ''",',
'                    "bucketName": "'' || c_bucket_name || ''",',
'                    "objectName": "'' || l_tmpl_object_name || ''",',
'                    "contentType": "application/vnd.openxmlformats-officedocument.wordprocessingml.document"',
'                },',
'                "output": {',
'                    "target": "OBJECT_STORAGE",',
'                    "namespace": "'' || c_bucket_namespace || ''",',
'                    "bucketName": "'' || c_bucket_name || ''",',
'                    "objectName": "'' || l_out_object_name || ''",',
'                    "contentType": "application/pdf"',
'                }',
'            }'');',
'',
'    --',
'    -- Get the function details',
'    --',
'    l_resp_function := ',
'        dbms_cloud_oci_fnc_functions_management.get_function(',
'            function_id     => c_function_ocid,',
'            region          => c_region,',
'            credential_name => c_credential_name );',
'',
'    --',
'    -- Invoke the Document Generator function',
'    --',
'    l_resp_invoke := ',
'        dbms_cloud_oci_fnc_functions_invoke.invoke_function(',
'            function_id             => c_function_ocid,',
'            endpoint                => l_resp_function.response_body.invoke_endpoint,',
'            credential_name         => c_credential_name,',
'            invoke_function_body    => l_payload.to_blob() );',
'',
'    apex_debug.info( apex_util.blob_to_clob( l_resp_invoke.response_body ) );',
'',
'    l_resp_json := sys.json_object_t( l_resp_invoke.response_body  );',
'',
'    if l_resp_json.has( ''responseType'' ) and l_resp_json.get_string( ''responseType'' ) = ''ERROR'' then',
'',
'        apex_error.add_error (',
'            p_message          => l_resp_json.get_string( ''error'' ),',
'            p_display_location => apex_error.c_inline_in_notification );',
'    ',
'        return l_result;',
'        ',
'    else',
'',
'        --',
'        -- Get the output',
'        -- ',
'        l_resp_get_object := ',
'            dbms_cloud_oci_obs_object_storage.get_object(',
'                namespace_name  => c_bucket_namespace,',
'                bucket_name     => c_bucket_name,',
'                object_name     => l_out_object_name,',
'                credential_name => c_credential_name,',
'                region          => c_region );',
'',
'        --',
'        -- Download output',
'        --',
'        l_export.format         := apex_data_export.c_format_pdf;',
'        l_export.content_blob   := l_resp_get_object.response_body;',
'        l_export.mime_type      := ''application/pdf'';',
'        l_export.file_name      := c_file_name;',
'',
'        apex_data_export.download(',
'            p_export    => l_export );',
'',
'    end if;',
'',
'    return l_result;',
'    ',
'end exec_process;'))
,p_api_version=>2
,p_execution_function=>'exec_process'
,p_substitute_attributes=>true
,p_version_scn=>1
,p_subscribe_plugin_settings=>true
,p_help_text=>'This plug-in demonstrates the integration between Oracle APEX and Oracle Document Generator Pre-Built Function in OCI.'
,p_version_identifier=>'0.1'
,p_plugin_comment=>'Sample purposes only'
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(1994410106728124144)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_title=>'OCI Document Generator Function'
,p_display_sequence=>10
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(1994410586651124145)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_title=>'OCI Object Storage Bucket'
,p_display_sequence=>20
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1994411019610134141)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Region Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>'us-phoenix-1'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1994411829716154601)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Document Generator Function OCID'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(1994410106728124144)
,p_examples=>'ocid1.fnfunc.oc1.phx.abcdefghijklmnopqrstuvwxyz'
,p_help_text=>'Oracle-assigned unique ID called an Oracle Cloud Identifier (OCID) which identifies the DocGen Function.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1994413606222191720)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>70
,p_prompt=>'Bucket Output Folder'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'out/'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(1994410586651124145)
,p_help_text=>'Specify the folder in the Bucket where the generated PDF will be stored.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1994420360540911009)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>40
,p_prompt=>'Bucket Namespace'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(1994410586651124145)
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1994421145322912223)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>6
,p_display_sequence=>50
,p_prompt=>'Bucket Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(1994410586651124145)
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1997335148023521445)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Bucket Template Folder'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'template/'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(1994410586651124145)
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2751765873692695641)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>20
,p_prompt=>'Report Source Query'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'The query has to return JSON.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1994429657869389527)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Template'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Location of the template in Static Application Files.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1994434244800614029)
,p_plugin_id=>wwv_flow_imp.id(2751765081673686019)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Filename'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
