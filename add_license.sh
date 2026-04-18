#!/bin/bash

check_file() {
  local file="$1"
  local check_liquibase="$2"
  if [ "$check_liquibase" = "true" ]; then
    grep -qE "^--liquibase formatted sql[[:space:]]*$" "$file" && [ $(grep -cE "^--liquibase formatted sql[[:space:]]*$" "$file") -eq 1 ]
    has_liquibase=$?
  else
    has_liquibase=0
  fi
  [ $has_liquibase -eq 0 ] && ! grep -q "Universal Permissive License" "$file"
}

process_file() {
  local file="$1"
  local check_lb="$2"
  local line_number=0
  if [ "$check_lb" = "true" ]; then
    line_number=1
  fi

  if check_file "$file" "$check_lb"; then
    echo "processing file ${file}..."
    ed -s "$file" <<EOF
${line_number}r development/licence_snip.txt
w
EOF
  fi
}

do_process_files() {
  local starting_dir="${1}"
  local check_liquibase="${2}"
  find ${starting_dir} -type f -name "*.sql" -exec bash -c 'process_file "$1" '"$check_liquibase" _ {} \;
}

export -f check_file process_file do_process_files

# ***********************************************************************
# ** SQL files                                                         **
# in product, find liquified files without licence text
# ***********************************************************************
do_process_files "./product" "true"

# ***********************************************************************
# ** APEX SQL files                                                    **
# find non liquied files without licence text.
# ***********************************************************************
do_process_files "./product/sert/apex/application" "false"

# ***********************************************************************
# highlight potential non-liquified files                              **
# ***********************************************************************
echo "***********************************************************************"
echo "* non-liquified files in product directories, will appear below"
echo "* please verify if they should be liquified "
echo "***********************************************************************"
find product/ -type f -name "*.sql" \
    -not -path "*/application/*" \
    -not -path "*/acdc/*" \
    -not -path "*/uninstall/*" \
    -exec bash -c '[[ "$(head -n 1 {})" != "--liquibase formatted sql"* ]] && echo {}' \;