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

function ___sdkman_check_candidates_cache {
    local candidates_cache="$1"
    if [[ -f "$candidates_cache" && -n "$(cat "$candidates_cache")" && -n "$(find "$candidates_cache" -mmin +$((24*60*30)))" ]]; then
        __sdkman_echo_yellow 'WARNING: SDKMAN is out-of-date and requires an update. Please run:'
        echo ''
        __sdkman_echo_no_colour '  $ sdk update'
        echo ''
        return 0
    elif [[ -f "$candidates_cache" && -z "$(cat "$candidates_cache")" ]]; then
        __sdkman_echo_red 'WARNING: Cache is corrupt. SDKMAN can not be used until updated.'
        echo ''
        __sdkman_echo_no_colour '  $ sdk update'
        echo ''
        return 1
    else
        __sdkman_echo_debug "SDKMAN: No update needed. Using existing candidates cache: $SDKMAN_CANDIDATES_CSV"
        return 0
    fi
}

function ___sdkman_check_version_cache {
    local version_url
    local version_file="${SDKMAN_DIR}/var/version"

    if [[ "$sdkman_beta_channel" != "true" && -f "$version_file" && -z "$(find "$version_file" -mmin +$((60*24)))" ]]; then
        __sdkman_echo_debug "Not refreshing version cache now..."
        SDKMAN_REMOTE_VERSION=$(cat "$version_file")

    else
        __sdkman_echo_debug "Version cache needs updating..."
        if [[ "$sdkman_beta_channel" == "true" ]]; then
            __sdkman_echo_debug "Refreshing version cache with BETA version."
            version_url="${SDKMAN_CURRENT_API}/broker/download/sdkman/version/beta"
        else
            __sdkman_echo_debug "Refreshing version cache with STABLE version."
            version_url="${SDKMAN_CURRENT_API}/broker/download/sdkman/version/stable"
        fi

        SDKMAN_REMOTE_VERSION=$(__sdkman_secure_curl_with_timeouts "$version_url")
        if [[ -z "$SDKMAN_REMOTE_VERSION" || -n "$(echo "$SDKMAN_REMOTE_VERSION" | tr '[:upper:]' '[:lower:]' | grep 'html')" ]]; then
            __sdkman_echo_debug "Version information corrupt or empty! Ignoring: $SDKMAN_REMOTE_VERSION"
            SDKMAN_REMOTE_VERSION="$SDKMAN_VERSION"

        else
            __sdkman_echo_debug "Overwriting version cache with: $SDKMAN_REMOTE_VERSION"
            echo "${SDKMAN_REMOTE_VERSION}" > "$version_file"
        fi
    fi

}