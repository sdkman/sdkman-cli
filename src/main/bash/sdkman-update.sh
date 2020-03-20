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

function __sdk_update {
	local candidates_uri="${SDKMAN_CANDIDATES_API}/candidates/all"
	__sdkman_echo_debug "Using candidates endpoint: ${candidates_uri}"

	local fetched_candidates_csv=$(__sdkman_secure_curl_with_timeouts "${candidates_uri}")

	__sdkman_echo_debug "Local candidates:   ${SDKMAN_CANDIDATES_CSV}"
	__sdkman_echo_debug "Fetched candidates: ${fetched_candidates_csv}"

	grep -iq 'html' <<< "${fetched_candidates_csv}"
	if [[ "${?}" -eq 1 && -n "${fetched_candidates_csv}" ]]; then
		# legacy bash workaround
		if [[ "${bash_shell}" == 'true' && "${BASH_VERSINFO}" -lt 4 ]]; then
			__sdkman_legacy_bash_message
			echo "${fetched_candidates_csv}" > "${SDKMAN_CANDIDATES_CACHE}"
			return 0
		fi

		__sdkman_echo_debug "Fetched and cached candidate lengths: ${#fetched_candidates_csv} ${#SDKMAN_CANDIDATES_CSV}"

		local fetched_candidates
		if [[ "${zsh_shell}" == 'true' ]]; then
			fetched_candidates=(${(s:,:)fetched_candidates_csv})
		else
			IFS=',' read -a fetched_candidates <<< "${fetched_candidates_csv}"
		fi

		local combined_candidates=("${fetched_candidates[@]}" "${SDKMAN_CANDIDATES[@]}")

		local diff_candidates=($(printf $'%s\n' "${combined_candidates[@]}" | sort | uniq -u))

		if ((${#diff_candidates[@]})); then
			__sdkman_echo_green "\nSetting candidate list to: ${fetched_candidates_csv//,/ }"
			echo "${fetched_candidates_csv}" > "${SDKMAN_CANDIDATES_CACHE}"
			__sdkman_echo_yellow $'\nPlease open a new terminal now...'
		else
			touch "${SDKMAN_CANDIDATES_CACHE}"
			__sdkman_echo_green 'No new candidates found at this time.'
		fi
	fi
}
