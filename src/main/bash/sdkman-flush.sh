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
	local folder="$1"
	sdkman_cleanup_dir="${SDKMAN_DIR}/${folder}"
	sdkman_cleanup_disk_usage=$(du -sh "$sdkman_cleanup_dir")
	sdkman_cleanup_count=$(ls -1 "$sdkman_cleanup_dir" | wc -l)

	rm -rf "${SDKMAN_DIR}/${folder}"
	mkdir "${SDKMAN_DIR}/${folder}"

	echo "${sdkman_cleanup_count} archive(s) flushed, freeing ${sdkman_cleanup_disk_usage}."
}

function __sdkman_flush {
	local qualifier="$1"

	case "$qualifier" in
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