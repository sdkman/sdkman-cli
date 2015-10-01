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

function __sdkman_use {
	CANDIDATE="$1"
	__sdkman_check_candidate_present "${CANDIDATE}" || return 1
	__sdkman_determine_version "$2" || return 1

	if [[ ! -d "${SDKMAN_DIR}/${CANDIDATE}/${VERSION}" ]]; then
		echo ""
		echo "Stop! ${CANDIDATE} ${VERSION} is not installed."
		if [[ "${sdkman_auto_answer}" != 'true' ]]; then
			echo -n "Do you want to install it now? (Y/n): "
			read INSTALL
		fi
		if [[ -z "${INSTALL}" || "${INSTALL}" == "y" || "${INSTALL}" == "Y" ]]; then
			__sdkman_install_candidate_version "${CANDIDATE}" "${VERSION}"
			__sdkman_add_to_path "${CANDIDATE}"
		else
			return 1
		fi
	fi

	# Just update the *_HOME and PATH for this shell.
	UPPER_CANDIDATE=$(echo "${CANDIDATE}" | tr '[:lower:]' '[:upper:]')
	export "${UPPER_CANDIDATE}_HOME"="${SDKMAN_DIR}/${CANDIDATE}/${VERSION}"

	# Replace the current path for the candidate with the selected version.
	if [[ "${solaris}" == true ]]; then
		export PATH=$(echo $PATH | gsed -r "s!${SDKMAN_DIR}/${CANDIDATE}/([^/]+)!${SDKMAN_DIR}/${CANDIDATE}/${VERSION}!g")

	elif [[ "${darwin}" == true ]]; then
		export PATH=$(echo $PATH | sed -E "s!${SDKMAN_DIR}/${CANDIDATE}/([^/]+)!${SDKMAN_DIR}/${CANDIDATE}/${VERSION}!g")

	else
		export PATH=$(echo $PATH | sed -r "s!${SDKMAN_DIR}/${CANDIDATE}/([^/]+)!${SDKMAN_DIR}/${CANDIDATE}/${VERSION}!g")
	fi

	if [[ ! -h "${SDKMAN_DIR}/${CANDIDATE}/current" ]]; then
	    echo "Setting ${CANDIDATE} version ${VERSION} as default."
		__sdkman_link_candidate_version "${CANDIDATE}" "${VERSION}"
	fi

	echo ""
	echo "Using ${CANDIDATE} version ${VERSION} in this shell."
}