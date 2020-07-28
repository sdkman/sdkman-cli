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

	(($# == 0)) && 	__sdkman_env_each_line "$sdkmanrc" "__sdk_use"

	local command="$1"

	case "$command" in
	init)
		__sdkman_env_init "$sdkmanrc"
		;;
	install)
		__sdkman_env_each_line "$sdkmanrc" "__sdk_install"
		;;
	esac
}

function __sdkman_env_init() {
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

function __sdkman_env_each_line() {
	local -r sdkmanrc="$1"	
	local -r cb="$2"

	if [[ ! -f "$sdkmanrc" ]]; then
		__sdkman_echo_red "Could not find $sdkmanrc in the current directory."
		echo ""
		__sdkman_echo_yellow "Run 'sdk env init' to create it."

		return 1
	fi

	local normalised_line

	while IFS= read -r line || [[ -n "$line" ]]; do
		normalised_line="$(__sdkman_normalise "$line")"

		[[ -z "$normalised_line" ]] && continue

		if ! __sdkman_matches_candidate_format "$normalised_line"; then
			__sdkman_echo_red "Invalid candidate format!"
			echo ""
			__sdkman_echo_yellow "Expected 'candidate=version' but found '$normalised_line'"

			return 1
		fi

		"$cb" "${normalised_line%=*}" "${normalised_line#*=}"
	done < "$sdkmanrc"
}

function __sdkman_normalise() {
	local -r line_without_comments="${1/\#*/}"

	echo "${line_without_comments//[[:space:]]/}"
}

function __sdkman_matches_candidate_format() {
	[[ "$1" =~ ^[[:lower:]]+\=.+$ ]]
}
