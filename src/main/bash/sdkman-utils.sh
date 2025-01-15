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

function __sdkman_echo_debug() {
	[[ "$sdkman_debug_mode" == 'true' ]] && echo "$1"
}

function __sdkman_secure_curl() {
	if [[ "${sdkman_insecure_ssl}" == 'true' ]]; then
		curl --insecure --silent --location "$1"
	else
		curl --silent --location "$1"
	fi
}

function __sdkman_secure_curl_download() {
	local curl_params
	curl_params=('--progress-bar' '--location')

	[[ "${sdkman_debug_mode}" == 'true' ]] && curl_params+=('--verbose')
	[[ "${sdkman_curl_continue}" == 'true' ]] && curl_params+=('-C' '-')
	[[ -n "${sdkman_curl_retry_max_time}" ]] && curl_params+=('--retry-max-time' "${sdkman_curl_retry_max_time}")
	[[ -n "${sdkman_curl_retry}" ]] && curl_params+=('--retry' "${sdkman_curl_retry}")
	[[ "${sdkman_insecure_ssl}" == 'true' ]] && curl_params+=('--insecure')

	curl "${curl_params[@]}" "${@}"
}

function __sdkman_secure_curl_with_timeouts() {
	local -a curl_params=(
		'--silent'
		'--location'
		'--connect-timeout'
		"${sdkman_curl_connect_timeout}"
		'--max-time'
		"${sdkman_curl_max_time}"
	)

	if [[ "${sdkman_insecure_ssl}" == 'true' ]]; then
		curl --insecure "${curl_params[@]}" "$1"
	else
		curl "${curl_params[@]}" "$1"
	fi
}

function __sdkman_echo_paged() {
	if [[ -n "$PAGER" ]]; then
		echo "$@" | eval "$PAGER"
	elif command -v less >& /dev/null; then
		echo "$@" | less
	else
		echo "$@"
	fi
}

function __sdkman_echo() {
	if [[ "$sdkman_colour_enable" == 'false' ]]; then
		echo -e "$2"
	else
		echo -e "\033[1;$1$2\033[0m"
	fi
}

function __sdkman_echo_red() {
	__sdkman_echo "31m" "$1"
}

function __sdkman_echo_no_colour() {
	echo "$1"
}

function __sdkman_echo_yellow() {
	__sdkman_echo "33m" "$1"
}

function __sdkman_echo_green() {
	__sdkman_echo "32m" "$1"
}

function __sdkman_echo_cyan() {
	__sdkman_echo "36m" "$1"
}

function __sdkman_echo_confirm() {
	if [[ "$sdkman_colour_enable" == 'false' ]]; then
		echo -n "$1"
	else
		echo -e -n "\033[1;33m$1\033[0m"
	fi
}

function __sdkman_deprecation_notice() {
	local message="
[Deprecation Notice]:
This legacy '$1' command is replaced by a native implementation
and it will be removed in a future release.
Please follow the discussion here:
https://github.com/sdkman/sdkman-cli/discussions/1332"

	if [[ "$sdkman_colour_enable" == 'false' ]]; then
		__sdkman_echo_no_colour "$message"
	else
		__sdkman_echo_yellow "$message"
	fi
}