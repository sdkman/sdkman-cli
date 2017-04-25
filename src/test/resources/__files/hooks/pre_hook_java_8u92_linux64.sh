#!/usr/bin/env bash
function __sdkman_pre_installation_hook {
    echo "Oracle requires that you agree with the Oracle Binary Code License Agreement"
    echo "prior to installation. The license agreement can be found at:"
    echo ""
    echo "  http://www.oracle.com/technetwork/java/javase/terms/license/index.html"
    echo ""
    echo -n "Do you agree to the terms of this agreement? (Y/n)"
    read agree
    echo ""
    echo "Not installing java 8u92 at this time..."
    return 1
}
