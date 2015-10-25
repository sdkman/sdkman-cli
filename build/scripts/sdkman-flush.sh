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

function __sdkman_cleanup_folder {
	SDKMAN_CLEANUP_DIR="${SDKMAN_DIR}/${1}"
	SDKMAN_CLEANUP_DU=$(du -sh "$SDKMAN_CLEANUP_DIR")
	SDKMAN_CLEANUP_COUNT=$(ls -1 "$SDKMAN_CLEANUP_DIR" | wc -l)

	rm -rf "${SDKMAN_DIR}/${1}"
	mkdir "${SDKMAN_DIR}/${1}"

	echo "${SDKMAN_CLEANUP_COUNT} archive(s) flushed, freeing ${SDKMAN_CLEANUP_DU}."

	unset SDKMAN_CLEANUP_DIR
	unset SDKMAN_CLEANUP_DU
	unset SDKMAN_CLEANUP_COUNT
}

function __sdkman_flush {
	QUALIFIER="$1"
	case "$QUALIFIER" in
		candidates)
			if [[ -f "${SDKMAN_DIR}/var/candidates" ]]; then
		        rm "${SDKMAN_DIR}/var/candidates"
		        echo "Candidates have been flushed."
		    else
		        echo "No candidate list found so not flushed."
		    fi
		    ;;
		broadcast)
			if [[ -f "${SDKMAN_DIR}/var/broadcast" ]]; then
		        rm "${SDKMAN_DIR}/var/broadcast"
		        echo "Broadcast has been flushed."
		    else
		        echo "No prior broadcast found so not flushed."
		    fi
		    ;;
		version)
			if [[ -f "${SDKMAN_DIR}/var/version" ]]; then
		        rm "${SDKMAN_DIR}/var/version"
		        echo "Version Token has been flushed."
		    else
		        echo "No prior Remote Version found so not flushed."
		    fi
		    ;;
		archives)
			__sdkman_cleanup_folder "archives"
		    ;;
		temp)
			__sdkman_cleanup_folder "tmp"
		    ;;
		tmp)
			__sdkman_cleanup_folder "tmp"
		    ;;
		*)
			echo "Stop! Please specify what you want to flush."
			;;
	esac
}