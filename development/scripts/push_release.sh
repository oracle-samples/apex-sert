#!/usr/bin/env bash
set -o pipefail
set -e

# There are cases where you want to build artifact in any given branch. In that
# scenario - we use date string, but primarily this should always be driven from
# the tag name.
if [[ "${CI_COMMIT_TAG}" != "" ]]
then
  buildVersion="${CI_COMMIT_TAG}"
  echo "Publishing artifacts for tag: ${CI_COMMIT_TAG}"
else
  buildVersion=$(printf "%s_%s" "$(date -u +%y.%m.%d)" "${CI_PIPELINE_ID}")
  echo "Building artifacts for tag: ${buildVersion}"
fi

targetFile="sert_${buildVersion}.zip"
publishBaseUrl="${P_ARTIFACTORY_BASE_URL}/artifactory/xgbu-ace-dev/sert"
apiBaseUrl="${P_ARTIFACTORY_BASE_URL}/api/storage/xgbu-ace-dev/sert"

# URL's for the version release (e.g. sert_23.11.01.zip)
publishUrl="${publishBaseUrl}/${targetFile}"

# URL's for teh latest release (e.g. sert_latest.zip). Whenever doing a new build
# we always duplicate the release file into a file ending in latest. This is so
# people taking it up can always just grab the latest release, but we still have
# a version history if anyone wanted to grab a specific version.
publishUrlLatest="${publishBaseUrl}/sert_latest.zip"

# Create a temporary folder to copy files into that we want to form the zip/release
# This file-set may evolve over time.
tmpDir=$(mktemp -d -p .)

# Disable SC2086 because we want the product files to be read directly so it can
# be sed to copy all the specified files, rather than being treated as a single
# value.
# shellcheck disable=SC2086
cp -r ${PRODUCT_FILES} "${tmpDir}/"

# Substitute the version string in our release file
sed -i "s|#DEVELOPMENT_BUILD#|${buildVersion}|g" "${tmpDir}/product/sert/sert_core/seed_data/055_prefs_internal_merge.sql"

(cd "${tmpDir}" && zip -r "../${targetFile}" ./*)

# We have no need for the temp folder now we have zipped up all the files
rm -rf "${tmpDir}"

# Only publish the artifact to artifactory on tag pipeline
if [[ "${CI_COMMIT_TAG}" != "" ]]
then
  # Publishing process can include two files - the version bound to the tag name
  # and a separate version (which is the same file with a different name) using
  # -latest, so consumers can just always pull the latest.
  #
  # Additionally, the published file we will attach properties with the version
  # so consumers can do things programatically - and the short SHA of the reference
  # commit. This is helpful to go to the point in time in the git history.
  # More info on the properties API here: https://jfrog.com/help/r/jfrog-rest-apis/set-item-properties

  # First publish the versioned file
  curl -H "Authorization:Bearer ${ARTIFACTORY_ACCESS_TOKEN}" -T "${targetFile}" "${publishUrl}"
  propertiesUrl="${apiBaseUrl}/${targetFile}?properties=version=${buildVersion};ci_commit_short_sha=${CI_COMMIT_SHORT_SHA}"
  curl -X PUT --fail -H "Authorization:Bearer ${ARTIFACTORY_ACCESS_TOKEN}" "${propertiesUrl}"

  # Then create a latest version. BUT we don't want to do this on beta tags. A
  # pattern to adapt is to use `beta.` prefix on the tag when doing some testing.
  # In that scenario, we don't want to affect the latest version that gets published.
  if [[ ! "${CI_COMMIT_TAG}" =~ ^beta\..+ ]]
  then
    curl -H "Authorization:Bearer ${ARTIFACTORY_ACCESS_TOKEN}" -T "${targetFile}" "${publishUrlLatest}"
    propertiesUrlLatest="${apiBaseUrl}/sert_latest.zip?properties=version=${buildVersion};ci_commit_short_sha=${CI_COMMIT_SHORT_SHA}"
    curl -X PUT --fail -H "Authorization:Bearer ${ARTIFACTORY_ACCESS_TOKEN}" "${propertiesUrlLatest}"
  fi
fi
