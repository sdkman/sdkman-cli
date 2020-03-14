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

function __sdkman_cached_candidates {
	local REVERSE SHIFT
	if ! __sdkman_parse_reverse_option "${@}"; then
		__sdkman_command_usage '__sdkman_cached_candidates' '[-r]' 0 'delimiter' 1>&2
		return 1
	fi
	shift "${SHIFT}"

	__sdkman_validate_options_and_argument_counts '__sdkman_cached_candidates' '[-r]' 0 1 'delimiter' "${@}" || return 1

	__sdkman_join_by "${1:-\n}" $(printf $'%s\n' "${SDKMAN_CANDIDATES[@]}" | sort ${REVERSE})
}

function __sdkman_installed_candidates {
	local REVERSE SHIFT
	if ! __sdkman_parse_reverse_option "${@}"; then
		__sdkman_command_usage '__sdkman_installed_candidates' '[-r]' 0 'delimiter' 1>&2
		return 1
	fi
	shift "${SHIFT}"

	__sdkman_validate_options_and_argument_counts '__sdkman_installed_candidates' '[-r]' 0 1 'delimiter' "${@}" || return 1

	__sdkman_join_by "${1:-\n}" $(find -L -- "${SDKMAN_CANDIDATES_DIR}" -mindepth 1 -maxdepth 1 -type d -exec basename '{}' \; | sort ${REVERSE})
}

function __sdkman_installed_versions {
	local OPTIND reverse_candidates reverse_versions candidate_delimiter separator version_delimiter candidates versions output
	OPTIND=1
	while getopts :Rc:rs:v: opt; do
		case "${opt}" in
		R)
			reverse_versions='-r'
			;;
		c)
			candidate_delimiter="${OPTARG}"
			;;
		r)
			reverse_candidates='-r'
			;;
		s)
			separator="${OPTARG}"
			;;
		v)
			version_delimiter="${OPTARG}"
			;;
		*)
			__sdkman_print_option_error "${opt}" "${OPTARG}"
			__sdkman_command_usage '__sdkman_installed_versions' '[-c <candidate_delimiter>|-s <separator>|-v <version_delimiter>|-r|-R]...' '0*' 'candidate' 1>&2
			return 1
			;;
		esac
	done
	shift "$((OPTIND-1))"

	candidate_delimiter="${candidate_delimiter:-\n}"
	          separator="${separator:-:}"
	  version_delimiter="${version_delimiter:-/}"

	if ((${#})); then
		for candidate in "${@}"; do
			if ! __sdkman_validate_candidate "${candidate}"; then
				__sdkman_command_usage '__sdkman_installed_versions' '[-c <candidate_delimiter>|-s <separator>|-v <version_delimiter>|-r|-R]...' '0*' 'candidate' 1>&2
				return 1
			fi
		done
		candidates=("${@}")
	else
		candidates=($(__sdkman_installed_candidates ${reverse_candidates}))
	fi

	for candidate in "${candidates[@]}"; do
		versions=$(__sdkman_installed_versions_of ${reverse_versions} "${candidate}" "${version_delimiter}")
		if [[ "${#versions[@]}" -gt 0 ]]; then
			output="$(__sdkman_join_by "${candidate_delimiter}" ${output} "${candidate}${separator}${versions}")"
		fi
	done

	printf '%s' "${output}"
}

function __sdkman_installed_versions_of {
	local REVERSE SHIFT
	if ! __sdkman_parse_reverse_option "${@}"; then
		__sdkman_command_usage '__sdkman_installed_versions_of' '[-r]' 1 'candidate' 'delimiter' 1>&2
		return 1
	fi
	shift "${SHIFT}"

	__sdkman_validate_options_and_argument_counts '__sdkman_installed_versions_of' '[-r]' 1 1 'candidate' 'delimiter' "${@}" || return 1

	__sdkman_validate_candidate "${1}"

	local dir
	dir="${SDKMAN_CANDIDATES_DIR}/${1}"
	if [[ -d "${dir}" ]]; then
		__sdkman_join_by "${2:-\n}" $(find -L -- "${dir}" -mindepth 1 -maxdepth 1 -type d -not -name 'current' -exec basename '{}' \; | sort ${REVERSE})
	fi
}

function __sdkman_parse_reverse_option {
	local OPTIND
	OPTIND=1
	while getopts :r opt; do
		case "${opt}" in
		r)
			REVERSE='-r'
			;;
		*)
			__sdkman_print_error "\nStop! Unknown option: -${OPTARG}"
			return 1
			;;
		esac
	done
	SHIFT=$((OPTIND-1))
}
