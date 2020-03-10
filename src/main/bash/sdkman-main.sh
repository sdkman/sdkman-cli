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

function sdk {
	COMMAND="${1}"

	# Check if <command> is missing
	if [[ -z "${COMMAND}" ]]; then
		__sdk_help
		return 1
	fi

	QUALIFIER="${2}"

	#
	# Various sanity checks and default settings
	#

	if [[ "${COMMAND}" != 'update' ]]; then
		# map aliases to full command names
		case "${COMMAND}" in
		l|ls)
			COMMAND='list';;
		v)
			COMMAND='version';;
		u)
			COMMAND='use';;
		i)
			COMMAND='install';;
		rm)
			COMMAND='uninstall';;
		c)
			COMMAND='current';;
		ug)
			COMMAND='upgrade';;
		d)
			COMMAND='default';;
		b)
			COMMAND='broadcast';;
		h)
			COMMAND='home';;
		esac

		if [[ "${COMMAND}" == 'home' ]]; then
			__sdk_home "${QUALIFIER}" "${3}"
			return ${?}
		fi

		# Validate candidate and version caches
		___sdkman_check_candidates_cache "${SDKMAN_CANDIDATES_CACHE}" || return 1
		___sdkman_check_version_cache
	fi

	# Always presume internet is available
	SDKMAN_AVAILABLE='true'
	if [ -z "${SDKMAN_OFFLINE_MODE}" ]; then
		SDKMAN_OFFLINE_MODE='false'
	fi

	# ... Unless proven otherwise
	__sdkman_update_broadcast_and_service_availability

	# Load the sdkman config if it exists
	if [ -f "${SDKMAN_DIR}/etc/config" ]; then
		source "${SDKMAN_DIR}/etc/config"
	fi

	# Validate command as builtin or extension
	if [[ ! -f "${SDKMAN_DIR}/src/sdkman-${COMMAND}.sh" && ! -f "${SDKMAN_DIR}/ext/sdkman-${COMMAND}.sh" ]]; then
		__sdkman_echo_red "\nStop! Invalid command: ${COMMAND}"
		__sdk_help
		return 1
	fi

	# Validate qualifier
	if [[ -n "${QUALIFIER}" ]]; then
		case "${COMMAND}" in
		offline)
			# Validate offline mode
			case "${QUALIFIER}" in
			enable|disable)
				;;
			*)
				__sdkman_echo_red "\nStop! Invalid offline mode: ${QUALIFIER}"
				;;
			esac
			;;
		flush|selfupdate)
			# Validated in command function
			;;
		*)
			# Validate candidate
			grep -wq "${QUALIFIER}" <<< "${SDKMAN_CANDIDATES[@]}"
			if [[ ${?} -ne 0 ]]; then
				__sdkman_echo_red "\nStop! Invalid candidate: ${QUALIFIER}"
				return 1
			fi
			;;
		esac
	fi

	# Execute the requested command
	# NOTE: Function names use underscores rather than hyphens, so must convert the command name
	local command_function="__sdk_${COMMAND//-/_}"
	shift
	"${command_function}" "${@}"
	local result=${?}

	# Attempt upgrade after command finished
	if [[ "${COMMAND}" != 'selfupdate' ]]; then
		__sdkman_auto_update "${SDKMAN_REMOTE_VERSION}" "${SDKMAN_VERSION}"
	fi

	return ${result}
}
