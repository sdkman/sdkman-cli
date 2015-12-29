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
	if [ -z "$1" ]; then
		echo -e "\nNo candidate provided."
		__sdkman_help
		return 1
	fi
}

function __sdkman_check_version_present {
	if [ -z "$1" ]; then
		echo -e "\nNo candidate version provided."
		__sdkman_help
		return 1
	fi
}

function sdkman_determine_version {
	local version="$1"
	if [[ "${SDKMAN_AVAILABLE}" == "false" && -n "$version" && -d "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/$version" ]]; then
		VERSION="$version"

	elif [[ "${SDKMAN_AVAILABLE}" == "false" && -z "$version" && -L "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/current" ]]; then
		VERSION=$(readlink "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/current" | sed "s!${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/!!g")

	elif [[ "${SDKMAN_AVAILABLE}" == "false" && -n "$version" ]]; then
		echo "Stop! ${CANDIDATE} ${1} is not available while offline."
		return 1

	elif [[ "${SDKMAN_AVAILABLE}" == "false" && -z "$version" ]]; then
        echo "This command is not available while offline."
        return 1

	elif [[ "${SDKMAN_AVAILABLE}" == "true" && -z "$version" ]]; then
		VERSION_VALID='valid'
		VERSION=$(curl -s "${SDKMAN_SERVICE}/candidates/${CANDIDATE}/default")

	else
		VERSION_VALID=$(curl -s "${SDKMAN_SERVICE}/candidates/${CANDIDATE}/$version")
		if [[ "${VERSION_VALID}" == 'valid' || "${VERSION_VALID}" == 'invalid' && -n "$2" ]]; then
			VERSION="$version"

		elif [[ "${VERSION_VALID}" == 'invalid' && -h "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/$version" ]]; then
			VERSION="$version"

		elif [[ "${VERSION_VALID}" == 'invalid' && -d "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/$version" ]]; then
			VERSION="$version"

		else
			echo ""
			echo "Stop! $version is not a valid ${CANDIDATE} version."
			return 1
		fi
	fi
}

function __sdkman_link_candidate_version {
	CANDIDATE="$1"
	VERSION="$2"

	# Change the 'current' symlink for the candidate, hence affecting all shells.
	if [ -L "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/current" ]; then
		unlink "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/current"
	fi
	ln -s "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/${VERSION}" "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/current"
}