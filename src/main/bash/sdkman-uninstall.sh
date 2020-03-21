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

function __sdk_uninstall {
	__sdkman_validate_non_blank_argument_counts "sdk ${COMMAND}" 2 0 'candidate' 'version' "${@}" || return 1

	local candidate version current

	candidate="${1}"
	__sdkman_validate_candidate "${candidate}" || return 1

	version="${2}"

	current=$(readlink "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" | sed "s!${SDKMAN_CANDIDATES_DIR}/${candidate}/!!g")
	if [[ -h "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" && "${version}" == "${current}" ]]; then
		__sdkman_echo_green "\nDeselecting ${candidate} ${version}..."
		unlink "${SDKMAN_CANDIDATES_DIR}/${candidate}/current"
	fi

	if [ -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" ]; then
		__sdkman_echo_green "\nUninstalling ${candidate} ${version}..."
		rm -rf "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}"
	else
		__sdkman_echo_red "\n${candidate} ${version} is not installed."
	fi
}
