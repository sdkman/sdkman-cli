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
echo "Updating gvm scripts..."
TMP_ZIP="/tmp/res-$(printf %05d $RANDOM).zip"

PLATFORM=$(uname)

GVM_DIR="$HOME/.gvm"

mkdir -p "${GVM_DIR}/ext"
mkdir -p "${GVM_DIR}/etc"
mkdir -p "${GVM_DIR}/groovy"
mkdir -p "${GVM_DIR}/groovy"
mkdir -p "${GVM_DIR}/grails"
mkdir -p "${GVM_DIR}/griffon"
mkdir -p "${GVM_DIR}/vert.x"


CONFIG_FILE="${GVM_DIR}/etc/config"
if [[ ! -f "${CONFIG_FILE}" ]]; then
	echo "isolated_mode=0" > "${CONFIG_FILE}"
fi

BIN_FOLDER="${GVM_DIR}/bin"
mkdir -p "${BIN_FOLDER}"
echo "Download new scripts to: ${TMP_ZIP}"
curl -s "${GVM_SERVICE}/res?platform=${PLATFORM}" > "${TMP_ZIP}"

echo "Unziping scripts to: ${BIN_FOLDER}"
unzip -qo "${TMP_ZIP}" -d "${BIN_FOLDER}"

echo "Cleaning up ${TMP_ZIP}"
rm "${TMP_ZIP}"

echo "Changing file permissions in: ${BIN_FOLDER}"
chmod +x "${BIN_FOLDER}"/*

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
