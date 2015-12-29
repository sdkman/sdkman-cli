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

function __sdkman_broadcast {
	if [ "${BROADCAST_OLD_TEXT}" ]; then
		echo "${BROADCAST_OLD_TEXT}"
	else
		echo "${BROADCAST_LIVE_TEXT}"
	fi
}

function sdkman_update_broadcast_and_service_availability {
    BROADCAST_LIVE_ID=$(sdkman_determine_broadcast_id)
    sdkman_set_availability "$BROADCAST_LIVE_ID"
	sdkman_update_broadcast "$BROADCAST_LIVE_ID"
}

function sdkman_determine_broadcast_id {
	if [[ "$SDKMAN_FORCE_OFFLINE" == "true" || "$COMMAND" == "offline" && "$QUALIFIER" == "enable" ]]; then
		echo ""
	else
		echo $(curl -s "${SDKMAN_BROADCAST_SERVICE}/broadcast/latest/id")
	fi
}

function sdkman_set_availability {
    local broadcast_id="$1"
	local detect_html="$(echo "$broadcast_id" | tr '[:upper:]' '[:lower:]' | grep 'html')"
	if [[ -z "$broadcast_id" ]]; then
		SDKMAN_AVAILABLE="false"
		sdkman_display_offline_warning "$broadcast_id"
	elif [[ -n "$detect_html" ]]; then
		SDKMAN_AVAILABLE="false"
		sdkman_display_proxy_warning
	else
		SDKMAN_AVAILABLE="true"
	fi
}

function sdkman_display_offline_warning {
	local broadcast_id="$1"
	if [[ -z "$broadcast_id" && "$COMMAND" != "offline" && "$SDKMAN_FORCE_OFFLINE" != "true" ]]; then
        echo "==== INTERNET NOT REACHABLE! ==============================="
        echo ""
        echo " Some functionality is disabled or only partially available."
        echo " If this persists, please enable the offline mode:"
        echo ""
        echo "   $ sdk offline enable"
        echo ""
        echo "============================================================"
        echo ""
	fi
}

function sdkman_display_proxy_warning {
	echo "==== PROXY DETECTED! ======================================="
	echo "Please ensure you have open internet access to continue."
	echo "============================================================"
    echo ""
}

function sdkman_update_broadcast {
	local broadcast_live_id="$1"

	local broadcast_id_file="${SDKMAN_DIR}/var/broadcast_id"
	local broadcast_text_file="${SDKMAN_DIR}/var/broadcast"

	local broadcast_old_id=""

	if [[ -f "$broadcast_id_file" ]]; then
		broadcast_old_id=$(cat "$broadcast_id_file");
	fi

	if [[ -f "$broadcast_text_file" ]]; then
		BROADCAST_OLD_TEXT=$(cat "$broadcast_text_file");
	fi

	if [[ "${SDKMAN_AVAILABLE}" == "true" && "$broadcast_live_id" != "${broadcast_old_id}" && "$COMMAND" != "selfupdate" && "$COMMAND" != "flush" ]]; then
		mkdir -p "${SDKMAN_DIR}/var"

		echo "${broadcast_live_id}" > "$broadcast_id_file"

		BROADCAST_LIVE_TEXT=$(curl -s "${SDKMAN_BROADCAST_SERVICE}/broadcast/latest")
		echo "${BROADCAST_LIVE_TEXT}" > "${broadcast_text_file}"
		echo "${BROADCAST_LIVE_TEXT}"
	fi
}
