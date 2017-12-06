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
    local candidates_uri="${SDKMAN_CURRENT_API}/candidates/all"
	__sdkman_echo_debug "Using candidates endpoint: $candidates_uri"

	local fresh_candidates_csv=$(__sdkman_secure_curl_with_timeouts "$candidates_uri")

	local fresh_candidates=("")
    local cached_candidates=("")

	if [[ "$zsh_shell" == 'true' ]]; then
        fresh_candidates=( ${(s:,:)fresh_candidates_csv} )
        cached_candidates=( ${(s:,:)SDKMAN_CANDIDATES_CSV} )
    else
        OLD_IFS="$IFS"
        IFS=","
        fresh_candidates=(${fresh_candidates_csv})
        cached_candidates=(${SDKMAN_CANDIDATES_CSV})
        IFS="$OLD_IFS"
    fi

    __sdkman_echo_debug "Local candidates: $SDKMAN_CANDIDATES_CSV"
	__sdkman_echo_debug "Fetched candidates: $fresh_candidates_csv"

	local detect_html="$(echo "$fresh_candidates" | tr '[:upper:]' '[:lower:]' | grep 'html')"
	if [[ -n "$fresh_candidates_csv" && -z "$detect_html" ]]; then
		local fresh_candidates_length=${#fresh_candidates_csv}
		local cached_candidates_length=${#SDKMAN_CANDIDATES_CSV}
		__sdkman_echo_debug "Fresh and cached candidate lengths: $fresh_candidates_length $cached_candidates_length"

        local diff=$(echo ${fresh_candidates[@]} ${cached_candidates[@]} | tr ' ' '\n' | sort | uniq -u | tr '\n' ',')
		if (( fresh_candidates_length > cached_candidates_length )); then
            echo ""
            __sdkman_echo_green "Adding new candidates(s): ${diff:0:-1}"
            echo "$fresh_candidates_csv" > "$SDKMAN_CANDIDATES_CACHE"
            echo ""
            __sdkman_echo_yellow "Please open a new terminal now..."

		elif (( fresh_candidates_length < cached_candidates_length )); then
            local candidates_diff="${diff:0:-1}"
            echo ""
            __sdkman_echo_green "Removing obsolete candidates(s): ${diff:0:-1}"
            echo "$fresh_candidates_csv" > "$SDKMAN_CANDIDATES_CACHE"
            echo ""
            __sdkman_echo_yellow "Please open a new terminal now..."

        else
            __sdkman_echo_green "No new candidates found at this time."
		fi
	fi

}

function ___sdkman_check_candidates_cache {
    local candidates_cache="$1"
    if [[ -f "$candidates_cache" && -n "$(cat "$candidates_cache")" && -n "$(find "$candidates_cache" -mmin +$((24*60*30)))" ]]; then
        __sdkman_echo_red 'Warning! SDKMAN out-of-date and requires an update.'
        __sdkman_echo_no_colour ''
        __sdkman_echo_no_colour '  $ sdk update'
        return 0
    elif [[ -f "$candidates_cache" && -z "$(cat "$candidates_cache")" ]]; then
        __sdkman_echo_red 'Warning! Cache is corrupt. SDKMAN can not be used until updated. Please run:'
        __sdkman_echo_no_colour ''
        __sdkman_echo_no_colour '  $ sdk update'
        return 1
    else
        __sdkman_echo_debug "SDKMAN: No update needed. Using existing candidates cache: $SDKMAN_CANDIDATES_CSV"
        return 0
    fi

}