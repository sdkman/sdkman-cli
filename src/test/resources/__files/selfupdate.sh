#!/bin/bash
#
#   Copyright 2012 Marco Vermeulen
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

echo ""
echo "Updating SDKman..."

SDKMAN_VERSION="x.y.z"

sdkman_bin_folder="${SDKMAN_DIR}/bin"
sdkman_stage_folder="${SDKMAN_DIR}/tmp/stage"
sdkman_src_folder="${SDKMAN_DIR}/src"

echo "Purge existing scripts..."
rm -rf "${sdkman_bin_folder}"
rm -rf "${sdkman_src_folder}"

echo "Refresh directory structure..."
mkdir -p "${SDKMAN_DIR}/bin"
mkdir -p "${SDKMAN_DIR}/ext"
mkdir -p "${SDKMAN_DIR}/etc"
mkdir -p "${SDKMAN_DIR}/src"
mkdir -p "${SDKMAN_DIR}/var"
mkdir -p "${SDKMAN_DIR}/tmp"

# drop version token
echo "$SDKMAN_VERSION" > "${SDKMAN_DIR}/var/version"

echo "Prime the config file..."
sdkman_config_file="${SDKMAN_DIR}/etc/config"
touch "${sdkman_config_file}"

echo "Extract script archive..."

echo "Unziping scripts to: ${sdkman_stage_folder}"

echo "Moving sdkman-init file to bin folder..."

echo "Move remaining module scripts to src folder: ${sdkman_src_folder}"

echo "Clean up staging folder..."

echo ""
echo ""
echo "Successfully upgraded SDKman."
echo ""
echo "Please open a new terminal, or run the following in the existing one:"
echo ""
echo "    source \"${SDKMAN_DIR}/bin/sdkman-init.sh\""
echo ""
echo ""
