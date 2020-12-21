#!/usr/bin/env bash
# convert tar.gz to zip
function __sdkman_post_installation_hook() {
	echo "POST: converting $binary_input to $zip_output"
	mkdir -p "$SDKMAN_DIR/tmp/out"
	/usr/bin/env tar zxvf "$binary_input" -C "${SDKMAN_DIR}/tmp/out"
	cd "${SDKMAN_DIR}/tmp/out"
	/usr/bin/env zip -r "$zip_output" .
}
