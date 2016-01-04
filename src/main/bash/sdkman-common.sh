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


#
# common internal function definitions
#

function __sdkman_check_candidate_present {
	local candidate="$1"

	if [ -z "$candidate" ]; then
		echo -e "\nNo candidate provided."
		__sdk_help
		return 1
	fi
}

function __sdkman_check_version_present {
	local version="$1"

	if [ -z "$version" ]; then
		echo -e "\nNo candidate version provided."
		__sdk_help
		return 1
	fi
}

function __sdkman_determine_version {
	local candidate version folder

	candidate="$1"
	version="$2"
	folder="$3"

	if [[ "$SDKMAN_AVAILABLE" == "false" && -n "$version" && -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" ]]; then
		VERSION="$version"

	elif [[ "$SDKMAN_AVAILABLE" == "false" && -z "$version" && -L "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" ]]; then
		VERSION=$(readlink "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" | sed "s!${SDKMAN_CANDIDATES_DIR}/${candidate}/!!g")

	elif [[ "$SDKMAN_AVAILABLE" == "false" && -n "$version" ]]; then
		echo "Stop! ${candidate} ${version} is not available while offline."
		return 1

	elif [[ "$SDKMAN_AVAILABLE" == "false" && -z "$version" ]]; then
        echo "This command is not available while offline."
        return 1

	elif [[ "$SDKMAN_AVAILABLE" == "true" && -z "$version" ]]; then
		VERSION_VALID='valid'
		VERSION=$(curl -s "${SDKMAN_SERVICE}/candidates/${candidate}/default")

	else
		VERSION_VALID=$(curl -s "${SDKMAN_SERVICE}/candidates/${candidate}/${version}")
		if [[ "$VERSION_VALID" == 'valid' || "$VERSION_VALID" == 'invalid' && -n "$folder" ]]; then
			VERSION="$version"

		elif [[ "$VERSION_VALID" == 'invalid' && -h "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" ]]; then
			VERSION="$version"

		elif [[ "$VERSION_VALID" == 'invalid' && -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" ]]; then
			VERSION="$version"

		else
			echo ""
			echo "Stop! $version is not a valid ${candidate} version."
			return 1
		fi
	fi
}

function __sdkman_link_candidate_version {
	local candidate version

	candidate="$1"
	version="$2"

	# Change the 'current' symlink for the candidate, hence affecting all shells.
	if [ -L "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" ]; then
		unlink "${SDKMAN_CANDIDATES_DIR}/${candidate}/current"
	fi
	ln -s "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" "${SDKMAN_CANDIDATES_DIR}/${candidate}/current"
}

function __sdkman_curl_with_timeouts {
	curl -s "$1" --connect-timeout ${sdkman_curl_connect_timeout} --max-time ${sdkman_curl_max_time}
}