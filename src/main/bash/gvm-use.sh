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

function __gvmtool_use {
	CANDIDATE="$1"
	__gvmtool_check_candidate_present "${CANDIDATE}" || return 1
	__gvmtool_determine_version "$2" || return 1

	if [[ ! -d "${GVM_DIR}/${CANDIDATE}/${VERSION}" ]]; then
		echo ""
		echo "Stop! ${CANDIDATE} ${VERSION} is not installed."
		if [[ "${gvm_auto_answer}" != 'true' ]]; then
			echo -n "Do you want to install it now? (Y/n): "
			read INSTALL
		fi
		if [[ -z "${INSTALL}" || "${INSTALL}" == "y" || "${INSTALL}" == "Y" ]]; then
			__gvmtool_install_candidate_version "${CANDIDATE}" "${VERSION}"
		else
			return 1
		fi
	fi

	# Just update the *_HOME and PATH for this shell.
	UPPER_CANDIDATE=$(echo "${CANDIDATE}" | tr '[:lower:]' '[:upper:]')
	export "${UPPER_CANDIDATE}_HOME"="${GVM_DIR}/${CANDIDATE}/${VERSION}"

	# Replace the current path for the candidate with the selected version.
	if [[ "${solaris}" == true ]]; then
		export PATH=$(echo $PATH | gsed -r "s!${GVM_DIR}/${CANDIDATE}/([^/]+)!${GVM_DIR}/${CANDIDATE}/${VERSION}!g")

	elif [[ "${darwin}" == true ]]; then
		export PATH=$(echo $PATH | sed -E "s!${GVM_DIR}/${CANDIDATE}/([^/]+)!${GVM_DIR}/${CANDIDATE}/${VERSION}!g")

	else
		export PATH=$(echo $PATH | sed -r "s!${GVM_DIR}/${CANDIDATE}/([^/]+)!${GVM_DIR}/${CANDIDATE}/${VERSION}!g")
	fi

	echo ""
	echo Using "${CANDIDATE}" version "${VERSION} in this shell."
}
