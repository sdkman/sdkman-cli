#!/bin/bash
function __sdkman_post_installation_hook {
    echo "Returning non-zero code from post-install hook..."
    echo "Can not install java 8u92 at this time."
    return 1
}
