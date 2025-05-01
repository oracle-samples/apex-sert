#!/bin/bash
for file in $(find ./product/sert/apex -type file -iname '*.sql'  -exec  grep  -H -E -o -c  "\-\-liquibase formatted sql"  {} \; | sed 's/..$//')
do
  if [ 0 -eq $(grep  -c  "Universal Permissive License"  ${file} ) ]
  then
    echo "add license for ${file}"
    ed -s ${file} <<<$'1r development/licence_snip.txt\nw'
  fi
done
# fix format trick
#'
#  ed -s ${file} <<<$'0r development/licence_snip.txt\nw'