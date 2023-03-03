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

	force_selfupdate="$1"
	if [[ "$SDKMAN_AVAILABLE" == "false" ]]; then
		echo "This command is not available while offline."
	elif [[ "$SDKMAN_REMOTE_VERSION" == "$SDKMAN_VERSION" && "$force_selfupdate" != "force" ]]; then
		echo "No update available at this time."
	elif [[ "$sdkman_beta_channel" == "true" ]]; then
		export sdkman_debug_mode
		__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/selfupdate/beta/${SDKMAN_PLATFORM}" | bash
	else
		export sdkman_debug_mode
		__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/selfupdate/stable/${SDKMAN_PLATFORM}" | bash
	fi
}
