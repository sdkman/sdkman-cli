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

function __sdk_env() {
	local -r sdkmanrc=".sdkmanrc"
	local -r subcommand="$1"

	case $subcommand in
		"")    __sdkman_load_env "$sdkmanrc" ;;
		init)  __sdkman_create_env_file "$sdkmanrc";;
		install) __sdkman_setup_env "$sdkmanrc";;
		clear) __sdkman_clear_env "$sdkmanrc";;
	esac
}

function __sdkman_setup_env() {
	local sdkmanrc="$1"

	if [[ ! -f "$sdkmanrc" ]]; then
		__sdkman_echo_red "Could not find $sdkmanrc in the current directory."
		echo ""
		__sdkman_echo_yellow "Run 'sdk env init' to create it."

		return 1
	fi

	sdkman_auto_answer="true" USE="n" __sdkman_env_each_candidate "$sdkmanrc" "__sdk_install"
	__sdkman_load_env "$sdkmanrc"
}

function __sdkman_load_env() {
	local sdkmanrc="$1"
	
	if [[ ! -f "$sdkmanrc" ]]; then
		__sdkman_echo_red "Could not find $sdkmanrc in the current directory."
		echo ""
		__sdkman_echo_yellow "Run 'sdk env init' to create it."

		return 1
	fi

	__sdkman_env_each_candidate "$sdkmanrc" "__sdkman_check_and_use" && 
		SDKMAN_ENV=$PWD
}

function __sdkman_check_and_use() {
	local -r candidate=$1
	local -r version=$2

	if [[ ! -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}" ]]; then
		__sdkman_echo_red "Stop! $candidate $version is not installed."
		echo ""
		__sdkman_echo_yellow "Run 'sdk env install' to install it."

		return 1
	fi

	__sdk_use "$candidate" "$version"
}

function __sdkman_create_env_file() {
	local sdkmanrc="$1"
	
	if [[ -f "$sdkmanrc" ]]; then
		__sdkman_echo_red "$sdkmanrc already exists!"

		return 1
	fi

	__sdkman_determine_current_version "java"

	local version
	[[ -n "$CURRENT" ]] && version="$CURRENT" || version="$(__sdkman_secure_curl "${SDKMAN_CANDIDATES_API}/candidates/default/java")"

	cat <<-eof >|"$sdkmanrc"
	# Enable auto-env through the sdkman_auto_env config
	# Add key=value pairs of SDKs to use below
	java=$version
	eof

	__sdkman_echo_green "$sdkmanrc created."
}

function __sdkman_clear_env() {
	local sdkmanrc="$1"

	if [[ -z $SDKMAN_ENV ]]; then
		__sdkman_echo_red "No environment currently set!"
		return 1
	fi

	if [[ ! -f ${SDKMAN_ENV}/${sdkmanrc} ]]; then
		__sdkman_echo_red "Could not find ${SDKMAN_ENV}/${sdkmanrc}."
		return 1
	fi

	__sdkman_env_each_candidate "${SDKMAN_ENV}/${sdkmanrc}" "__sdkman_env_restore_default_version"
	unset SDKMAN_ENV
}

function __sdkman_env_restore_default_version() {
	local -r candidate="$1"

	local candidate_dir default_version
	candidate_dir="${SDKMAN_CANDIDATES_DIR}/${candidate}/current"
	if __sdkman_is_symlink $candidate_dir; then
		default_version=$(basename $(readlink ${candidate_dir}))
		__sdk_use "$candidate" "$default_version" >/dev/null &&
			__sdkman_echo_yellow "Restored $candidate version to $default_version (default)"
	else
		__sdkman_echo_yellow "No default version of $candidate was found"
	fi
}

function __sdkman_env_each_candidate() {
	local -r filepath=$1
	local -r func=$2

	local normalised_line
	while IFS= read -r line || [[ -n "$line" ]]; do
		normalised_line="$(__sdkman_normalise "$line")"

		__sdkman_is_blank_line "$normalised_line" && continue

		if ! __sdkman_matches_candidate_format "$normalised_line"; then
			__sdkman_echo_red "Invalid candidate format!"
			echo ""
			__sdkman_echo_yellow "Expected 'candidate=version' but found '$normalised_line'"

			return 1
		fi

		$func "${normalised_line%=*}" "${normalised_line#*=}" || return
	done < "$filepath"
}

function __sdkman_is_symlink() {
	[[ -h "$1" ]]
}

function __sdkman_is_blank_line() {
	[[ -z "$1" ]]
}

function __sdkman_normalise() {
	local -r line_without_comments="${1/\#*/}"

	echo "${line_without_comments//[[:space:]]/}"
}

function __sdkman_matches_candidate_format() {
	[[ "$1" =~ ^[[:lower:]]+\=.+$ ]]
}
