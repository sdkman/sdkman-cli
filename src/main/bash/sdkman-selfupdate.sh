#!/usr/bin/env bash

#
#   Copyright 2021 Marco Vermeulen
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

function __sdk_selfupdate() {
	local force_selfupdate
	local sdkman_version_api

	if [[ "$SDKMAN_AVAILABLE" == "false" ]]; then
		echo "This command is not available while offline."
		return 1
	fi 

	if [[ "$sdkman_beta_channel" == "true" ]]; then
		sdkman_version_api="${SDKMAN_CANDIDATES_API}/broker/version/sdkman/script/beta"
	else
		sdkman_version_api="${SDKMAN_CANDIDATES_API}/broker/version/sdkman/script/stable"
	fi 

	sdkman_remote_version=$(__sdkman_secure_curl "$sdkman_version_api")
	sdkman_local_version=$(cat "$SDKMAN_DIR/var/version")
	__sdkman_echo_debug "Local version: $sdkman_local_version; remote version: $sdkman_remote_version"
	
	force_selfupdate="$1"
	export sdkman_debug_mode
	if [[ "$sdkman_local_version" == "$sdkman_remote_version" && "$force_selfupdate" != "force" ]]; then
		echo "No update available at this time."
	elif [[ "$sdkman_beta_channel" == "true" ]]; then
		__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/selfupdate/beta/${SDKMAN_PLATFORM}" | bash
	else
		__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/selfupdate/stable/${SDKMAN_PLATFORM}" | bash
	fi
}
