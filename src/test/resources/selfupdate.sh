#!/bin/bash

echo "Updating gvm scripts..."
TMP_ZIP="/tmp/res.zip"
BIN_FOLDER="/tmp/gvm/bin"

echo "Creating $BIN_FOLDER"
mkdir -p "$BIN_FOLDER"

echo "Calling $GVM_SERVICE/res?platform=$PLATFORM"
curl -s "$GVM_SERVICE/res?platform=$PLATFORM" > "$TMP_ZIP"

echo "Unzip to $BIN_FOLDER"
unzip -qo "$TMP_ZIP" -d "$BIN_FOLDER"
rm "$TMP_ZIP"

chmod +x "$BIN_FOLDER"/*

echo ""
echo "Successfully upgraded GVM."
echo ""
