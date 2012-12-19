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


function __gvmtool_current {
	if [ -n "$1" ]; then
		CANDIDATE="$1"
		__gvmtool_determine_current_version "${CANDIDATE}"
		if [ -n "${CURRENT}" ]; then
			echo "Using ${CANDIDATE} version ${CURRENT}"
		else
			echo "Not using any version of ${CANDIDATE}"
		fi
	else
		# The candidates are assigned to an array for zsh compliance, a list of words is not iterable
		# Arrays are the only way, but unfortunately zsh arrays are not backward compatible with bash
		# In bash arrays are zero index based, in zsh they are 1 based(!)
		INSTALLED_COUNT=0
		# Starts at 0 for bash, ends at the candidate array size for zsh
		for (( i=0; i <= ${#GVM_CANDIDATES}; i++ )); do
			# Eliminate empty entries due to incompatibility
			if [[ -n ${GVM_CANDIDATES[${i}]} ]]; then
				__gvmtool_determine_current_version "${GVM_CANDIDATES[${i}]}"
				if [ -n "${CURRENT}" ]; then
					if [ ${INSTALLED_COUNT} -eq 0 ]; then
						echo 'Using:'
					fi
					echo "${GVM_CANDIDATES[${i}]}: ${CURRENT}"
					(( INSTALLED_COUNT += 1 ))
				fi
			fi
		done
		if [ ${INSTALLED_COUNT} -eq 0 ]; then
			echo 'No candidates are in use'
		fi
	fi
}
