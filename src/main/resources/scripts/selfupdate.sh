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
echo "Updating gvm..."

GVM_VERSION="@GVM_VERSION@"
if [ -z "${GVM_DIR}" ]; then
	GVM_DIR="$HOME/.gvm"
fi

gvm_platform=$(uname)
gvm_bin_folder="${GVM_DIR}/bin"
gvm_tmp_zip="${GVM_DIR}/tmp/res-${GVM_VERSION}.zip"
gvm_stage_folder="${GVM_DIR}/tmp/stage"
gvm_src_folder="${GVM_DIR}/src"

echo "Refresh directory structure..."
mkdir -p "${GVM_DIR}/bin"
mkdir -p "${GVM_DIR}/ext"
mkdir -p "${GVM_DIR}/etc"
mkdir -p "${GVM_DIR}/src"
mkdir -p "${GVM_DIR}/var"
mkdir -p "${GVM_DIR}/tmp"

mkdir -p "${GVM_DIR}/groovy"
mkdir -p "${GVM_DIR}/gradle"
mkdir -p "${GVM_DIR}/griffon"
mkdir -p "${GVM_DIR}/grails"
mkdir -p "${GVM_DIR}/vert.x"

echo "Prime the config file..."
gvm_config_file="${GVM_DIR}/etc/config"
echo "isolated_mode=1" > "${gvm_config_file}"

echo "Download new scripts to: ${gvm_tmp_zip}"
curl -s "${GVM_SERVICE}/res?platform=${gvm_platform}" > "${gvm_tmp_zip}"

echo "Unziping scripts to: ${gvm_stage_folder}"
unzip -qo "${gvm_tmp_zip}" -d "${gvm_stage_folder}"

echo "Moving gvm-init file to bin folder..."
mv -v "${gvm_stage_folder}/gvm-init.sh" "${gvm_bin_folder}"

echo "Changing file permissions for init script..."
chmod +x "${gvm_bin_folder}/gvm-init.sh"

echo "Move remaining module scripts to src folder: ${gvm_src_folder}"
mv -v "${gvm_stage_folder}"/gvm-* "${gvm_src_folder}"

echo "Clean up staging folder..."
rm -rf "${gvm_stage_folder}"

echo "Clean up local variables..."
unset gvm_platform gvm_bin_folder gvm_tmp_zip gvm_stage_folder gvm_src_folder

echo ""
echo ""
echo "Successfully upgraded GVM."
echo ""
echo "VERY IMPORTANT!!!"
echo ""
echo "GVM will stop working in the current shell when upgrading from 0.8.x to 0.9.x"
echo ""
echo "Please open a new terminal, or run the following in the existing one:"
echo ""
echo "    source \"${GVM_DIR}/bin/gvm-init.sh\""
echo ""
echo ""
