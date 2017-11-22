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

function __sdk_upgrade {
	local all candidates candidate upgradable installed_count upgradable_count upgradable_candidates
	if [ -n "$1" ]; then
		all=false
		candidates=$1
	else
		all=true
		if [[ "$zsh_shell" == 'true' ]]; then
			candidates=( ${SDKMAN_CANDIDATES[@]} )
		else
			candidates=${SDKMAN_CANDIDATES[@]}
		fi
	fi
	installed_count=0
	upgradable_count=0
	echo ""
	for candidate in ${candidates}; do
		upgradable="$(__sdkman_determine_upgradable_version "$candidate")"
		case $? in
			1)
				$all || __sdkman_echo_red "Not using any version of ${candidate}"
				;;
			2)
				echo ""
				__sdkman_echo_red "Stop! Could not get remote version of ${candidate}"
				return 1
				;;
			*)
				if [ -n "$upgradable" ]; then
					[ ${upgradable_count} -eq 0 ] && __sdkman_echo_no_colour "Upgrade:"
					__sdkman_echo_no_colour "$upgradable"
					(( upgradable_count += 1 ))
					upgradable_candidates=(${upgradable_candidates[@]} $candidate)
				fi
				(( installed_count += 1 ))
				;;
		esac
	done
	if $all; then
		if [ ${installed_count} -eq 0 ]; then
			__sdkman_echo_no_colour 'No candidates are in use'
		elif [ ${upgradable_count} -eq 0 ]; then
			__sdkman_echo_no_colour "All candidates are up-to-date"
		fi
	elif [ ${upgradable_count} -eq 0 ]; then
		__sdkman_echo_no_colour "${candidate} is up-to-date"
	fi
	if [ ${upgradable_count} -gt 0 ]; then
		echo ""
		__sdkman_echo_confirm "Upgrade candidate(s) and set latest version(s) as default? (Y/n): "
		read UPGRADE_ALL
		export auto_answer_upgrade='true'
		if [[ -z "$UPGRADE_ALL" || "$UPGRADE_ALL" == "y" || "$UPGRADE_ALL" == "Y" ]]; then
			# Using array for bash & zsh compatibility
			for (( i=0; i <= ${#upgradable_candidates[*]}; i++ )); do
				upgradable_candidate="${upgradable_candidates[${i}]}"
				# Filter empty elements (in bash arrays are zero index based, in zsh they are 1 based)
				if [[ -n "$upgradable_candidate" ]]; then
					__sdk_install $upgradable_candidate
				fi
			done
		fi
		unset auto_answer_upgrade
	fi
}

function __sdkman_determine_upgradable_version {
	local candidate local_versions remote_default_version

	candidate="$1"

	# Resolve local versions
	local_versions="$(echo $(find "${SDKMAN_CANDIDATES_DIR}/${candidate}" -maxdepth 1 -mindepth 1 -type d -exec basename '{}' \; 2>/dev/null) | sed -e "s/ /, /g" )"
	if [ ${#local_versions} -eq 0 ]; then
		return 1
	fi

	# Resolve remote default version
	remote_default_version="$(__sdkman_secure_curl "${SDKMAN_CURRENT_API}/candidates/default/${candidate}")"
	if [ -z "$remote_default_version" ]; then
		return 2
	fi

	# Check upgradable or not
	if [ ! -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${remote_default_version}" ]; then
		__sdkman_echo_yellow "${candidate} (${local_versions} < ${remote_default_version})"
	fi
}
