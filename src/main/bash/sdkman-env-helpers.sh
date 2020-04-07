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

function __sdkman_check_candidate_present() {
	local candidate="$1"

	if [ -z "$candidate" ]; then
		echo ""
		__sdkman_echo_red "No candidate provided."
		__sdk_help
		return 1
	fi
}

function __sdkman_check_version_present() {
	local version="$1"

	if [ -z "$version" ]; then
		echo ""
		__sdkman_echo_red "No candidate version provided."
		__sdk_help
		return 1
	fi
}

function __sdkman_determine_version() {
	local candidate version folder

	candidate="$1"
	version="$2"
	folder="$3"

	if [[ "$SDKMAN_AVAILABLE" == "false" && -n "$version" && -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" ]]; then
		VERSION="$version"

	elif [[ "$SDKMAN_AVAILABLE" == "false" && -z "$version" && -L "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" ]]; then
		VERSION=$(readlink "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" | sed "s!${SDKMAN_CANDIDATES_DIR}/${candidate}/!!g")

	elif [[ "$SDKMAN_AVAILABLE" == "false" && -n "$version" ]]; then
		__sdkman_echo_red "Stop! ${candidate} ${version} is not available while offline."
		return 1

	elif [[ "$SDKMAN_AVAILABLE" == "false" && -z "$version" ]]; then
		__sdkman_echo_red "This command is not available while offline."
		return 1

	else
		if [[ -z "$version" ]]; then
			version=$(__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/candidates/default/${candidate}")
		fi

		local validation_url="${SDKMAN_CANDIDATES_API}/candidates/validate/${candidate}/${version}/$(echo $SDKMAN_PLATFORM | tr '[:upper:]' '[:lower:]')"
		VERSION_VALID=$(__sdkman_secure_curl "$validation_url")
		__sdkman_echo_debug "Validate $candidate $version for $SDKMAN_PLATFORM: $VERSION_VALID"
		__sdkman_echo_debug "Validation URL: $validation_url"

		if [[ "$VERSION_VALID" == 'valid' || "$VERSION_VALID" == 'invalid' && -n "$folder" ]]; then
			VERSION="$version"

		elif [[ "$VERSION_VALID" == 'invalid' && -L "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" ]]; then
			VERSION="$version"

		elif [[ "$VERSION_VALID" == 'invalid' && -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" ]]; then
			VERSION="$version"

		else
			if [[ -z "$version" ]]; then
				version="\b"
			fi

			echo ""
			__sdkman_echo_red "Stop! $candidate $version is not available. Possible causes:"
			__sdkman_echo_red " * $version is an invalid version"
			__sdkman_echo_red " * $candidate binaries are incompatible with $SDKMAN_PLATFORM"
			__sdkman_echo_red " * $candidate has not been released yet"
			return 1
		fi
	fi
}
