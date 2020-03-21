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

function __sdk_upgrade {
	__sdkman_validate_non_blank_argument_counts "sdk ${COMMAND}" 0 1 'candidate' "${@}" || return 1

	local all candidates candidate upgradable installed_count upgradable_candidates

	if ((${#})); then
		all='false'
		candidates=("${@}")
		for candidate in "${candidates[@]}"; do
			__sdkman_validate_candidate "${candidate}" || return 1
		done
	else
		all='true'
		candidates=(${SDKMAN_CANDIDATES[@]})
	fi

	installed_count=0

	for candidate in "${candidates[@]}"; do
		upgradable="$(__sdkman_determine_upgradable_version "${candidate}")"
		case "${?}" in
			1)
				"${all}" || __sdkman_echo_red "\nNot using any version of ${candidate}"
				;;
			2)
				__sdkman_echo_red "\nStop! Could not get remote version of ${candidate}"
				return 1
				;;
			*)
				if [ -n "${upgradable}" ]; then
					[ "${#upgradable_candidates[@]}" -eq 0 ] && __sdkman_echo_no_colour $'\nUpgrade:'
					__sdkman_echo_no_colour "${upgradable}"
					upgradable_candidates+=("${candidate}")
				fi
				((installed_count += 1))
				;;
		esac
	done

	if [ "${#upgradable_candidates[@]}" -eq 0 ]; then
		if "${all}"; then
			if [ "${installed_count}" -eq 0 ]; then
				__sdkman_echo_no_colour 'No candidates are in use'
			else
				__sdkman_echo_no_colour 'All candidates are up-to-date'
			fi
		elif [[ "${#candidates[@]}" -eq 1 ]]; then
			__sdkman_echo_no_colour "${candidate} is up-to-date"
		else
			__sdkman_echo_no_colour "$(__sdkman_join_by ', ' "${candidates[@]}") are up-to-date"
		fi
	else
		__sdkman_echo_confirm $'\nUpgrade candidate(s) and set latest version(s) as default? (Y/n): '
		read UPGRADE_ALL
		export auto_answer_upgrade='true'
		if [[ -z "${UPGRADE_ALL}" || "${UPGRADE_ALL}" == 'y' || "${UPGRADE_ALL}" == 'Y' ]]; then
			# Using array for bash & zsh compatibility
			for candidate in "${upgradable_candidates[@]}"; do
				__sdk_install "${candidate}"
			done
		fi
		unset auto_answer_upgrade
	fi
}

function __sdkman_determine_upgradable_version {
	local candidate local_versions remote_default_version

	candidate="${1}"

	# Resolve local versions
	local_versions="$(__sdkman_installed_versions_of "${candidate}" ', ')"
	if [ -z "${local_versions}" ]; then
		return 1
	fi

	# Resolve remote default version
	remote_default_version="$(__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/candidates/default/${candidate}")"
	if [ -z "${remote_default_version}" ]; then
		return 2
	fi

	# Check upgradable or not
	if [ ! -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${remote_default_version}" ]; then
		echo "${candidate} (${local_versions} < ${remote_default_version})"
	fi
}
