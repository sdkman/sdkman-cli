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

function __sdk_use() {
	local candidate version install

	candidate="$1"
	version="$2"
	__sdkman_check_version_present "$version" || return 1
	__sdkman_check_candidate_present "$candidate" || return 1

	if [[ ! -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" ]]; then
		echo ""
		__sdkman_echo_red "Stop! ${candidate} ${version} is not installed."
		return 1
	fi

	# Just update the *_HOME and PATH for this shell.
	__sdkman_set_candidate_home "$candidate" "$version"

	# Replace the current path for the candidate with the selected version.
	if [[ "$solaris" == true ]]; then
		export PATH=$(echo $PATH | gsed -r "s!${SDKMAN_CANDIDATES_DIR}/${candidate}/([^/]+)!${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}!g")

	elif [[ "$darwin" == true ]]; then
		export PATH=$(echo $PATH | sed -E "s!${SDKMAN_CANDIDATES_DIR}/${candidate}/([^/]+)!${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}!g")

	else
		export PATH=$(echo "$PATH" | sed -r "s!${SDKMAN_CANDIDATES_DIR}/${candidate}/([^/]+)!${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}!g")
	fi

	if [[ ! (-L "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" || -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/current") ]]; then
		__sdkman_echo_green "Setting ${candidate} version ${version} as default."
		__sdkman_link_candidate_version "$candidate" "$version"
	fi

	echo ""
	__sdkman_echo_green "Using ${candidate} version ${version} in this shell."
}
