#!/usr/bin/env bash

#
#   Copyright 2021 Marco Vermeulen
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

function ___sdkman_help() {
	if [[ -f "$SDKMAN_DIR/libexec/help" ]]; then
		"$SDKMAN_DIR/libexec/help"
	else
		__sdk_help
	fi
}

function sdk() {
	local CMD_FOUND CMD_TARGET
	local COMMAND="$1"
	local QUALIFIER="$2"

	# no command provided
	# move this to the top as if no command is given then it is
	# a waste of time to continue so we should exit early
	if [[ -z "$COMMAND" ]]; then
		___sdkman_help
		return 1
	fi

	# combine 'l' and 'ls' as they are the same
	# and change formating a little
	case "$COMMAND" in
		l|ls) COMMAND="list" ;;
		v)    COMMAND="version" ;;
		u)    COMMAND="use" ;;
		i)    COMMAND="install" ;;
		rm)   COMMAND="uninstall" ;;
		c)    COMMAND="current" ;;
		ug)   COMMAND="upgrade" ;;
		d)    COMMAND="default" ;;
		h)    COMMAND="home" ;;
		e)    COMMAND="env" ;;
	esac

	# Various sanity checks and default settings

	# Check candidates cache
	if [[ "$COMMAND" != "update" ]]; then
		___sdkman_check_candidates_cache "$SDKMAN_CANDIDATES_CACHE" || return 1
	fi

	# Always presume internet availability
	SDKMAN_AVAILABLE="true"
	# use expansion
	SDKMAN_OFFLINE_MODE="${SDKMAN_OFFLINE_MODE:-"false"}"

	# ...unless proven otherwise
	__sdkman_update_service_availability

	# Load the sdkman config if it exists.
	[[ -f "${SDKMAN_DIR}/etc/config" ]] && source "${SDKMAN_DIR}/etc/config"

	# Check if it is a valid command
	CMD_FOUND=""
	if [[ "$COMMAND" != "selfupdate" || "$sdkman_selfupdate_feature" == "true" ]]; then
		CMD_TARGET="${SDKMAN_DIR}/src/sdkman-${COMMAND}.sh"
		if [[ -f "$CMD_TARGET" ]]; then
			CMD_FOUND="$CMD_TARGET"
		fi
	fi

	# Check if it is a sourced function
	CMD_TARGET="${SDKMAN_DIR}/ext/sdkman-${COMMAND}.sh"
	if [[ -f "$CMD_TARGET" ]]; then
		CMD_FOUND="$CMD_TARGET"
	fi

	# couldn't find the command
	if [[ -z "$CMD_FOUND" ]]; then
		echo ""
		__sdkman_echo_red "Invalid command: $COMMAND"
		echo ""
		___sdkman_help
	fi

	# Validate offline qualifier
	# use brackets with '|' instead of a grep as it is much faster
	if [[ "$COMMAND" == "offline" && -n "$QUALIFIER" && "$QUALIFIER" != ("enable"|"disable") ]]; then
		echo ""
		__sdkman_echo_red "Stop! $QUALIFIER is not a valid offline mode."
	fi

	# Store the return code of the requested command
	local final_rc=0

	# Native commands found under libexec
	local native_command="${SDKMAN_DIR}/libexec/${COMMAND}"

	if [[ "$sdkman_native_enable" == 'true' && -f "$native_command" ]]; then
		"$native_command" "${@:2}"

	elif [ -n "$CMD_FOUND" ]; then
		# Check whether the candidate exists
		# use brackets and '|'`s as it is way faster
		if [[ -n "$QUALIFIER" && "$COMMAND" != ("help"|"offline"|"flush"|"selfupdate"|"env"|"completion"|"edit"|"home") && -z $(grep -w "$QUALIFIER" <<<"${SDKMAN_CANDIDATES[@]}") ]]; then
			echo ""
			__sdkman_echo_red "Stop! $QUALIFIER is not a valid candidate."
			return 1
		fi

		# Internal commands use underscores rather than hyphens
		local converted_command_name="${COMMAND//-/_}"

		# Available as a shell function
		__sdk_"$converted_command_name" "${@:2}"
	fi
	final_rc=$?
	return $final_rc
}