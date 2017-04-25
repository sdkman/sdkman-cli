#!/usr/bin/env bash
function __sdkman_pre_installation_hook {
    echo "Inside pre-install hook..."
    cookie="$SDKMAN_DIR/var/cookie"
    if [[ -f "$cookie" ]]; then rm "$cookie"; fi
    echo "oraclelicense=accept-securebackup-cookie" > "$cookie"
    echo "Dropped cookie..."
}