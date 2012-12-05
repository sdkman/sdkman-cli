#!/bin/bash

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
