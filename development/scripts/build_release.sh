#!/usr/bin/env bash
# set -o pipefail
set -e

# 24.2.8
# usage build_zip.sh 24.2.9
buildVersion="$1"

if [[ -z "$buildVersion" ]]
then
  echo "Build version must be set in argument 1. Typically 24.1.10, where 24.1 is" >&2
  echo "the APEX version, and 10 is the 10th version for that APEX version." >&2
  echo ""
  echo "Example: ./development/scripts/build_release.sh 24.1.10"

  exit 1
fi

targetFile="sert_${buildVersion}.zip"

# Create a temporary folder to copy files into that we want to form the zip/release
# This file-set may evolve over time.
tmpDir=$(mktemp -d -p .)

# solution
PRODUCT_FILES='product doc controller.xml install_prod.sql install.sql sert.properties README.md'
cp -r ${PRODUCT_FILES} "${tmpDir}/"

(cd "${tmpDir}" && zip -r "../${targetFile}" ./*)

# We have no need for the temp folder now we have zipped up all the files
rm -rf "${tmpDir}"
