#!/usr/bin/env bash
function __sdkman_post_installation_hook {
    echo "Download has failed, aborting!"
    echo ""
    echo "Can not install java 8u101 at this time..."

    cookie="$SDKMAN_DIR/var/cookie"
    if [[ -f "$cookie" ]]; then rm "$cookie"; fi

    return 1
}
