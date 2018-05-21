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

function __sdkman_echo_debug {
	if [[ "$sdkman_debug_mode" == 'true' ]]; then
		echo "$1"
	fi
}

function __sdkman_secure_curl {
	if [[ "${sdkman_insecure_ssl}" == 'true' ]]; then
		curl --insecure --silent --location "$1"
	else
		curl --silent --location "$1"
	fi
}

function __sdkman_secure_curl_download {
	local curl_params="--progress-bar --location"
	if [[ "${sdkman_insecure_ssl}" == 'true' ]]; then
		curl_params="$curl_params --insecure"
	fi

	local cookie_file="${SDKMAN_DIR}/var/cookie"

	if [[ -f "$cookie_file" ]]; then
		local cookie=$(cat "$cookie_file")
		curl_params="$curl_params --cookie $cookie"
	fi

	if [[ "$zsh_shell" == 'true' ]]; then
		curl ${=curl_params} "$1"
	else
		curl ${curl_params} "$1"
	fi
}

function __sdkman_secure_curl_with_timeouts {
	if [[ "${sdkman_insecure_ssl}" == 'true' ]]; then
		curl --insecure --silent --location --connect-timeout ${sdkman_curl_connect_timeout} --max-time ${sdkman_curl_max_time} "$1"
	else
		curl --silent --location --connect-timeout ${sdkman_curl_connect_timeout} --max-time ${sdkman_curl_max_time} "$1"
	fi
}

function __sdkman_page {
	if [[ -n "$PAGER" ]]; then
		"$@" | eval $PAGER
	elif command -v less >& /dev/null; then
		"$@" | less
	else
		"$@"
	fi
}

function __sdkman_echo {
	if [[ "$sdkman_colour_enable" == 'false' ]]; then
		echo -e "$2"
	else
		echo -e "\033[1;$1$2\033[0m"
	fi
}

function __sdkman_echo_red {
	__sdkman_echo "31m" "$1"
}

function __sdkman_echo_no_colour {
	echo "$1"
}

function __sdkman_echo_yellow {
	__sdkman_echo "33m" "$1"
}

function __sdkman_echo_green {
	__sdkman_echo "32m" "$1"
}

function __sdkman_echo_cyan {
	__sdkman_echo "36m" "$1"
}

function __sdkman_echo_confirm {
	if [[ "$sdkman_colour_enable" == 'false' ]]; then
		echo -n "$1"
	else
		echo -e -n "\033[1;33m$1\033[0m"
	fi
}

function __sdkman_legacy_bash_message {
    if [[ "$bash_shell" == 'true' && "$BASH_VERSINFO" -lt 4 ]]; then
        __sdkman_echo_red "An outdated version of bash was detected on your system!"
        echo ""
        __sdkman_echo_red "We recommend upgrading to bash 4.x, you have:"
        echo ""
        __sdkman_echo_yellow "  $(bash --version | head -n1)"
        echo ""
    fi
}
