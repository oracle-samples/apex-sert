#!/bin/bash
# export_apex.sh — Export APEX applications to source control via SQLcl
#
# Usage:  ./export_apex.sh <app_id> [<app_id> ...]
# Requires:
#   $SQLC_CONN  — name of a saved SQLcl / SQL Developer connection
#   jq          
#       Mac                     — brew install jq
#       WSL                     - sudo apt install jq
#       Linux (debian/Ubuntu)   - sudo apt-get install jq
#       oracle Linux            - sudo dnf install jq
#   sql         — SQLcl in PATH

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
CONFIG_FILE="${REPO_ROOT}/apex_config.json"

# ── Helpers ───────────────────────────────────────────────────────────────────
err()  { echo "ERROR: $*" >&2; exit 1; }
warn() { echo "WARN:  $*" >&2; }
info() { echo "  $*"; }

# sha256_file <path>   — uppercase SHA-256 of a file
sha256_file() {
    if command -v sha256sum &>/dev/null; then
        sha256sum "$1" | awk '{print toupper($1)}'
    else
        shasum -a 256 "$1" | awk '{print toupper($1)}'
    fi
}

# sha256_string <str>  — uppercase SHA-256 of a string (no trailing newline added)
sha256_string() {
    if command -v sha256sum &>/dev/null; then
        printf '%s' "$1" | sha256sum | awk '{print toupper($1)}'
    else
        printf '%s' "$1" | shasum -a 256 | awk '{print toupper($1)}'
    fi
}

# stamp_checksums <app_dir>
# Phase 1 — calculate SHA-256 of every .sql file's raw exported content
# Phase 2 — derive app_checksum as SHA-256 of all file checksums concatenated (sorted path order)
# Phase 3 — prepend two header lines to every .sql file
stamp_checksums() {
    local app_dir=$1
    local checksum_map
    checksum_map=$(mktemp /tmp/apex_checksums_XXXXXX)

    # Collect .sql files, null-delimited then sorted for determinism
    local file_count=0
    while IFS= read -r -d '' f; do
        fc=$(sha256_file "$f")
        printf '%s\t%s\n' "$f" "$fc" >> "$checksum_map"
        (( file_count++ )) || true
    done < <(find "$app_dir" -name "*.sql" -print0 | sort -z)

    if [[ $file_count -eq 0 ]]; then
        rm -f "$checksum_map"
        info "No .sql files found — skipping checksum."
        return
    fi

    info "Stamping checksums for $file_count .sql file(s)..."

    # app_checksum = SHA-256 of all per-file checksums concatenated (no separators)
    local combined app_checksum
    combined=$(cut -f2 "$checksum_map" | tr -d '\n')
    app_checksum=$(sha256_string "$combined")
    info "App checksum: $app_checksum"

    # Prepend headers to each file
    while IFS=$'\t' read -r f fc; do
        [[ -z "$f" ]] && continue
        {
            printf 'prompt app_checksum: %s\n' "$app_checksum"
            printf '%s\n' "-- file_checksum: ${fc}"
            cat "$f"
        } > "${f}.tmp" && mv "${f}.tmp" "$f"
    done < "$checksum_map"

    rm -f "$checksum_map"
    info "Checksums stamped."
}

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
lb generate-apex-object -applicationid ${app_id} -split -skipexportdate -ovf -audittype DATES_ONLY -dir ${extract_to}
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

    # ── Remove apex_install.xml generated alongside the split export ─────────
    apex_install_xml="${extract_to}/apex_install.xml"
    if [[ -f "$apex_install_xml" ]]; then
        info "Removing generated apex_install.xml ..."
        rm -f "$apex_install_xml"
    fi

    # ── Stamp checksums ───────────────────────────────────────────────────────
    stamp_checksums "$app_dir"

    echo "  App $app_id exported successfully."
    echo
done

if [[ $export_failed -ne 0 ]]; then
    err "One or more exports failed."
fi

echo "All exports completed."
