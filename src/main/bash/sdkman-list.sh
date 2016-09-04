#!/bin/bash

#
#   Copyright 2012 Marco Vermeulen
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

function __sdk_list {
    local candidate="$1"

    if [[ -z "$candidate" ]]; then
        __sdkman_list_candidates
    else
        __sdkman_list_versions "$candidate"
    fi
}

function __sdkman_list_candidates {
	if [[ "$SDKMAN_AVAILABLE" == "false" ]]; then
		echo "This command is not available while offline."
	else
		__sdkman_page echo "$(__sdkman_secure_curl "${SDKMAN_LEGACY_API}/candidates/list")"
	fi
}

function __sdkman_list_versions {
	local candidate versions_csv

	candidate="$1"
	versions_csv="$(__sdkman_build_version_csv "$candidate")"
	__sdkman_determine_current_version "$candidate"

	if [[ "$SDKMAN_AVAILABLE" == "false" ]]; then
		__sdkman_offline_list "$candidate" "$versions_csv"
	else
        echo "$(__sdkman_secure_curl "${SDKMAN_LEGACY_API}/candidates/${candidate}/list?current=${CURRENT}&installed=${versions_csv}")"
	fi
}

function __sdkman_build_version_csv {
	local candidate versions_csv

	candidate="$1"
    versions_csv=""

	if [[ -d "${SDKMAN_CANDIDATES_DIR}/${candidate}" ]]; then
		for version in $(find "${SDKMAN_CANDIDATES_DIR}/${candidate}" -maxdepth 1 -mindepth 1 -exec basename '{}' \; | sort -r); do
			if [[ "$version" != 'current' ]]; then
				versions_csv="${version},${versions_csv}"
			fi
		done
		versions_csv=${versions_csv%?}
	fi
	echo "$versions_csv"
}

function __sdkman_offline_list {
	local candidate versions_csv

	candidate="$1"
	versions_csv="$2"

	echo "------------------------------------------------------------"
	echo "Offline: only showing installed ${candidate} versions"
	echo "------------------------------------------------------------"
	echo "                                                            "

	local versions=($(echo ${versions_csv//,/ }))
	for (( i=0 ; i <= ${#versions} ; i++ )); do
		if [[ -n "${versions[${i}]}" ]]; then
			if [[ "${versions[${i}]}" == "$CURRENT" ]]; then
				echo -e " > ${versions[${i}]}"
			else
				echo -e " * ${versions[${i}]}"
			fi
		fi
	done

	if [[ -z "${versions[@]}" ]]; then
		echo "   None installed!"
	fi

	echo "------------------------------------------------------------"
	echo "* - installed                                               "
	echo "> - currently in use                                        "
	echo "------------------------------------------------------------"
}
