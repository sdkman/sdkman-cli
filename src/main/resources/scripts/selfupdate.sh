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

GVM_DIR="$HOME/.gvm"
mkdir -p "${GVM_DIR}/ext"
mkdir -p "${GVM_DIR}/groovy"
mkdir -p "${GVM_DIR}/groovy"
mkdir -p "${GVM_DIR}/grails"
mkdir -p "${GVM_DIR}/griffon"
mkdir -p "${GVM_DIR}/vert.x"

BIN_FOLDER="${GVM_DIR}/bin"
mkdir -p "${BIN_FOLDER}"
curl -s "${GVM_SERVICE}/res?platform=${PLATFORM}" > "${TMP_ZIP}"
unzip -qo "${TMP_ZIP}" -d "${BIN_FOLDER}"
rm "${TMP_ZIP}"

chmod +x "${BIN_FOLDER}"/*

echo ""
echo "Successfully upgraded GVM."
echo ""
