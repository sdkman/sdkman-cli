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

function __sdk_list {
	local candidate="$1"

	if [[ -z "$candidate" ]]; then
		__sdkman_list_candidates
	else
		__sdkman_list_versions "$candidate"
	fi
}

function __sdkman_list_candidates {
	if [[ "$SDKMAN_AVAILABLE" == 'false' ]]; then
		__sdkman_echo_red 'This command is not available while offline.'
	else
		__sdkman_page echo "$(__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/candidates/list")"
	fi
}

function __sdkman_list_versions {
	local candidate versions

	candidate="$1"

	__sdkman_determine_current_version "$candidate"

	if [[ "$SDKMAN_AVAILABLE" == 'false' ]]; then
		__sdkman_offline_list "$candidate"
	else
		versions="$(__sdkman_installed_versions_of "${candidate}" ',')"
		__sdkman_echo_no_colour "$(__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/candidates/${candidate}/${SDKMAN_PLATFORM}/versions/list?current=${CURRENT}&installed=${versions}")"
	fi
}

function __sdkman_offline_list {
	local candidate versions

	candidate="$1"

	__sdkman_echo_no_colour '--------------------------------------------------------------------------------'
	__sdkman_echo_yellow    "Offline: only showing installed ${candidate} versions"
	__sdkman_echo_no_colour '--------------------------------------------------------------------------------'

	versions=($(__sdkman_installed_versions_of -r "${candidate}"))
	if [[ ${#versions[@]} -eq 0 ]]; then
		__sdkman_echo_yellow '   None installed!'
	else
		for version in ${versions[@]}; do
			if [[ -n "${version}" ]]; then
				if [[ "${version}" == "$CURRENT" ]]; then
					__sdkman_echo_no_colour " > ${version}"
				else
					__sdkman_echo_no_colour " * ${version}"
				fi
			fi
		done
	fi

	__sdkman_echo_no_colour '--------------------------------------------------------------------------------'
	__sdkman_echo_no_colour '* - installed                                                                   '
	__sdkman_echo_no_colour '> - currently in use                                                            '
	__sdkman_echo_no_colour '--------------------------------------------------------------------------------'
}
