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

function __gvmtool_check_candidate_present {
	if [ -z "$1" ]; then
		echo -e "\nNo candidate provided."
		__gvmtool_help
		return 1
	fi
}

function __gvmtool_check_version_present {
	if [ -z "$1" ]; then
		echo -e "\nNo candidate version provided."
		__gvmtool_help
		return 1
	fi
}

function __gvmtool_determine_version {
	if [[ "${GVM_AVAILABLE}" == "false" && -n "$1" && -d "${GVM_DIR}/${CANDIDATE}/$1" ]]; then
		VERSION="$1"

	elif [[ "${GVM_AVAILABLE}" == "false" && -z "$1" && -L "${GVM_DIR}/${CANDIDATE}/current" ]]; then

		VERSION=$(readlink "${GVM_DIR}/${CANDIDATE}/current" | sed "s!${GVM_DIR}/${CANDIDATE}/!!g")

	elif [[ "${GVM_AVAILABLE}" == "false" && -n "$1" ]]; then
		echo "Stop! ${CANDIDATE} ${1} is not available in offline mode."
		return 1

	elif [[ "${GVM_AVAILABLE}" == "false" && -z "$1" ]]; then
        echo "${OFFLINE_MESSAGE}"
        return 1

	elif [[ "${GVM_AVAILABLE}" == "true" && -z "$1" ]]; then
		VERSION_VALID='valid'
		VERSION=$(curl -s "${GVM_SERVICE}/candidates/${CANDIDATE}/default")

	else
		VERSION_VALID=$(curl -s "${GVM_SERVICE}/candidates/${CANDIDATE}/$1")
		if [[ "${VERSION_VALID}" == 'valid' || ( "${VERSION_VALID}" == 'invalid' && -n "$2" ) ]]; then
			VERSION="$1"

		elif [[ "${VERSION_VALID}" == 'invalid' && -h "${GVM_DIR}/${CANDIDATE}/$1" ]]; then
			VERSION="$1"

		elif [[ "${VERSION_VALID}" == 'invalid' && -d "${GVM_DIR}/${CANDIDATE}/$1" ]]; then
			VERSION="$1"

		else
			echo ""
			echo "Stop! $1 is not a valid ${CANDIDATE} version."
			return 1
		fi
	fi
}

function __gvmtool_default_environment_variables {

	if [ ! "$GVM_FORCE_OFFLINE" ]; then
		GVM_FORCE_OFFLINE="false"
	fi

	if [ ! "$GVM_ONLINE" ]; then
		GVM_ONLINE="true"
	fi

	if [[ "${GVM_ONLINE}" == "false" || "${GVM_FORCE_OFFLINE}" == "true" ]]; then
		GVM_AVAILABLE="false"
	else
	  	GVM_AVAILABLE="true"
	fi
}

function __gvmtool_link_candidate_version {
	CANDIDATE="$1"
	VERSION="$2"

	# Change the 'current' symlink for the candidate, hence affecting all shells.
	if [ -L "${GVM_DIR}/${CANDIDATE}/current" ]; then
		unlink "${GVM_DIR}/${CANDIDATE}/current"
	fi
	ln -s "${GVM_DIR}/${CANDIDATE}/${VERSION}" "${GVM_DIR}/${CANDIDATE}/current"
}