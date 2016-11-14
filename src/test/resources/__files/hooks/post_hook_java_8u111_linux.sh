#!/bin/bash
echo "Inside post-install hook..."
mkdir -p "$SDKMAN_DIR/tmp/out"
tar zxvf "$binary_input" -C "${SDKMAN_DIR}/tmp/out"
cd "${SDKMAN_DIR}/tmp/out"
zip -r "$zip_output" .
rm "$SDKMAN_DIR/var/cookie"
echo "Leaving post-install hook..."