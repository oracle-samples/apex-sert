#!/bin/bash
set -e
echo "Sourcing variables ace_pipeline_variables.env"
# . ace_pipeline_variables.env

SERT_EXCEPTION_SCRIPT=test_sert_exceptions.sql

SERT_EXCEPTION_PATHS='nonprod/sert/apex/sert'
echo "Sert exception path(s) specified as: ${SERT_EXCEPTION_PATHS}"
echo "Sert application ignore list specified as: ${SERT_APPLICATION_IGNORE_LIST}"

printf "Loading exceptions to test DBs\n"
IFS="," read -ra sert_paths_arr <<< "${SERT_EXCEPTION_PATHS}"
> "${SERT_EXCEPTION_SCRIPT}"

printf "whenever sqlerror exit sql.sqlcode\n\n" >> "${SERT_EXCEPTION_SCRIPT}"

# Show exception count before and after to get some observability about changes
# in data (if any).
printf "PRO SERT exception count before upload\n" >> ${SERT_EXCEPTION_SCRIPT}
printf "select count(1) from sert_core.exceptions;\n" >> ${SERT_EXCEPTION_SCRIPT}
printf "begin\n" >> "${SERT_EXCEPTION_SCRIPT}"
# Put a null statement into the script just incase there are no exception files
# in the project - this will allow the plsql block to still run without error.
printf "\tnull;\n" >> "${SERT_EXCEPTION_SCRIPT}"

for exception_path in "${sert_paths_arr[@]}"
do
    # Make sure the configured path exists and if it doesn't go to next iteration
    # of the loop. It's possible the path is configured but no exceptions have
    # been loaded there.
    [[ -d "$exception_path" ]] || continue

    # For each path, find all the json files and cre
    find "$exception_path" -iname "*.json" -print0 |
    while IFS= read -r -d '' exceptionFilepath
    do
        printf -- "\t-- Load exceptions file %s\n" $(basename "$exceptionFilepath") >> "${SERT_EXCEPTION_SCRIPT}"
        printf "\tdeclare\n" >> "${SERT_EXCEPTION_SCRIPT}"
        printf "\t\tl_exception_clob clob;\n" >> "${SERT_EXCEPTION_SCRIPT}"
        printf "\t\tl_exception_blob blob;\n" >> "${SERT_EXCEPTION_SCRIPT}"
        printf "\tbegin\n" >> "${SERT_EXCEPTION_SCRIPT}"
        printf "\t\tl_exception_clob := apex_string.join_clob(apex_t_varchar2(\n" >> "${SERT_EXCEPTION_SCRIPT}"
        sed -E "s/^(.*)$/\t\t\t'\1',/g" < "${exceptionFilepath}" | sed '$s/,$//' >> "${SERT_EXCEPTION_SCRIPT}"
        printf "\t\t));\n" >> "${SERT_EXCEPTION_SCRIPT}"
        printf "\t\tl_exception_blob := apex_util.clob_to_blob(l_exception_clob);\n" >> "${SERT_EXCEPTION_SCRIPT}"
        printf "\tsert_core.exceptions_api.process_exceptions (p_json_export_file => l_exception_blob);\n" >> "${SERT_EXCEPTION_SCRIPT}"
        printf "\tend;\n\n" >> "${SERT_EXCEPTION_SCRIPT}"
    done
done

printf "end;\n" >> "${SERT_EXCEPTION_SCRIPT}"
printf "/\n" >> "${SERT_EXCEPTION_SCRIPT}"
printf "PRO SERT exception count after upload\n" >> ${SERT_EXCEPTION_SCRIPT}
printf "select count(1) from sert_core.exceptions;\n" >> ${SERT_EXCEPTION_SCRIPT}
printf "exit\n" >> "${SERT_EXCEPTION_SCRIPT}"
