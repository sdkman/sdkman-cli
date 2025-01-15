#!/usr/bin/env bash

#
#   Copyright 2021 Marco Vermeulen
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

function __sdk_list() {
	local candidate="$1"

	if [[ -z "$candidate" ]]; then
		if [[ "$SDKMAN_AVAILABLE" == "false" ]]; then
			__sdkman_echo_red "This command is not available while offline."
		else
			__sdkman_echo_paged "$(__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/candidates/list")"
		fi
	else
		__sdkman_list_versions "$candidate"
	fi
}

function __sdkman_list_versions() {
	local candidate="$1"
	local versions_csv="$(__sdkman_build_version_csv "$candidate")"
	__sdkman_determine_current_version "$candidate"

	if [[ "$SDKMAN_AVAILABLE" == "false" ]]; then
		__sdkman_offline_list "$candidate" "$versions_csv"
	else
		__sdkman_echo_paged "$(__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/candidates/${candidate}/${SDKMAN_PLATFORM}/versions/list?current=${CURRENT}&installed=${versions_csv}")"
	fi
}

function __sdkman_build_version_csv() {
	local candidate="$1"
	local versions_csv=""
	local version

	if [[ -d "${SDKMAN_CANDIDATES_DIR}/${candidate}" ]]; then
		local -a versions_list=( ${SDKMAN_CANDIDATES_DIR}/${candidate}/* )
		versions_list=( $(printf '%s\n' "${versions_list[@]##*/}" | sort -r) )
		for version in "${versions_list[@]}"; do
			if [[ "$version" != 'current' ]]; then
				versions_csv="${version},${versions_csv}"
			fi
		done
		versions_csv=${versions_csv%?}
	fi
	echo "$versions_csv"
}

function __sdkman_offline_list() {
	local candidate="$1"
	local versions_csv="$2"

	__sdkman_echo_no_colour "--------------------------------------------------------------------------------"
	__sdkman_echo_yellow "Offline: only showing installed ${candidate} versions"
	__sdkman_echo_no_colour "--------------------------------------------------------------------------------"

	local -a versions
	if [[ "${zsh_shell}" == 'true' ]]; then
		versions=(${(s:,:)versions_csv})
	else
		IFS=',' read -a versions <<< "${versions_csv}"
	fi
	for ((i = ${#versions} - 1; i >= 0; i--)); do
		if [[ -n "${versions[${i}]}" ]]; then
			if [[ "${versions[${i}]}" == "$CURRENT" ]]; then
				__sdkman_echo_no_colour " > ${versions[${i}]}"
			else
				__sdkman_echo_no_colour " * ${versions[${i}]}"
			fi
		fi
	done

	if [[ -z "${versions[@]}" ]]; then
		__sdkman_echo_yellow "   None installed!"
	fi

	__sdkman_echo_no_colour "--------------------------------------------------------------------------------"
	__sdkman_echo_no_colour "* - installed                                                                   "
	__sdkman_echo_no_colour "> - currently in use                                                            "
	__sdkman_echo_no_colour "--------------------------------------------------------------------------------"
}