#!/usr/bin/env bash

#
#   Copyright 2021 Marco Vermeulen
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

function __sdk_install() {
	local candidate version folder

	candidate="$1"
	version="$2"
	folder="$3"

	__sdkman_check_candidate_present "$candidate" || return 1
	__sdkman_determine_version "$candidate" "$version" "$folder" || return 1

	if [[ -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${VERSION}" || -L "${SDKMAN_CANDIDATES_DIR}/${candidate}/${VERSION}" ]]; then
		echo ""
		__sdkman_echo_yellow "${candidate} ${VERSION} is already installed."
		return 0
	fi

	if [[ ${VERSION_VALID} == 'valid' ]]; then
		__sdkman_determine_current_version "$candidate"
		__sdkman_install_candidate_version "$candidate" "$VERSION" || return 1

		if [[ "$sdkman_auto_answer" != 'true' && "$auto_answer_upgrade" != 'true' && -n "$CURRENT" ]]; then
			__sdkman_echo_confirm "Do you want ${candidate} ${VERSION} to be set as default? (Y/n): "
			read USE
		fi

		if [[ -z "$USE" || "$USE" == "y" || "$USE" == "Y" ]]; then
			echo ""
			__sdkman_echo_green "Setting ${candidate} ${VERSION} as default."
			__sdkman_link_candidate_version "$candidate" "$VERSION"
			__sdkman_add_to_path "$candidate"
		fi

		return 0
	elif [[ "$VERSION_VALID" == 'invalid' && -n "$folder" ]]; then
		__sdkman_install_local_version "$candidate" "$VERSION" "$folder" || return 1
	else
		echo ""
		__sdkman_echo_red "Stop! $1 is not a valid ${candidate} version."
		return 1
	fi
}

function __sdkman_install_candidate_version() {
	local candidate version base_name headers_file archive_type
	local metadata_folder="${SDKMAN_DIR}/var/metadata"
	
	candidate="$1"
	version="$2"
	base_name="${candidate}-${version}"
	headers_file="${metadata_folder}/${base_name}.headers"
	
	mkdir -p ${metadata_folder}

	__sdkman_download "$candidate" "$version" "$headers_file" || return 1
	__sdkman_echo_green "Installing: ${candidate} ${version}"

	mkdir -p "${SDKMAN_CANDIDATES_DIR}/${candidate}"
	rm -rf "${SDKMAN_DIR}/tmp/out"
	
	archive_type=$(sed -n 's/^X-Sdkman-ArchiveType:\(.*\)$/\1/p' ${headers_file} | tr -cd '[:alnum:]')

	if [[ "${archive_type}" == 'zip' ]]; then
		unzip -oq "${SDKMAN_DIR}/tmp/${base_name}.bin" -d "${SDKMAN_DIR}/tmp/out"
	elif [[ "${archive_type}" == 'tar' ]]; then
		mkdir -p "${SDKMAN_DIR}/tmp/out"
		tar zxf "${SDKMAN_DIR}/tmp/${base_name}.bin" -C "${SDKMAN_DIR}/tmp/out"
	else
		echo ""
		__sdkman_echo_red "Stop! The archive type cannot be determined! Please try installing again."
		rm -f "${SDKMAN_DIR}/tmp/${base_name}.bin"
		return 1
	fi
	
	mv -f "$SDKMAN_DIR"/tmp/out/* "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}"
	__sdkman_echo_green "Done installing!"
	echo ""
}

function __sdkman_install_local_version() {
	local candidate version folder version_length version_length_max

	version_length_max=15

	candidate="$1"
	version="$2"
	folder="$3"

	# Validate max length of version
	version_length=${#version}
	__sdkman_echo_debug "Validating that actual version length ($version_length) does not exceed max ($version_length_max)"

	if [[ $version_length -gt $version_length_max ]]; then
		__sdkman_echo_red "Invalid version! ${version} with length ${version_length} exceeds max of ${version_length_max}!"
		return 1
	fi

	mkdir -p "${SDKMAN_CANDIDATES_DIR}/${candidate}"

	# handle relative paths
	if [[ "$folder" != /* ]]; then
		folder="$(pwd)/$folder"
	fi

	if [[ -d "$folder" ]]; then
		__sdkman_echo_green "Linking ${candidate} ${version} to ${folder}"
		ln -s "$folder" "${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}"
		__sdkman_echo_green "Done installing!"
	else
		__sdkman_echo_red "Invalid path! Refusing to link ${candidate} ${version} to ${folder}."
		return 1
	fi

	echo ""
}

function __sdkman_download() {
	local candidate version headers_file

	candidate="$1"
	version="$2"
	headers_file="$3"

	local platform_parameter="$(echo $SDKMAN_PLATFORM | tr '[:upper:]' '[:lower:]')"
	local download_url="${SDKMAN_CANDIDATES_API}/broker/download/${candidate}/${version}/${platform_parameter}"
	local base_name="${candidate}-${version}"
	local tmp_headers_file="${SDKMAN_DIR}/tmp/${base_name}.headers.tmp"

	export local binary_input="${SDKMAN_DIR}/tmp/${base_name}.bin"

	echo ""
	__sdkman_echo_no_colour "Downloading: ${candidate} ${version}"
	echo ""
	__sdkman_echo_no_colour "In progress..."
	echo ""

	# download binary
	__sdkman_secure_curl_download "${download_url}" --output "${binary_input}" --dump-header "${tmp_headers_file}"
	grep '^X-Sdkman' "${tmp_headers_file}" > "${headers_file}"
	__sdkman_echo_debug "Downloaded binary to: ${binary_input} (HTTP headers written to: ${headers_file})"

	if [[ ! -s "${headers_file}" ]]; then
		echo ""
		__sdkman_echo_red "Metadata file not found (or is empty) at '${headers_file}'"
		rm -f "${binary_input}" 
		return 1
	else
		__sdkman_validate "${binary_input}" "${headers_file}" || return 1
		__sdkman_checksum "${binary_input}" "${headers_file}" || return 1
		echo ""
	fi
}

function __sdkman_validate() {
	local -r archive="$1"
	local -r headers_file="$2"
	local -r archive_type=$(sed -n 's/^X-Sdkman-ArchiveType:\(.*\)$/\1/p' ${headers_file} | tr -cd '[:alnum:]')
	local is_ok
	
	__sdkman_echo_debug "Archive Type: ${archive_type}"
	__sdkman_echo_debug "Archive: ${archive}"

	if [[ "${archive_type}" == 'zip' ]]; then
		__sdkman_echo_debug "Checking zip archive"
		is_ok=$(unzip -t "$archive" | grep 'No errors detected in compressed data')
	elif [[ "${archive_type}" == 'tar' ]]; then
		__sdkman_echo_debug "Checking tar archive"
		is_ok=$(tar tf "$archive" | grep -v 'Error opening archive')
	else
		echo ""
		__sdkman_echo_red "Stop! The archive type cannot be determined! Please try installing again."
		rm -f "${archive}"
		return 1
	fi

	if [ -z "$is_ok" ]; then
		rm -f "$archive"
		echo ""
		__sdkman_echo_red "Stop! The archive was corrupt and has been removed! Please try installing again."
		return 1
	fi
}

function __sdkman_checksum() {
	local -r archive="$1"
	local -r headers_file="$2"
	local algorithm checksum cmd
	local shasum_avail=false
	local md5sum_avail=false
	
	if [ -z "${headers_file}" ]; then
		echo ""
		__sdkman_echo_debug "Skipping checksum for cached artifact"
		return
	elif [ ! -f "${headers_file}" ]; then
		echo ""
		__sdkman_echo_yellow "Metadata file not found at '${headers_file}', skipping checksum..."
		return
	fi
	
	if [[ "$sdkman_checksum_enable" != "true" ]]; then
		echo ""
		__sdkman_echo_yellow "Checksums are disabled, skipping verification..."
		return
	fi
	
	#Check for the appropriate checksum tools
	if command -v shasum > /dev/null 2>&1; then
		shasum_avail=true
	fi
	if command -v md5sum > /dev/null 2>&1; then
		md5sum_avail=true
	fi
	
	while IFS= read -r line; do
		algorithm=$(echo $line | sed -n 's/^X-Sdkman-Checksum-\(.*\):.*$/\1/p' | tr '[:lower:]' '[:upper:]')
		checksum=$(echo $line | sed -n 's/^X-Sdkman-Checksum-.*:\(.*\)$/\1/p' | tr -cd '[:alnum:]')
		
		if [[ -n ${algorithm} && -n ${checksum} ]]; then
			
			if [[ "$algorithm" =~ 'SHA' && "$shasum_avail" == 'true' ]]; then
				cmd="echo \"${checksum} *${archive}\" | shasum --check --quiet"
				
			elif [[ "$algorithm" =~ 'MD5' && "$md5sum_avail" == 'true' ]]; then
				cmd="echo \"${checksum} ${archive}\" | md5sum --check --quiet"
			fi
			
			if [[ -n $cmd ]]; then
				__sdkman_echo_no_colour "Verifying artifact: ${archive} (${algorithm}:${checksum})"

				if ! eval "$cmd"; then
					rm -f "$archive"
					echo ""
					__sdkman_echo_red "Stop! An invalid checksum was detected and the archive removed! Please try re-installing."
					return 1
				fi
			else
				__sdkman_echo_no_colour "Not able to perform checksum verification at this time."
			fi
		fi
  	done < ${headers_file}
}
