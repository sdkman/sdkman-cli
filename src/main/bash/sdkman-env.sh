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
	local -r command="$1"

	case "$command" in
	init)
		__sdkman_env_init "$sdkmanrc"
		;;
	install)
		__sdkman_env_each_candidate "$sdkmanrc" "__sdkman_install_auto_answer_enabled"
		;;
	*)
    	__sdkman_env_each_candidate "$sdkmanrc" "__sdk_use"
    	;;
	esac
}

function __sdkman_install_auto_answer_enabled() {
	local -r candidate="$1"
	local -r version="$2"

	sdkman_auto_answer=true __sdk_install "$candidate" "$version"
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

function __sdkman_env_each_candidate() {
	local -r sdkmanrc="$1"	
	local -r func="$2"

	if [[ ! -f "$sdkmanrc" ]]; then
		__sdkman_echo_red "Could not find $sdkmanrc in the current directory."
		echo ""
		__sdkman_echo_yellow "Run 'sdk env init' to create it."

		return 1
	fi

	while IFS= read -r line || [[ -n "$line" ]]; do
		line="${line/\#*/}"
		line="${line//[[:space:]]/}"

		[[ -z "$line" ]] && continue

		if ! __sdkman_matches_candidate_format "$line"; then
			__sdkman_echo_red "Invalid candidate format!"
			echo ""
			__sdkman_echo_yellow "Expected 'candidate=version' but found '$line'"

			return 1
		fi

		"$func" "${line%=*}" "${line#*=}"
	done < "$sdkmanrc"
}

function __sdkman_matches_candidate_format() {
	[[ "$1" =~ ^[[:lower:]]+\=.+$ ]]
}
