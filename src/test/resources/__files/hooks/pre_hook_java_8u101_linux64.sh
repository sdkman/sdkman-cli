#!/usr/bin/env bash
function __sdkman_pre_installation_hook {
    echo -n "Do you agree to the terms of this agreement? (Y/n)"
    read agree

    cookie="$SDKMAN_DIR/var/cookie"
    if [[ -f "$cookie" ]]; then rm "$cookie"; fi
    echo "oraclelicense=accept-securebackup-cookie" > "$cookie"
    echo "Dropped cookie..."
}