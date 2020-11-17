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

function __sdk_env() {
	local -r sdkmanrc=".sdkmanrc"
	local -r subcommand="$1"

	case $subcommand in
		"")    __sdkman_load_env ;;
		init)  __sdkman_create_env_file ;;
		clear) __sdkman_clear_env ;;
	esac
}

function __sdkman_load_env() {
	if [[ ! -f "$sdkmanrc" ]]; then
		__sdkman_echo_red "Could not find $sdkmanrc in the current directory."
		echo ""
		__sdkman_echo_yellow "Run 'sdk env init' to create it."

		return 1
	fi

	local normalised_line
	while IFS= read -r line || [[ -n "$line" ]]; do
		normalised_line="$(__sdkman_normalise "$line")"

		__sdkman_is_blank_line "$normalised_line" && continue

		if ! __sdkman_matches_candidate_format "$normalised_line"; then
			__sdkman_echo_red "Invalid candidate format!"
			echo ""
			__sdkman_echo_yellow "Expected 'candidate=version' but found '$normalised_line'"

			return 1
		fi

		__sdk_use "${normalised_line%=*}" "${normalised_line#*=}" && SDKMAN_ENV=$PWD
	done < "$sdkmanrc"
}

function __sdkman_create_env_file() {
	if [[ -f "$sdkmanrc" ]]; then
		__sdkman_echo_red "$sdkmanrc already exists!"

		return 1
	fi

	__sdkman_determine_current_version "java"

	local version
	[[ -n "$CURRENT" ]] && version="$CURRENT" || version="$(__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/candidates/default/java")"

	echo "# Enable auto-env through the sdkman_auto_env config" > "$sdkmanrc"
	echo "# Add key=value pairs of SDKs to use below" >> "$sdkmanrc"
	echo "java=$version" >> "$sdkmanrc"

	__sdkman_echo_green "$sdkmanrc created."
}

function __sdkman_clear_env() {
	if [[ -z $SDKMAN_ENV ]]; then
		__sdkman_echo_red "No environment currently set!"
		return 1
	fi

	if [[ ! -f ${SDKMAN_ENV}/${sdkmanrc} ]]; then
		__sdkman_echo_red "Could not find ${SDKMAN_ENV}/${sdkmanrc}."
		return 1
	fi

	local normalised_line candidate candidate_dir version
	while IFS= read -r line || [[ -n "$line" ]]; do
		normalised_line="$(__sdkman_normalise "$line")"

		__sdkman_is_blank_line "$normalised_line" && continue

		candidate=${normalised_line%=*}
		candidate_dir="${SDKMAN_CANDIDATES_DIR}/${candidate}/current"
		if [[ -h $candidate_dir ]]; then
			version=$(basename $(readlink ${candidate_dir}))
			__sdk_use "$candidate" "current" >/dev/null &&
				__sdkman_echo_no_colour "Restored $candidate version to $version (default)"
		else
			__sdkman_echo_yellow "No default version of $candidate was found"
		fi
	done < "${SDKMAN_ENV}/${sdkmanrc}"

	unset SDKMAN_ENV
}

function __sdkman_is_blank_line() {
	[[ -z "$1" ]]
}

function __sdkman_normalise() {
	local -r line_without_comments="${1/\#*/}"

	echo "${line_without_comments//[[:space:]]/}"
}

function __sdkman_matches_candidate_format() {
	[[ "$1" =~ ^[[:lower:]]+\=.+$ ]]
}
