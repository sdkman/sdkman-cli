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
	readonly sdkrc='.sdkrc'

	if [[ ! -f "$sdkrc" ]]; then
		__sdkman_echo_red "No $sdkrc file found."
		echo ""
		__sdkman_echo_yellow "Please create one before using this command."

		return 1
	fi

	local line_number=0

	while IFS= read -r line || [[ -n $line ]]; do
		__sdkman_is_blank_or_comment "$line" && continue

		if ! __sdkman_matches_candidate_format "$line"; then
			__sdkman_echo_red "${sdkrc}:${line_number}: Invalid candidate format! Expected 'candidate version' but found '$line'"

			return 1
		fi

		local candidate version
		IFS=' \t' read -r candidate version <<< "$line"
		__sdk_use "$candidate" "$version"

		((line_number++))
	done < "$sdkrc"
}

function __sdkman_is_blank_or_comment() {
	[[ $1 =~ ^[[:blank:]]*|\#.*$ ]]
}

function __sdkman_matches_candidate_format() {
	[[ $1 =~ ^[[:lower:]]+[[:blank:]]+.+$ ]]
}