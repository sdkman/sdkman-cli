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
	COMMAND="$1"
	BROADCAST_FILE="${GVM_DIR}/var/broadcast"
	if [ -f "${BROADCAST_FILE}" ]; then
		BROADCAST_HIST=$(cat "${BROADCAST_FILE}")
	fi

	if [[ "${GVM_AVAILABLE}" == "true" && "${BROADCAST_LIVE}" != "${BROADCAST_HIST}" && "$COMMAND" != "broadcast" && "$COMMAND" != "selfupdate" ]]; then
		mkdir -p "${GVM_DIR}/var"
		echo "${BROADCAST_LIVE}" > "${BROADCAST_FILE}"
		echo "${BROADCAST_LIVE}"
	fi
}
