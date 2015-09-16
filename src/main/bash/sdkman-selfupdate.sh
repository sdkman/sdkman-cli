#!/bin/bash

#
#   Copyright 2012 Marco Vermeulen
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

function __sdkman_selfupdate {
    SDKMAN_FORCE_SELFUPDATE="$1"
	if [[ "$SDKMAN_AVAILABLE" == "false" ]]; then
		echo "$OFFLINE_MESSAGE"

	elif [[ "$SDKMAN_REMOTE_VERSION" == "$SDKMAN_VERSION" && "$SDKMAN_FORCE_SELFUPDATE" != "force" ]]; then
		echo "No update available at this time."

	else
		curl -s "${SDKMAN_SERVICE}/selfupdate" | bash
	fi
	unset SDKMAN_FORCE_SELFUPDATE
}

function __sdkman_auto_update {

    local SDKMAN_REMOTE_VERSION="$1"
    local SDKMAN_VERSION="$2"

    SDKMAN_DELAY_UPGRADE="${SDKMAN_DIR}/var/delay_upgrade"

    if [[ -n "$(find "$SDKMAN_DELAY_UPGRADE" -mtime +1)" && ( "$SDKMAN_REMOTE_VERSION" != "$SDKMAN_VERSION" ) ]]; then
        echo ""
        echo ""
        echo "ATTENTION: A new version of SDKman is available..."
        echo ""
        echo "The current version is $SDKMAN_REMOTE_VERSION, but you have $SDKMAN_VERSION."
        echo ""

        if [[ "$sdkman_auto_selfupdate" != "true" ]]; then
            echo -n "Would you like to upgrade now? (Y/n)"
            read upgrade
        fi

        if [[ -z "$upgrade" ]]; then upgrade="Y"; fi

        if [[ "$upgrade" == "Y" || "$upgrade" == "y" ]]; then
            __sdkman_selfupdate
            unset upgrade
        else
            echo "Not upgrading today..."
        fi

        touch "${SDKMAN_DELAY_UPGRADE}"
    fi

}