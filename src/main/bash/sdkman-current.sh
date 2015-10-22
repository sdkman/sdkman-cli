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

function __sdkman_determine_current_version {
	CANDIDATE="$1"
	__sdkman_path_contains "${CANDIDATE}"

	if [[  "${SDKMAN_CANDIDATE_IN_PATH}" == 'true' ]]; then
		if [[ "${solaris}" == true ]]; then
			CURRENT=$(echo $PATH | gsed -r "s|${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/([^/]+)/bin|!!\1!!|1" | gsed -r "s|^.*!!(.+)!!.*$|\1|g")
		elif [[ "${darwin}" == true ]]; then
			CURRENT=$(echo $PATH | sed -E "s|${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/([^/]+)/bin|!!\1!!|1" | sed -E "s|^.*!!(.+)!!.*$|\1|g")
		else
			CURRENT=$(echo $PATH | sed -r "s|${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/([^/]+)/bin|!!\1!!|1" | sed -r "s|^.*!!(.+)!!.*$|\1|g")
		fi

		if [[ "${CURRENT}" == "current" ]]; then
			CURRENT=$(readlink "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/current" | sed "s!${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/!!g")
		fi
	else
		CURRENT=""
	fi
}

function __sdkman_current {
	if [ -n "$1" ]; then
		CANDIDATE="$1"
		__sdkman_determine_current_version "${CANDIDATE}"
		if [ -n "${CURRENT}" ]; then
			echo "Using ${CANDIDATE} version ${CURRENT}"
		else
			echo "Not using any version of ${CANDIDATE}"
		fi
	else
		INSTALLED_COUNT=0
		for (( i=0; i <= ${#SDKMAN_CANDIDATES[*]}; i++ )); do
			# Eliminate empty entries due to incompatibility
			if [[ -n ${SDKMAN_CANDIDATES[${i}]} ]]; then
				__sdkman_determine_current_version "${SDKMAN_CANDIDATES[${i}]}"
				if [ -n "${CURRENT}" ]; then
					if [ ${INSTALLED_COUNT} -eq 0 ]; then
						echo 'Using:'
					fi
					echo "${SDKMAN_CANDIDATES[${i}]}: ${CURRENT}"
					(( INSTALLED_COUNT += 1 ))
				fi
			fi
		done
		if [ ${INSTALLED_COUNT} -eq 0 ]; then
			echo 'No candidates are in use'
		fi
	fi
}