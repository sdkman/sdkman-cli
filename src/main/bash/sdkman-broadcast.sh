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

function sdkman_update_broadcast_or_force_offline {
    BROADCAST_LIVE_ID=$(sdkman_determine_broadcast_id)

    sdkman_force_offline_on_proxy "$BROADCAST_LIVE_ID"
    if [[ "$SDKMAN_FORCE_OFFLINE" == 'true' ]]; then BROADCAST_LIVE_ID=""; fi

    sdkman_display_online_availability
    sdkman_determine_offline "$BROADCAST_LIVE_ID"

	sdkman_update_broadcast "$COMMAND" "$BROADCAST_LIVE_ID"
}

function sdkman_determine_broadcast_id {
	if [[ "$SDKMAN_FORCE_OFFLINE" == "true" || "$COMMAND" == "offline" && "$QUALIFIER" == "enable" ]]; then
		echo ""
	else
		echo $(curl -s "${SDKMAN_BROADCAST_SERVICE}/broadcast/latest/id")
	fi
}

function sdkman_display_online_availability {
	if [[ -z "$BROADCAST_LIVE_ID" && "$SDKMAN_ONLINE" == "true" && "$COMMAND" != "offline" ]]; then
		echo "$OFFLINE_WARNING"
	fi
}

function sdkman_update_broadcast {
	local command="$1"
	local broadcast_live_id="$2"

	local broadcast_id_file="${SDKMAN_DIR}/var/broadcast_id"
	local broadcast_text_file="${SDKMAN_DIR}/var/broadcast"

	local broadcast_old_id=""

	if [[ -f "$broadcast_id_file" ]]; then
		broadcast_old_id=$(cat "$broadcast_id_file");
	fi

	if [[ -f "$broadcast_text_file" ]]; then
		BROADCAST_OLD_TEXT=$(cat "$broadcast_text_file");
	fi

	if [[ "${SDKMAN_AVAILABLE}" == "true" && "$broadcast_live_id" != "${broadcast_old_id}" && "$command" != "selfupdate" && "$command" != "flush" ]]; then
		mkdir -p "${SDKMAN_DIR}/var"

		echo "${broadcast_live_id}" > "$broadcast_id_file"

		BROADCAST_LIVE_TEXT=$(curl -s "${SDKMAN_BROADCAST_SERVICE}/broadcast/latest")
		echo "${BROADCAST_LIVE_TEXT}" > "${broadcast_text_file}"
		echo "${BROADCAST_LIVE_TEXT}"
	fi
}
