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
		ug)
			COMMAND="upgrade";;
		outdated)
			COMMAND="upgrade";;
		o)
			COMMAND="upgrade";;
		d)
			COMMAND="default";;
		b)
			COMMAND="broadcast";;
	esac

	#
	# Various sanity checks and default settings
	#

    # Check candidates cache
    if [[ "$COMMAND" != "update" ]]; then
        ___sdkman_check_candidates_cache "$SDKMAN_CANDIDATES_CACHE" || return 1

        # determine if up to date
        SDKMAN_VERSION_FILE="${SDKMAN_DIR}/var/version"
        if [[ "$sdkman_beta_channel" != "true" && -f "$SDKMAN_VERSION_FILE" && -z "$(find "$SDKMAN_VERSION_FILE" -mmin +$((60*24)))" ]]; then
            __sdkman_echo_debug "Not refreshing version cache now..."
            SDKMAN_REMOTE_VERSION=$(cat "$SDKMAN_VERSION_FILE")

        else
            __sdkman_echo_debug "Version cache needs updating..."
            if [[ "$sdkman_beta_channel" == "true" ]]; then
                __sdkman_echo_debug "Refreshing version cache with BETA version."
                VERSION_URL="${SDKMAN_CURRENT_API}/broker/download/sdkman/version/beta"
            else
                __sdkman_echo_debug "Refreshing version cache with STABLE version."
                VERSION_URL="${SDKMAN_CURRENT_API}/broker/download/sdkman/version/stable"
            fi

            SDKMAN_REMOTE_VERSION=$(__sdkman_secure_curl_with_timeouts "$VERSION_URL")
            if [[ -z "$SDKMAN_REMOTE_VERSION" || -n "$(echo "$SDKMAN_REMOTE_VERSION" | tr '[:upper:]' '[:lower:]' | grep 'html')" ]]; then
                __sdkman_echo_debug "Version information corrupt or empty! Ignoring: $SDKMAN_REMOTE_VERSION"
                SDKMAN_REMOTE_VERSION="$SDKMAN_VERSION"

            else
                __sdkman_echo_debug "Overwriting version cache with: $SDKMAN_REMOTE_VERSION"
                echo "${SDKMAN_REMOTE_VERSION}" > "$SDKMAN_VERSION_FILE"
            fi
        fi

    fi

	# Always presume internet availability
	SDKMAN_AVAILABLE="true"
	if [ -z "$SDKMAN_OFFLINE_MODE" ]; then
		SDKMAN_OFFLINE_MODE="false"
	fi

	# ...unless proven otherwise
	__sdkman_update_broadcast_and_service_availability

	# Load the sdkman config if it exists.
	if [ -f "${SDKMAN_DIR}/etc/config" ]; then
		source "${SDKMAN_DIR}/etc/config"
	fi

	# no command provided
	if [[ -z "$COMMAND" ]]; then
		__sdk_help
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
		__sdk_help
	fi

	# Check whether the candidate exists
	local sdkman_valid_candidate=$(echo ${SDKMAN_CANDIDATES[@]} | grep -w "$QUALIFIER")
	if [[ -n "$QUALIFIER" && "$COMMAND" != "offline" && "$COMMAND" != "flush" && "$COMMAND" != "selfupdate" && -z "$sdkman_valid_candidate" ]]; then
		echo ""
		__sdkman_echo_red "Stop! $QUALIFIER is not a valid candidate."
		return 1
	fi

	# Validate offline qualifier
	if [[ "$COMMAND" == "offline" && -n "$QUALIFIER" && -z $(echo "enable disable" | grep -w "$QUALIFIER") ]]; then
		echo ""
		__sdkman_echo_red "Stop! $QUALIFIER is not a valid offline mode."
	fi

	# Check whether the command exists as an internal function...
	#
	# NOTE Internal commands use underscores rather than hyphens,
	# hence the name conversion as the first step here.
	CONVERTED_CMD_NAME=$(echo "$COMMAND" | tr '-' '_')

	# Execute the requested command
	if [ -n "$CMD_FOUND" ]; then
		# It's available as a shell function
		__sdk_"$CONVERTED_CMD_NAME" "$QUALIFIER" "$3" "$4"
	fi

	# Attempt upgrade after all is done
	if [[ "$COMMAND" != "selfupdate" ]]; then
		__sdkman_auto_update "$SDKMAN_REMOTE_VERSION" "$SDKMAN_VERSION"
	fi
}
