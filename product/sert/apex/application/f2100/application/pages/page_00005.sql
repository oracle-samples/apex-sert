-- file_checksum: CB77F1A11CEDE6A4F479B8B29FA2A2458AF08575F0802D803CF6B34216A17774
-------------------------------------------------------------------------------
-- Copyright (c) 2024,2025 Oracle and/or its affiliates.
-- Licensed under the Universal Permissive License v 1.0 as shown
-- at https://oss.oracle.com/licenses/upl/
--------------------------------------------------------------------------------
prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>32049826282261068
,p_default_application_id=>2100
,p_default_id_offset=>43721417861278263
,p_default_owner=>'SERT_PUB'
);
wwv_flow_imp_page.create_page(
 p_id=>5
,p_name=>'About APEX-SERT'
,p_alias=>'ABOUT-APEX-SERT'
,p_page_mode=>'MODAL'
,p_step_title=>'About APEX-SERT'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(84146935663218581)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(468201967560671224)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(84147090990218582)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(84146935663218581)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(468538954525671357)
,p_button_image_alt=>'Close'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61961253840373864)
,p_name=>'P5_BUILT_FOR_APEX'
,p_item_sequence=>40
,p_prompt=>'Built for APEX'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(84146798829218579)
,p_name=>'P5_EULA'
,p_item_sequence=>50
,p_prompt=>'EULA'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87114829795468156)
,p_name=>'P5_VERSION'
,p_item_sequence=>30
,p_prompt=>'Version'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(468536483915671350)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(84146857267218580)
,p_computation_sequence=>10
,p_computation_item=>'P5_EULA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return (''Copyright (c) 2024, 2025 Oracle and/or its affiliates.',
'',
'The Universal Permissive License (UPL), Version 1.0',
'',
'Subject to the condition set forth below, permission is hereby granted to any',
'person obtaining a copy of this software, associated documentation and/or data',
'(collectively the "Software"), free of charge and under any and all copyright',
'rights in the Software, and any and all patent rights owned or freely',
'licensable by each licensor hereunder covering either (i) the unmodified',
'Software as contributed to or provided by such licensor, or (ii) the Larger',
'Works (as defined below), to deal in both',
'',
'(a) the Software, and',
'(b) any piece of software and/or hardware listed in the lrgrwrks.txt file if',
'one is included with the Software (each a "Larger Work" to which the Software',
'is contributed by such licensors),',
'',
'without restriction, including without limitation the rights to copy, create',
'derivative works of, display, perform, and distribute the Software and make,',
'use, sell, offer for sale, import, export, have made, and have sold the',
'Software and the Larger Work(s), and to sublicense the foregoing rights on',
'either these or other terms.',
'',
'This license is subject to the following condition:',
'The above copyright notice and either this complete permission notice or at',
'a minimum a reference to the UPL must be included in all copies or',
'substantial portions of the Software.',
'',
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR',
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,',
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE',
'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER',
'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,',
'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE',
'SOFTWARE.'');'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(87114945127468157)
,p_computation_sequence=>20
,p_computation_item=>'P5_VERSION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'G_RELEASE_VERSION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(61961396032373865)
,p_computation_sequence=>30
,p_computation_item=>'P5_BUILT_FOR_APEX'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'G_APEX_VERSION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(84147204448218583)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(84147090990218582)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(84147251542218584)
,p_event_id=>wwv_flow_imp.id(84147204448218583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp.component_end;
end;
/
