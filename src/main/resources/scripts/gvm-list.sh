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

function __gvmtool_list {
	CANDIDATE="$1"
	__gvmtool_check_candidate_present "${CANDIDATE}" || return 1
	__gvmtool_build_version_csv "${CANDIDATE}"
	__gvmtool_determine_current_version "${CANDIDATE}"
	if [[ "${GVM_ONLINE}" == "false" ]]; then
		__gvmtool_offline_list
	else
		FRAGMENT=$(curl -s "${GVM_SERVICE}/candidates/${CANDIDATE}/list?platform=${GVM_PLATFORM}&current=${CURRENT}&installed=${CSV}")
		echo "${FRAGMENT}"
		unset FRAGMENT
	fi
}
