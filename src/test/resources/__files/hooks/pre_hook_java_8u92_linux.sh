#!/bin/bash
function __sdkman_pre_installation_hook {
    echo "Returning non-zero code from pre-installation hook..."
    echo "Can not install java 8u92 at this time."
    return 1
}
