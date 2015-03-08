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

function __gvmtool_broadcast {
	if [ "${BROADCAST_HIST}" ]; then
		echo "${BROADCAST_HIST}"
	else
		echo "${BROADCAST_LIVE}"
	fi
}

function __gvmtool_update_broadcast {
	local command="$1"
	local broadcast_live_id="$2"

	local broadcast_id_file="${GVM_DIR}/var/broadcast_id"
	local broadcast_file="${GVM_DIR}/var/broadcast"

	local broadcast_hist_id=""

	if [[ -f "$broadcast_id_file" ]]; then
		broadcast_hist_id=$(cat "$broadcast_id_file");
	fi

	if [[ -f "$broadcast_file" ]]; then
		BROADCAST_HIST=$(cat "$broadcast_file");
	fi

	if [[ "${GVM_AVAILABLE}" == "true" && "$broadcast_live_id" != "${broadcast_hist_id}" && "$command" != "selfupdate" && "$command" != "flush" ]]; then
		mkdir -p "${GVM_DIR}/var"

		echo "${broadcast_live_id}" > "$broadcast_id_file"

		BROADCAST_LIVE=$(curl -s "${GVM_BROADCAST_SERVICE}/broadcast/${broadcast_live_id}")
		echo "${BROADCAST_LIVE}" > "${broadcast_file}"
		echo "${BROADCAST_LIVE}"
	fi
}
