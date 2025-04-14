--liquibase formatted sql
--changeset user:oci_vault_config_properties endDelimiter:/ labels:dba runOnChange:true
--SQL CODE GOES HERE: (Make sure to qualify objects with the schema name. E.g. SCOTT.EMP)
declare
  l_group_name gbu_core.gbu_property_groups.group_name%type := 'OCI_CONFIG';
begin
  -- Create a new root-level group to store the configuration for OCI related
  -- things. Turning off exports so these configs don't come out when generating
  -- exports.
  gbu_properties_api.cre_or_mod_property_group (
    p_group_name => l_group_name,
    p_group_refid => null,
    p_description => 'OCI Configuration (defaults)',
    p_parent_group => cast(null as number),
    p_allow_export_yn => 'N',
    p_owner => 'GBU_CORE'
  );

  if not '${XGBU_VAULT_OCID}' = '$' || '{XGBU_VAULT_OCID}' then
    gbu_properties_api.set_property(
      p_property_group => l_group_name,
      p_property_name => 'VAULT_OCID',
      p_property_value => '${XGBU_VAULT_OCID}',
      p_description => 'The default OCI Vault OCID'
    );
  end if;
  if not '${XGBU_VAULT_COMPARTMENT_OCID}' = '$' || '{XGBU_VAULT_COMPARTMENT_OCID}' then
    gbu_properties_api.set_property(
      p_property_group => l_group_name,
      p_property_name => 'COMPARTMENT_OCID',
      p_property_value => '${XGBU_VAULT_COMPARTMENT_OCID}',
      p_description => 'The default Compartment OCID'
    );
  end if;
  if not '${XGBU_VAULT_REGION}' = '$' || '{XGBU_VAULT_REGION}' then
    gbu_properties_api.set_property(
      p_property_group => l_group_name,
      p_property_name => 'REGION_NAME',
      p_property_value => '${XGBU_VAULT_REGION}',
      p_description => 'The default region name. Examples include: us-ashburn-1, ap-mumbai-1, etc.'
    );
  end if;
  if not '${XGBU_VAULT_KEY_OCID}' = '$' || '{XGBU_VAULT_KEY_OCID}' then
    gbu_properties_api.set_property(
      p_property_group => l_group_name,
      p_property_name => 'VAULT_KEY_OCID',
      p_property_value => '${XGBU_VAULT_KEY_OCID}',
      p_description => 'The default OCI Vault master encryption key OCID. Should be associated with the specified vault (VAULT_OCID)'
    );
  end if;
end;
/
--rollback not required