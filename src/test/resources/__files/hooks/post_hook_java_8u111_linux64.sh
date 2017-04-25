#!/usr/bin/env bash
function __sdkman_post_installation_hook {
    echo "Inside post-install hook..."
    mkdir -p "$SDKMAN_DIR/tmp/out"
    /usr/bin/env tar zxvf "$binary_input" -C "${SDKMAN_DIR}/tmp/out"
    cd "${SDKMAN_DIR}/tmp/out"
    /usr/bin/env zip -r "$zip_output" .
    rm "$SDKMAN_DIR/var/cookie"
    echo "Leaving post-install hook..."
}