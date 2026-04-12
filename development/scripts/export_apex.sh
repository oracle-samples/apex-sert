#!/bin/bash
# export_apex.sh — Export APEX applications to source control via SQLcl
#
# Usage:  ./export_apex.sh <app_id> [<app_id> ...]
# Requires:
#   $SQLC_CONN  — name of a saved SQLcl / SQL Developer connection
#   jq          — brew install jq
#   sql         — SQLcl in PATH

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
CONFIG_FILE="${REPO_ROOT}/apex_config.json"

# ── Helpers ───────────────────────────────────────────────────────────────────
err()  { echo "ERROR: $*" >&2; exit 1; }
warn() { echo "WARN:  $*" >&2; }
info() { echo "  $*"; }

# ── Prerequisites ─────────────────────────────────────────────────────────────
[[ -z "${SQLC_CONN:-}" ]]  && err "SQLC_CONN environment variable is not set."
[[ $# -eq 0 ]]             && { echo "Usage: $(basename "$0") <app_id> [<app_id> ...]"; exit 1; }
command -v jq  &>/dev/null || err "jq is required — brew install jq"
command -v sql &>/dev/null || err "sqlcl (sql) not found in PATH."
[[ -f "$CONFIG_FILE" ]]    || err "Config file not found: $CONFIG_FILE"

# ── Config lookup ─────────────────────────────────────────────────────────────
# get_config <app_id> <field>
# Priority: exact id → id-lo/id-hi range → default record
get_config() {
    local app_id=$1 field=$2 val

    # Exact id match (skip the "default" sentinel)
    val=$(jq -r --arg id "$app_id" --arg f "$field" \
        '.[] | select(.id == $id and .id != "default") | .[$f] // empty' \
        "$CONFIG_FILE")
    [[ -n "$val" ]] && { printf '%s' "$val"; return; }

    # Range match
    val=$(jq -r --argjson id "$app_id" --arg f "$field" \
        '.[] | select(."id-lo" != null)
             | select( (."id-lo" | tonumber) <= $id
                   and (."id-hi" | tonumber) >= $id )
             | .[$f] // empty' "$CONFIG_FILE")
    [[ -n "$val" ]] && { printf '%s' "$val"; return; }

    # Default record
    jq -r --arg f "$field" \
        '.[] | select(.id == "default") | .[$f] // empty' "$CONFIG_FILE"
}

# ── Test connection (before any destructive work) ─────────────────────────────
echo "Testing SQLcl connection '$SQLC_CONN' ..."
conn_output=$(sql -name "$SQLC_CONN" <<'SQLEOF' 2>&1
whenever sqlerror exit failure
select 'CONNECTION_OK' from dual;
exit
SQLEOF
)
conn_rc=$?

if [[ $conn_rc -ne 0 ]] || ! grep -q "CONNECTION_OK" <<< "$conn_output"; then
    echo "$conn_output" >&2
    err "SQLcl connection test failed (exit $conn_rc). No files were modified."
fi
echo "Connection OK."
echo

# ── Export each application ───────────────────────────────────────────────────
export_failed=0

for app_id in "$@"; do
    printf '═%.0s' {1..60}; echo
    echo "Exporting APEX application $app_id"
    printf '═%.0s' {1..60}; echo

    raw_extract_to=$(get_config "$app_id" "extract_to_path")
    preserve_xml=$(get_config   "$app_id" "preserveInstallXML")

    if [[ -z "$raw_extract_to" ]]; then
        warn "No extract_to_path found for app $app_id in apex_config.json — skipping."
        export_failed=1
        continue
    fi

    extract_to="${REPO_ROOT}/${raw_extract_to}"
    app_dir="${extract_to}/f${app_id}"
    install_xml="${app_dir}/install.xml"
    install_xml_backup=""

    # ── Backup install.xml before the delete ─────────────────────────────────
    if [[ "$preserve_xml" == "true" && -f "$install_xml" ]]; then
        install_xml_backup=$(mktemp /tmp/apex_install_xml_XXXXXX)
        info "Preserving install.xml → $install_xml_backup"
        cp "$install_xml" "$install_xml_backup"
    fi

    # ── Remove existing app directory ─────────────────────────────────────────
    if [[ -d "$app_dir" ]]; then
        info "Removing $app_dir ..."
        rm -rf "$app_dir"
    fi

    # ── Run APEX export ───────────────────────────────────────────────────────
    info "Exporting to: $raw_extract_to"
    sql -name "$SQLC_CONN" <<SQLEOF
whenever sqlerror exit failure
lb generate-apex-object -applicationid ${app_id} -split -skipexportdate -exporiginalids -ovf -audittype NULL -dir ${extract_to}
exit
SQLEOF
    sql_rc=$?

    if [[ $sql_rc -ne 0 ]]; then
        warn "Export of app $app_id failed (exit $sql_rc)."
        if [[ -n "$install_xml_backup" && -f "$install_xml_backup" ]]; then
            mkdir -p "$app_dir"
            info "Restoring install.xml after failed export..."
            cp "$install_xml_backup" "$install_xml"
            rm -f "$install_xml_backup"
        fi
        export_failed=1
        continue
    fi

    # ── Restore preserved install.xml ─────────────────────────────────────────
    if [[ -n "$install_xml_backup" && -f "$install_xml_backup" ]]; then
        info "Restoring install.xml..."
        cp "$install_xml_backup" "$install_xml"
        rm -f "$install_xml_backup"
        info "install.xml restored."
    fi

    echo "  App $app_id exported successfully."
    echo
done

if [[ $export_failed -ne 0 ]]; then
    err "One or more exports failed."
fi

echo "All exports completed."
