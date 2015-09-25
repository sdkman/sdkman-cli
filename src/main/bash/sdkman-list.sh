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

function __sdkman_build_version_csv {
	CANDIDATE="$1"
    SDKMAN_VERSIONS_CSV=""
	if [[ -d "${SDKMAN_DIR}/${CANDIDATE}" ]]; then
		for version in $(find "${SDKMAN_DIR}/${CANDIDATE}" -maxdepth 1 -mindepth 1 -exec basename '{}' \; | sort -r); do
			if [[ "${version}" != 'current' ]]; then
				SDKMAN_VERSIONS_CSV="${version},${SDKMAN_VERSIONS_CSV}"
			fi
		done
		SDKMAN_VERSIONS_CSV=${SDKMAN_VERSIONS_CSV%?}
	fi
}

function __sdkman_offline_list {
	echo "------------------------------------------------------------"
	echo "Offline Mode: only showing installed ${CANDIDATE} versions"
	echo "------------------------------------------------------------"
	echo "                                                            "

	sdkman_versions=($(echo ${SDKMAN_VERSIONS_CSV//,/ }))
	for (( i=0 ; i <= ${#sdkman_versions} ; i++ )); do
		if [[ -n "${sdkman_versions[${i}]}" ]]; then
			if [[ "${sdkman_versions[${i}]}" == "${CURRENT}" ]]; then
				echo -e " > ${sdkman_versions[${i}]}"
			else
				echo -e " * ${sdkman_versions[${i}]}"
			fi
		fi
	done

	if [[ -z "${sdkman_versions[@]}" ]]; then
		echo "   None installed!"
	fi

	echo "------------------------------------------------------------"
	echo "* - installed                                               "
	echo "> - currently in use                                        "
	echo "------------------------------------------------------------"

	unset CSV sdkman_versions
}

function __sdkman_list {
	CANDIDATE="$1"
	__sdkman_check_candidate_present "${CANDIDATE}" || return 1
	__sdkman_build_version_csv "${CANDIDATE}"
	__sdkman_determine_current_version "${CANDIDATE}"

	if [[ "${SDKMAN_AVAILABLE}" == "false" ]]; then
		__sdkman_offline_list
	else
        echo "$(curl -s "${SDKMAN_SERVICE}/candidates/${CANDIDATE}/list?platform=${SDKMAN_PLATFORM}&current=${CURRENT}&installed=${SDKMAN_VERSIONS_CSV}")"
	fi
}
