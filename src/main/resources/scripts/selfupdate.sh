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
TMP_ZIP="/tmp/res.zip"
PLATFORM=$(uname)

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
curl -s "${GVM_SERVICE}/res?platform=${PLATFORM}" > "${TMP_ZIP}"
unzip -qo "${TMP_ZIP}" -d "${BIN_FOLDER}"
rm "${TMP_ZIP}"

chmod +x "${BIN_FOLDER}"/*

echo ""
echo "Successfully upgraded GVM."
echo ""

echo ""
echo "VERY IMPORTANT!"
echo ""
echo "When upgrading from 0.8.x to 0.9.x, it is required to"
echo "close the current terminal and open a new one."
echo ""
echo "GVM will now stop working in this shell."
echo ""
