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

function __sdkman_update_service_availability() {
	if [[ "$sdkman_healthcheck_enable" == "false" ]]; then
		return
	fi
	local healthcheck_status=$(__sdkman_determine_healthcheck_status)
	__sdkman_set_availability "$healthcheck_status"
}

function __sdkman_determine_healthcheck_status() {
	echo $(__sdkman_secure_curl_with_timeouts "${SDKMAN_CANDIDATES_API}/healthcheck")
}

function __sdkman_set_availability() {
	local healthcheck_status="$1"
	local detect_html="$(echo "$healthcheck_status" | tr '[:upper:]' '[:lower:]' | grep 'html')"
	if [[ -z "$healthcheck_status" ]]; then
		SDKMAN_AVAILABLE="false"
		__sdkman_display_network_warning "$healthcheck_status"
	elif [[ -n "$detect_html" ]]; then
		SDKMAN_AVAILABLE="false"
		__sdkman_display_proxy_warning
	else
		SDKMAN_AVAILABLE="true"
	fi
}

function __sdkman_display_network_warning() {
	local healthcheck_status="$1"
	if [[ -z "$healthcheck_status" ]]; then
		__sdkman_echo_red "==== INTERNET NOT REACHABLE! ==================================================="
		__sdkman_echo_red ""
		__sdkman_echo_red " Some functionality is disabled or only partially available."
		__sdkman_echo_red " If this persists, disable the healthcheck in ${SDKMAN_DIR}/etc/config:"
		__sdkman_echo_red ""
		__sdkman_echo_red "   sdkman_healthcheck_enable=false"
		__sdkman_echo_red ""
		__sdkman_echo_red " Then open a new terminal for the change to take effect."
		__sdkman_echo_red ""
		__sdkman_echo_red "================================================================================"
		echo ""
	fi
}

function __sdkman_display_proxy_warning() {
	__sdkman_echo_red "==== PROXY DETECTED! ==========================================================="
	__sdkman_echo_red "Please ensure you have open internet access to continue."
	__sdkman_echo_red "================================================================================"
	echo ""
}
