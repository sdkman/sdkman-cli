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

function __sdk_install {
	local candidate version folder

	candidate="$1"
	version="$2"
	folder="$3"

	__sdkman_check_candidate_present "$candidate" || return 1
	__sdkman_determine_version "$candidate" "$version" "$folder" || return 1

	if [[ -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${VERSION}" || -h "${SDKMAN_CANDIDATES_DIR}/${candidate}/${VERSION}" ]]; then
		echo ""
		echo "Stop! ${candidate} ${VERSION} is already installed."
		return 0
	fi

	if [[ ${VERSION_VALID} == 'valid' ]]; then
		__sdkman_install_candidate_version "$candidate" "$VERSION" || return 1

		if [[ "$sdkman_auto_answer" != 'true' ]]; then
			echo -n "Do you want ${candidate} ${VERSION} to be set as default? (Y/n): "
			read USE
		fi
		if [[ -z "$USE" || "$USE" == "y" || "$USE" == "Y" ]]; then
			echo ""
			echo "Setting ${candidate} ${VERSION} as default."
			__sdkman_link_candidate_version "$candidate" "$VERSION"
			__sdkman_add_to_path "$candidate"
		fi
		return 0

	elif [[ "$VERSION_VALID" == 'invalid' && -n "$folder" ]]; then
		__sdkman_install_local_version "$candidate" "$VERSION" "$folder" || return 1

    else
        echo ""
		echo "Stop! $1 is not a valid ${candidate} version."
		return 1
	fi
}

function __sdkman_install_candidate_version {
	local candidate version

	candidate="$1"
	version="$2"

	__sdkman_download "$candidate" "$version" || return 1
	echo "Installing: ${candidate} ${version}"

	mkdir -p "${SDKMAN_CANDIDATES_DIR}/${candidate}"

	rm -rf "${SDKMAN_DIR}/tmp/out"
	unzip -oq "${SDKMAN_DIR}/archives/${candidate}-${version}.zip" -d "${SDKMAN_DIR}/tmp/out"
	mv "$SDKMAN_DIR"/tmp/out/* "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}"
	echo "Done installing!"
	echo ""
}

function __sdkman_install_local_version {
	local candidate version folder

	candidate="$1"
	version="$2"
	folder="$3"

	mkdir -p "${SDKMAN_CANDIDATES_DIR}/${candidate}"

	echo "Linking ${candidate} ${version} to ${folder}"
	ln -s "$folder" "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}"
	echo "Done installing!"
	echo ""
}

function __sdkman_download {
	local candidate version archives_folder

	candidate="$1"
	version="$2"

	archives_folder="${SDKMAN_DIR}/archives"
	if [ ! -f "${archives_folder}/${candidate}-${version}.zip" ]; then

		#TODO: pre installation hook here

		echo ""
		echo "Downloading: ${candidate} ${version}"
		echo ""
		echo "In progress..."
		echo ""

		local platform_parameter="$(echo $SDKMAN_PLATFORM | tr '[:upper:]' '[:lower:]')"
		local download_url="${SDKMAN_CURRENT_API}/broker/download/${candidate}/${version}/${platform_parameter}"
		local base_name="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"
		local zip_archive_target="${SDKMAN_DIR}/archives/${candidate}-${version}.zip"

		export local binary_input="${SDKMAN_DIR}/tmp/${base_name}.bin"
		export local zip_output="${SDKMAN_DIR}/tmp/$base_name.zip"

		__sdkman_secure_curl_download "$download_url" > "$binary_input"
		__sdkman_echo_debug "Downloaded binary to: $binary_input"

		#responsible for taking `binary_input` and producing `zip_output`
		__sdkman_secure_curl "${SDKMAN_CURRENT_API}/hooks/post/${candidate}/${version}/${platform_parameter}" | bash
		__sdkman_echo_debug "Processed binary as: $zip_output"

		mv "$zip_output" "$zip_archive_target"
		__sdkman_echo_debug "Moved to archive folder: $zip_archive_target"
	else
		echo ""
		echo "Found a previously downloaded ${candidate} ${version} archive. Not downloading it again..."
	fi
	__sdkman_validate_zip "${archives_folder}/${candidate}-${version}.zip" || return 1
	echo ""
}

function __sdkman_validate_zip {
	local zip_archive zip_ok

	zip_archive="$1"
	zip_ok=$(unzip -t "$zip_archive" | grep 'No errors detected in compressed data')
	if [ -z "$zip_ok" ]; then
		rm "$zip_archive"
		echo ""
		echo "Stop! The archive was corrupt and has been removed! Please try installing again."
		return 1
	fi
}
