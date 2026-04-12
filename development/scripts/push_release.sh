#!/usr/bin/env bash
set -o pipefail
set -e

# 24.2.8

buildVersion="$1"

if [[ -z "$buildVersion" ]]
then
  echo "Build version must be set in argument 1. Typically 24.1.10, where 24.1 is" >&2
  echo "the APEX version, and 10 is the 10th version for that APEX version." >&2
  echo ""
  echo "Example: ./development/scripts/push_release.sh 24.1.10"

  exit 1
fi

targetFile="sert_${buildVersion}.zip"
ARTIFACTORY_BASE_URL="https://artifacthub-iad.oci.oraclecorp.com"
publishBaseUrl="${ARTIFACTORY_BASE_URL}/artifactory/xgbu-ace-dev/sert"
# Properties not being set in the current iteration
# apiBaseUrl="${ARTIFACTORY_BASE_URL}/api/storage/xgbu-ace-dev/sert"

# URL's for the version release (e.g. sert_23.11.01.zip)
publishUrl="${publishBaseUrl}/${targetFile}"

# Create a temporary folder to copy files into that we want to form the zip/release
# This file-set may evolve over time.
tmpDir=$(mktemp -d -p .)

# Disable SC2086 because we want the product files to be read directly so it can
# be sed to copy all the specified files, rather than being treated as a single
# value.
# shellcheck disable=SC2086

# TODO: PRODUCT_FILES definition is temporary until we work on the new zip publishing
# solution
PRODUCT_FILES='product/ doc/ controller.xml install_prod.sql install.sql sert.properties THIRD_PARTY_LICENSES.txt LICENSE.md README.md'
cp -r ${PRODUCT_FILES} "${tmpDir}/"

# Substitute the version string in our release file
sed -i "s|#DEVELOPMENT_BUILD#|${buildVersion}|g" "${tmpDir}/product/sert/sert_core/seed_data/055_prefs_internal_merge.sql"

(cd "${tmpDir}" && zip -r "../${targetFile}" ./*)

# We have no need for the temp folder now we have zipped up all the files
rm -rf "${tmpDir}"

# Publishing process can include two files - the version bound to the tag name
# and a separate version (which is the same file with a different name) using
# -latest, so consumers can just always pull the latest.
#
# Additionally, the published file we will attach properties with the version
# so consumers can do things programatically - and the short SHA of the reference
# commit. This is helpful to go to the point in time in the git history.
# More info on the properties API here: https://jfrog.com/help/r/jfrog-rest-apis/set-item-properties

# First publish the versioned file
curl -H "Authorization:Bearer ${G_ARTIFACTORY_ACCESS_TOKEN}" -T "${targetFile}" "${publishUrl}"
# TODO: Fix properties URL handling
# propertiesUrl="${apiBaseUrl}/${targetFile}?properties=version=${buildVersion};ci_commit_short_sha=${CI_COMMIT_SHORT_SHA}"
# curl -X PUT --fail -H "Authorization:Bearer ${ARTIFACTORY_ACCESS_TOKEN}" "${propertiesUrl}"

# TODO: Beta handling
# Then create a latest version. BUT we don't want to do this on beta tags. A
# pattern to adapt is to use `beta.` prefix on the tag when doing some testing.
# In that scenario, we don't want to affect the latest version that gets published.
# if [[ ! "${CI_COMMIT_TAG}" =~ ^beta\..+ ]]
# then
#   curl -H "Authorization:Bearer ${ARTIFACTORY_ACCESS_TOKEN}" -T "${targetFile}" "${publishUrlLatest}"
#   propertiesUrlLatest="${apiBaseUrl}/sert_latest.zip?properties=version=${buildVersion};ci_commit_short_sha=${CI_COMMIT_SHORT_SHA}"
#   curl -X PUT --fail -H "Authorization:Bearer ${ARTIFACTORY_ACCESS_TOKEN}" "${propertiesUrlLatest}"
# fi
