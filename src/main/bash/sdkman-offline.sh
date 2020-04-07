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

function __sdk_offline() {
	local mode="$1"
	if [[ -z "$mode" || "$mode" == "enable" ]]; then
		SDKMAN_OFFLINE_MODE="true"
		__sdkman_echo_green "Offline mode enabled."
	fi

	if [[ "$mode" == "disable" ]]; then
		SDKMAN_OFFLINE_MODE="false"
		__sdkman_echo_green "Online mode re-enabled!"
	fi
}
