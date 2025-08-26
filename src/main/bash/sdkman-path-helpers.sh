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

function __sdkman_path_contains() {
	local candidate exists

	candidate="$1"
	exists="$(echo "$PATH" | grep "$candidate")"
	if [[ -n "$exists" ]]; then
		echo 'true'
	else
		echo 'false'
	fi
}

function __sdkman_add_to_path() {
	local candidate present

	candidate="$1"

	present=$(__sdkman_path_contains "$candidate")
	if [[ "$present" == 'false' ]]; then
		PATH="$SDKMAN_CANDIDATES_DIR/$candidate/current/bin:$PATH"
	fi
}

function __sdkman_set_candidate_home() {
	local candidate version upper_candidate

	candidate="$1"
	version="$2"

	upper_candidate=$(echo "$candidate" | tr '[:lower:]' '[:upper:]')
	export "${upper_candidate}_HOME"="${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}"
}

function __sdkman_export_candidate_home() {
	local candidate_name="$1" candidate_dir="$2" upcase_name

	# Generate home variable name using shell-specific methods
	# to avoid heavy-weight fork/exec system calls.

	if [ -n "${ZSH_VERSION-}" ]; then
		# zsh: uppercase via ${value:u}
		upcase_name="${candidate_name:u}"
	elif [ -n "${BASH_VERSION-}" ] && [ "${BASH_VERSINFO[0]:-0}" -ge 4 ] 2>/dev/null; then
		# bash 4.0+: uppercase via ${value^^}
		upcase_name="${candidate_name^^}"
	else
		# POSIX fallback: call external tool for conversion
		upcase_name="$(printf %s "$candidate_name" | tr '[:lower:]' '[:upper:]')"
	fi

	export "${upcase_name}_HOME=$candidate_dir"
}

function __sdkman_prepend_candidate_to_path() {
	local candidate_dir="$1"

	# Caution: external commands are costly here
	# since this function runs inside a loop.

	# replace the original candidate_dir with the 'bin' subfolder if it exists
	if [ -d "${candidate_dir}/bin" ]; then
		candidate_dir="${candidate_dir}/bin"
	fi
	# prepend PATH with the candidate_dir if it is not already there,
	# assuming the dir doesn't contain meta-characters like ? * []
	[[ ":$PATH:" == *":$candidate_dir:"* ]] || PATH="${candidate_dir}:${PATH}"
}

function __sdkman_link_candidate_version() {
	local candidate version

	candidate="$1"
	version="$2"

	# Change the 'current' symlink for the candidate, hence affecting all shells.
	if [[ -L "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" || -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/current" ]]; then
		rm -rf "${SDKMAN_CANDIDATES_DIR}/${candidate}/current"
	fi

	ln -s "${version}" "${SDKMAN_CANDIDATES_DIR}/${candidate}/current"
}
