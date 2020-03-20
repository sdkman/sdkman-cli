#!/usr/bin/env bash

#
#   Copyright 2017 Marco Vermeulen
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

function __sdk_offline {
	__sdkman_validate_non_blank_argument_counts "sdk ${COMMAND}" 0 1 'offline_mode' "${@}" || return 1

	local mode="${1}"

	case "${mode}" in
	''|'enable')
		SDKMAN_OFFLINE_MODE='true'
		__sdkman_echo_green 'Offline mode enabled.'
		;;
	'disable')
		SDKMAN_OFFLINE_MODE='false'
		__sdkman_echo_green 'Online mode re-enabled!'
		;;
	*)
		__sdkman_echo_red "\nStop! Invalid offline mode: ${mode}"
		return 1
		;;
	esac
}
