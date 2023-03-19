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
	local sdkman_script_version_api
	local sdkman_native_version_api

	if [[ "$SDKMAN_AVAILABLE" == "false" ]]; then
		echo "This command is not available while offline."
		return 1
	fi

	if [[ "$sdkman_beta_channel" == "true" ]]; then
		sdkman_script_version_api="${SDKMAN_CANDIDATES_API}/broker/version/sdkman/script/beta"
		sdkman_native_version_api="${SDKMAN_CANDIDATES_API}/broker/version/sdkman/native/beta"
	else
		sdkman_script_version_api="${SDKMAN_CANDIDATES_API}/broker/version/sdkman/script/stable"
		sdkman_native_version_api="${SDKMAN_CANDIDATES_API}/broker/version/sdkman/native/stable"
	fi

	sdkman_remote_script_version=$(__sdkman_secure_curl "$sdkman_script_version_api")
	sdkman_remote_native_version=$(__sdkman_secure_curl "$sdkman_native_version_api")

	sdkman_local_script_version=$(< "$SDKMAN_DIR/var/version")
	sdkman_local_native_version=$(< "$SDKMAN_DIR/var/version_native")

	__sdkman_echo_debug "Script: local version: $sdkman_local_script_version; remote version: $sdkman_remote_script_version"
	__sdkman_echo_debug "Native: local version: $sdkman_local_native_version; remote version: $sdkman_remote_native_version"

	force_selfupdate="$1"
	export sdkman_debug_mode
	if [[ "$sdkman_local_script_version" == "$sdkman_remote_script_version" && "$sdkman_local_native_version" == "$sdkman_remote_native_version" && "$force_selfupdate" != "force" ]]; then
		echo "No update available at this time."
	elif [[ "$sdkman_beta_channel" == "true" ]]; then
		__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/selfupdate/beta/${SDKMAN_PLATFORM}" | bash
	else
		__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/selfupdate/stable/${SDKMAN_PLATFORM}" | bash
	fi
}
