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

function __sdkman_validate_no_arguments {
	local command
	command="${1}"
	shift

	if ((${#})); then
		__sdkman_print_error "\nStop! ${command} does not accept arguments."
		return 1
	fi
}

function __sdkman_validate_options_and_argument_counts {
	local command options requiredArgCount optionalArgCount acceptedArgCount requiredParamNames optionalParamNames
	command="${1}"
	options="${2}"
	requiredArgCount="${3}"
	optionalArgCount="${4}"
	acceptedArgCount=$((requiredArgCount + optionalArgCount))

	requiredParamNames=(${@:5:${requiredArgCount}})
	optionalParamNames=(${@:((5 + requiredArgCount)):${optionalArgCount}})

	shift $((4 + acceptedArgCount))

	if [[ "${#}" -lt requiredArgCount ]]; then
		__sdkman_print_error "\nStop! Missing ${requiredParamNames[@]:${#}:1}."
		__sdkman_command_usage "${command}" "${options}" "${requiredArgCount}" "${requiredParamNames[@]}" "${optionalParamNames[@]}" 1>&2
		return 1
	fi

	if [[ "${#}" -gt "${acceptedArgCount}" ]]; then
		__sdkman_print_error "\nStop! ${command} accepts at most ${acceptedArgCount} argument(s)${options:+ besides options}."
		__sdkman_command_usage "${command}" "${options}" "${requiredArgCount}" "${requiredParamNames[@]}" "${optionalParamNames[@]}" 1>&2
		return 1
	fi
}

function __sdkman_validate_non_blank_argument_counts {
	local command requiredArgCount optionalArgCount acceptedArgCount requiredParamNames optionalParamNames
	command="${1}"
	requiredArgCount="${2}"
	optionalArgCount="${3}"
	acceptedArgCount=$((requiredArgCount + optionalArgCount))

	requiredParamNames=(${@:4:${requiredArgCount}})
	optionalParamNames=(${@:((4 + requiredArgCount)):${optionalArgCount}})

	shift $((3 + acceptedArgCount))

	if [[ "${#}" -lt requiredArgCount ]]; then
		__sdkman_print_error "\nStop! Missing ${requiredParamNames[@]:${#}:1}."
		__sdkman_command_usage "${command}" '' "${requiredArgCount}" "${requiredParamNames[@]}" "${optionalParamNames[@]}" 1>&2
		return 1
	fi

	if [[ "${#}" -gt "${acceptedArgCount}" ]]; then
		__sdkman_print_error "\nStop! ${command} accepts at most ${acceptedArgCount} argument(s)."
		__sdkman_command_usage "${command}" '' "${requiredArgCount}" "${requiredParamNames[@]}" "${optionalParamNames[@]}" 1>&2
		return 1
	fi

	local paramNames
	paramNames=("${requiredParamNames[@]}")
	if ! __sdkman_validate_non_blank_arguments "${@:1:${requiredArgCount}}"; then
		__sdkman_command_usage "${command}" '' "${requiredArgCount}" "${requiredParamNames[@]}" "${optionalParamNames[@]}" 1>&2
		return 1
	fi

	paramNames=("${optionalParamNames[@]}")
	if ! __sdkman_validate_non_blank_arguments "${@:((requiredArgCount + 1))}"; then
		__sdkman_command_usage "${command}" '' "${requiredArgCount}" "${requiredParamNames[@]}" "${optionalParamNames[@]}" 1>&2
		return 1
	fi
}

function __sdkman_validate_non_blank_arguments {
	for ((i = 1; i <= ${#}; i++)); do
		if grep -q '^\s*$' <<<"${@:${i}:1}"; then
			__sdkman_print_error "\nStop! ${paramNames[@]:((i - 1)):1} cannot be blank."
			return 1
		fi
	done
}

function __sdkman_validate_number {
	case "${1}" in
		''|*[!0-9]*)
			__sdkman_print_error "\nStop! Invalid ${2:-number}: ${1}"
			return 1
			;;
		*)
			return 0
			;;
	esac
}

function __sdkman_validate_candidate {
	if ! grep -wq -- "${1}" <<<"${SDKMAN_CANDIDATES[@]}"; then
		__sdkman_print_error "\nStop! Invalid candidate: ${1}"
		return 1
	fi
}

function __sdkman_command_usage {
	local requiredArgCount requiredParamNames optionalParamNames vararg

	if [[ "${3:((-1))}" == '*' ]]; then
		requiredArgCount="${3:0:((${#3} - 1))}"
		requiredArgCount="${requiredArgCount:-0}"
		vararg=$'\033[1;92m...\033[0m'
	else
		requiredArgCount="${3:-0}"
	fi

	__sdkman_validate_number "${requiredArgCount}" 'required_argument_count' || return 1

	requiredParamNames=(${@:4:${requiredArgCount}})
	optionalParamNames=(${@:((4 + requiredArgCount))})

	if [[ "${sdkman_colour_enable}" == 'false' ]]; then
		printf $'\nUsage: %b%b' "${1}" "${2:+ ${2}}"
		__sdkman_join_bookended_by  '> <'   ' <' '>'  "${requiredParamNames[@]}"
		__sdkman_join_bookended_by '>] [<' ' [<' '>]' "${optionalParamNames[@]}"
	else
		printf $'\033[0m\nUsage: %b%b' "$(__sdkman_color_usage "${1}")" "$(__sdkman_color_usage "${2:+ ${2}}")"
		__sdkman_join_bookended_by             '> <'                         $' \033[36m<' $'>\033[0m'            "${requiredParamNames[@]}"
		__sdkman_join_bookended_by $'>\033[1;92m] [\033[0;36m<' $' \033[1;92m[\033[0;36m<' $'>\033[1;92m]\033[0m' "${optionalParamNames[@]}"
	fi
	printf $'%s\n' "${vararg}"
}

function __sdkman_color_usage {
	((${#1})) || return

	if [[ "${sdkman_colour_enable}" == 'false' ]]; then
		printf '%s' "${1}"
		return 0
	fi

	printf $'\033[93m'

	local i c containers
	for ((i = 0; i < ${#1}; i++)); do
		c="${1:${i}:1}"
		#TODO: \ escapes
		case "${c}" in
		'[')
			printf $'\033[1;92m[\033[0;93m'
			containers+=('[')
			;;
		']')
			printf $'\033[1;92m]\033[0;93m'
			[[ ${containers:((-1))} == '[' ]] && containers=(${containers[@]:0:((${#containers[@]} - 1))})
			;;
		'(')
			printf $'\033[1;95m(\033[0;93m'
			containers+=('(')
			;;
		')')
			printf $'\033[1;95m)\033[0;93m'
			[[ ${containers:((-1))} == '(' ]] && containers=(${containers[@]:0:((${#containers[@]} - 1))})
			;;
		'|')
			case "${containers:((-1))}" in
			'[')
				printf $'\033[1;92m|\033[0;93m'
				;;
			'(')
				printf $'\033[1;95m|\033[0;93m'
				;;
			esac
			;;
		'<')
			c="${1:${i}}"
			c="${c%%>*}"
			((i += ${#c}))
			printf $'\033[36m%s%s\033[93m' "${c}" "${1:${i}:1}"
			;;
		'.')
			if [[ "${1:((i + 1)):2}" == '..' ]]; then
				printf $'\033[1;92m...\033[0;93m'
				((i += 2))
			else
				printf '%s' "${c}"
			fi
			;;
		*)
			printf '%s' "${c}"
			;;
		esac
	done

	printf $'\033[0m'
}
