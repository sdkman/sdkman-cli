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
	readonly sdkmanrc=".sdkmanrc"

	if [[ $1 == 'init' ]]; then
		cat <<- EOF > "$sdkmanrc"
		# This file was created by SDKMAN.
		# 
		# java=8.0.252-zulu 
		EOF
	fi

	if [[ ! -f "$sdkmanrc" ]]; then
		__sdkman_echo_red "Could not find .sdkmanrc file in current directory."
		echo ""
		__sdkman_echo_yellow "Run 'sdk env init' to create it."

		return 1
	fi

	while IFS= read -r line || [[ -n $line ]]; do
		local normalised_line=$(__sdkman_normalise "$line")

		[[ -z $normalised_line ]] && continue

		if ! __sdkman_matches_candidate_format "$normalised_line"; then
			__sdkman_echo_red 'Invalid candidate format!'
			echo ""
			__sdkman_echo_yellow "Expected 'candidate=version' but found '$normalised_line'"

			return 1
		fi

		__sdk_use "${normalised_line%=*}" "${normalised_line#*=}"
	done < "$sdkmanrc"
}

function __sdkman_normalise() {
	# strip comments
	local result="${1/\#*/}"

	# strip whitespace
	printf '%s\n' "${result//[[:space:]]/}"
}

function __sdkman_matches_candidate_format() {
	[[ $1 =~ ^[[:lower:]]+\=.+$ ]]
}