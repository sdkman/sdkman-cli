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

function __sdk_flush() {
	local qualifier="$1"

	case "$qualifier" in
	broadcast)
		if [[ -f "${SDKMAN_DIR}/var/broadcast_id" ]]; then
			rm "${SDKMAN_DIR}/var/broadcast_id"
			rm "${SDKMAN_DIR}/var/broadcast"
			__sdkman_echo_green "Broadcast has been flushed."
		else
			__sdkman_echo_no_colour "No prior broadcast found so not flushed."
		fi
		;;
	version)
		if [[ -f "${SDKMAN_DIR}/var/version" ]]; then
			rm "${SDKMAN_DIR}/var/version"
			__sdkman_echo_green "Version file has been flushed."
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
		__sdkman_echo_red "Stop! Please specify what you want to flush."
		;;
	esac
}

function __sdkman_cleanup_folder() {
	local folder="$1"
	sdkman_cleanup_dir="${SDKMAN_DIR}/${folder}"
	sdkman_cleanup_disk_usage=$(du -sh "$sdkman_cleanup_dir")
	sdkman_cleanup_count=$(ls -1 "$sdkman_cleanup_dir" | wc -l)

	rm -rf "${SDKMAN_DIR}/${folder}"
	mkdir "${SDKMAN_DIR}/${folder}"

	__sdkman_echo_green "${sdkman_cleanup_count} archive(s) flushed, freeing ${sdkman_cleanup_disk_usage}."
}
