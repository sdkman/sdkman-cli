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
    GVM_FORCE_SELFUPDATE="$1"
	if [[ "$GVM_AVAILABLE" == "false" ]]; then
		echo "$OFFLINE_MESSAGE"

	elif [[ "$GVM_REMOTE_VERSION" == "$GVM_VERSION" && "$GVM_FORCE_SELFUPDATE" != "force" ]]; then
		echo "No update available at this time."

	else
		curl -s "${GVM_SERVICE}/selfupdate" | bash
	fi
	unset GVM_FORCE_SELFUPDATE
}

function __sdkman_auto_update {

    local GVM_REMOTE_VERSION="$1"
    local GVM_VERSION="$2"

    GVM_DELAY_UPGRADE="${GVM_DIR}/var/delay_upgrade"

    if [[ -n "$(find "$GVM_DELAY_UPGRADE" -mtime +1)" && ( "$GVM_REMOTE_VERSION" != "$GVM_VERSION" ) ]]; then
        echo ""
        echo ""
        echo "ATTENTION: A new version of GVM is available..."
        echo ""
        echo "The current version is $GVM_REMOTE_VERSION, but you have $GVM_VERSION."
        echo ""

        if [[ "$gvm_auto_selfupdate" != "true" ]]; then
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

        touch "${GVM_DELAY_UPGRADE}"
    fi

}