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

function sdk {

    COMMAND="$1"
    QUALIFIER="$2"

    case "$COMMAND" in
        l)
            COMMAND="list";;
        ls)
            COMMAND="list";;
        h)
            COMMAND="help";;
        v)
            COMMAND="version";;
        u)
            COMMAND="use";;
        i)
            COMMAND="install";;
        rm)
            COMMAND="uninstall";;
        c)
            COMMAND="current";;
        o)
            COMMAND="outdated";;
        d)
            COMMAND="default";;
        b)
            COMMAND="broadcast";;
    esac

	#
	# Various sanity checks and default settings
	#
	mkdir -p "$SDKMAN_DIR"

	# Always presume internet availability
	SDKMAN_AVAILABLE="true"
	if [ -z "$SDKMAN_OFFLINE_MODE" ]; then
		SDKMAN_OFFLINE_MODE="false"
	fi

	# ...unless proven otherwise
    sdkman_update_broadcast_and_service_availability

	# Load the sdkman config if it exists.
	if [ -f "${SDKMAN_DIR}/etc/config" ]; then
		source "${SDKMAN_DIR}/etc/config"
	fi

 	# no command provided
	if [[ -z "$COMMAND" ]]; then
		__sdkman_help
		return 1
	fi

	# Check if it is a valid command
	CMD_FOUND=""
	CMD_TARGET="${SDKMAN_DIR}/src/sdkman-${COMMAND}.sh"
	if [[ -f "$CMD_TARGET" ]]; then
		CMD_FOUND="$CMD_TARGET"
	fi

	# Check if it is a sourced function
	CMD_TARGET="${SDKMAN_DIR}/ext/sdkman-${COMMAND}.sh"
	if [[ -f "$CMD_TARGET" ]]; then
		CMD_FOUND="$CMD_TARGET"
	fi

	# couldn't find the command
	if [[ -z "$CMD_FOUND" ]]; then
		echo "Invalid command: $COMMAND"
		__sdkman_help
	fi

	# Check whether the candidate exists
	local sdkman_valid_candidate=$(echo ${SDKMAN_CANDIDATES[@]} | grep -w "$QUALIFIER")
	if [[ -n "$QUALIFIER" && "$COMMAND" != "offline" && "$COMMAND" != "flush" && "$COMMAND" != "selfupdate" && -z "$sdkman_valid_candidate" ]]; then
		echo -e "\nStop! $QUALIFIER is not a valid candidate."
		return 1
	fi

	if [[ "$COMMAND" == "offline" &&  -z "$QUALIFIER" ]]; then
		echo -e "\nStop! Specify a valid offline mode."
	elif [[ "$COMMAND" == "offline" && ( -z $(echo "enable disable" | grep -w "$QUALIFIER")) ]]; then
		echo -e "\nStop! $QUALIFIER is not a valid offline mode."
	fi

	# Check whether the command exists as an internal function...
	#
	# NOTE Internal commands use underscores rather than hyphens,
	# hence the name conversion as the first step here.
	CONVERTED_CMD_NAME=$(echo "$COMMAND" | tr '-' '_')

	# Execute the requested command
	if [ -n "$CMD_FOUND" ]; then
		# It's available as a shell function
		__sdkman_"$CONVERTED_CMD_NAME" "$QUALIFIER" "$3" "$4"
	fi

	# Attempt upgrade after all is done
	if [[ "$COMMAND" != "selfupdate" ]]; then
	    __sdkman_auto_update "$SDKMAN_REMOTE_VERSION" "$SDKMAN_VERSION"
	fi
}
