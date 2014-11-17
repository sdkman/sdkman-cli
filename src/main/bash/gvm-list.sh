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

function __gvmtool_build_version_csv {
	CANDIDATE="$1"
	CSV=""
	for version in $(find -L "${GVM_DIR}/${CANDIDATE}" -maxdepth 1 -mindepth 1 -exec basename '{}' \; | sort); do
		if [[ "${version}" != 'current' ]]; then
			CSV="${version},${CSV}"
		fi
	done
	CSV=${CSV%?}
}

function __gvmtool_offline_list {
	echo "------------------------------------------------------------"
	echo "Offline Mode: only showing installed ${CANDIDATE} versions"
	echo "------------------------------------------------------------"
	echo "                                                            "

	gvm_versions=($(echo ${CSV//,/ }))
	for (( i=0 ; i <= ${#gvm_versions} ; i++ )); do
		if [[ -n "${gvm_versions[${i}]}" ]]; then
			if [[ "${gvm_versions[${i}]}" == "${CURRENT}" ]]; then
				echo -e " > ${gvm_versions[${i}]}"
			else
				echo -e " * ${gvm_versions[${i}]}"
			fi
		fi
	done

	if [[ -z "${gvm_versions[@]}" ]]; then
		echo "   None installed!"
	fi

	echo "------------------------------------------------------------"
	echo "* - installed                                               "
	echo "> - currently in use                                        "
	echo "------------------------------------------------------------"

	unset CSV gvm_versions
}

function __gvmtool_list {
	CANDIDATE="$1"
	__gvmtool_check_candidate_present "${CANDIDATE}" || return 1
	__gvmtool_build_version_csv "${CANDIDATE}"
	__gvmtool_determine_current_version "${CANDIDATE}"

	if [[ "${GVM_AVAILABLE}" == "false" ]]; then
		__gvmtool_offline_list
	else
		FRAGMENT=$(curl -s "${GVM_SERVICE}/candidates/${CANDIDATE}/list?platform=${GVM_PLATFORM}&current=${CURRENT}&installed=${CSV}")
		echo "${FRAGMENT}"
		unset FRAGMENT
	fi
}
