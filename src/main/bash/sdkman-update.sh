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

function __sdk_update() {
	local candidates_uri="${SDKMAN_CANDIDATES_API}/candidates/all"
	__sdkman_echo_debug "Using candidates endpoint: $candidates_uri"

	local fresh_candidates_csv=$(__sdkman_secure_curl_with_timeouts "$candidates_uri")

	__sdkman_echo_debug "Local candidates: $SDKMAN_CANDIDATES_CSV"
	__sdkman_echo_debug "Fetched candidates: $fresh_candidates_csv"

	if [[ -n "${fresh_candidates_csv}" ]] && ! grep -iq 'html' <<< "${fresh_candidates_csv}"; then
		__sdkman_echo_debug "Fresh and cached candidate lengths: ${#fresh_candidates_csv} ${#SDKMAN_CANDIDATES_CSV}"

		local fresh_candidates combined_candidates diff_candidates

		if [[ "${zsh_shell}" == 'true' ]]; then
			fresh_candidates=(${(s:,:)fresh_candidates_csv})
		else
			IFS=',' read -a fresh_candidates <<< "${fresh_candidates_csv}"
		fi

		combined_candidates=("${fresh_candidates[@]}" "${SDKMAN_CANDIDATES[@]}")

		diff_candidates=($(printf $'%s\n' "${combined_candidates[@]}" | sort | uniq -u))

		if ((${#diff_candidates[@]})); then
			local delta

			delta=("${fresh_candidates[@]}" "${diff_candidates[@]}")
			delta=($(printf $'%s\n' "${delta[@]}" | sort | uniq -d))
			if ((${#delta[@]})); then
				__sdkman_echo_green "\nAdding new candidates(s): ${delta[*]}"
			fi

			delta=("${SDKMAN_CANDIDATES[@]}" "${diff_candidates[@]}")
			delta=($(printf $'%s\n' "${delta[@]}" | sort | uniq -d))
			if ((${#delta[@]})); then
				__sdkman_echo_green "\nRemoving obsolete candidates(s): ${delta[*]}"
			fi

			echo "${fresh_candidates_csv}" >| "${SDKMAN_CANDIDATES_CACHE}"
			__sdkman_echo_yellow $'\nPlease open a new terminal now...'
		else
			touch "${SDKMAN_CANDIDATES_CACHE}"
			__sdkman_echo_green $'\nNo new candidates found at this time.'
		fi
	fi
}
