#!/bin/bash
# run this script from the root directory of the project
# it will add licence snippet to any APEX app file that is missing it.
for dir in ./product/sert/apex ./product/guardian/apex; do
  for file in $(find "$dir" -type file -iname '*.sql'  -exec  grep  -H -E -o -c  "\-\-liquibase formatted sql"  {} \; | sed 's/..$//')
  do
    if [ 0 -eq $(grep  -c  "Universal Permissive License"  ${file} ) ]
    then
      echo "add license for ${file}"
      ed -s ${file} <<<$'1r development/licence_snip.txt\nw'
    fi
  done
done
# fix format trick
#'
#  ed -s ${file} <<<$'0r development/licence_snip.txt\nw'
