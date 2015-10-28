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

function __sdkman_download {
	CANDIDATE="$1"
	VERSION="$2"
	mkdir -p "${SDKMAN_DIR}/archives"
	if [ ! -f "${SDKMAN_DIR}/archives/${CANDIDATE}-${VERSION}.zip" ]; then
		echo ""
		echo "Downloading: ${CANDIDATE} ${VERSION}"
		echo ""
		DOWNLOAD_URL="${SDKMAN_SERVICE}/download/${CANDIDATE}/${VERSION}?platform=${SDKMAN_PLATFORM}"
		ZIP_ARCHIVE="${SDKMAN_DIR}/archives/${CANDIDATE}-${VERSION}.zip"
		if [[ "$sdkman_insecure_ssl" == "true" ]]; then
			curl -k -L "${DOWNLOAD_URL}" > "${ZIP_ARCHIVE}"
		else
			curl -L "${DOWNLOAD_URL}" > "${ZIP_ARCHIVE}"
		fi
	else
		echo ""
		echo "Found a previously downloaded ${CANDIDATE} ${VERSION} archive. Not downloading it again..."
	fi
	__sdkman_validate_zip "${SDKMAN_DIR}/archives/${CANDIDATE}-${VERSION}.zip" || return 1
	echo ""
}

function __sdkman_validate_zip {
	ZIP_ARCHIVE="$1"
	ZIP_OK=$(unzip -t "${ZIP_ARCHIVE}" | grep 'No errors detected in compressed data')
	if [ -z "${ZIP_OK}" ]; then
		rm "${ZIP_ARCHIVE}"
		echo ""
		echo "Stop! The archive was corrupt and has been removed! Please try installing again."
		return 1
	fi
}

function __sdkman_install {
	CANDIDATE="$1"
	LOCAL_FOLDER="$3"
	__sdkman_check_candidate_present "${CANDIDATE}" || return 1
	__sdkman_determine_version "$2" "$3" || return 1

	if [[ -d "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/${VERSION}" || -h "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/${VERSION}" ]]; then
		echo ""
		echo "Stop! ${CANDIDATE} ${VERSION} is already installed."
		return 0
	fi

	if [[ ${VERSION_VALID} == 'valid' ]]; then
		__sdkman_install_candidate_version "${CANDIDATE}" "${VERSION}" || return 1

		if [[ "${sdkman_auto_answer}" != 'true' ]]; then
			echo -n "Do you want ${CANDIDATE} ${VERSION} to be set as default? (Y/n): "
			read USE
		fi
		if [[ -z "${USE}" || "${USE}" == "y" || "${USE}" == "Y" ]]; then
			echo ""
			echo "Setting ${CANDIDATE} ${VERSION} as default."
			__sdkman_link_candidate_version "${CANDIDATE}" "${VERSION}"
			__sdkman_add_to_path "${CANDIDATE}"
		fi
		return 0

	elif [[ "${VERSION_VALID}" == 'invalid' && -n "${LOCAL_FOLDER}" ]]; then
		__sdkman_install_local_version "${CANDIDATE}" "${VERSION}" "${LOCAL_FOLDER}" || return 1

    else
        echo ""
		echo "Stop! $1 is not a valid ${CANDIDATE} version."
		return 1
	fi
}

function __sdkman_install_local_version {
	CANDIDATE="$1"
	VERSION="$2"
	LOCAL_FOLDER="$3"
	mkdir -p "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}"

	echo "Linking ${CANDIDATE} ${VERSION} to ${LOCAL_FOLDER}"
	ln -s "${LOCAL_FOLDER}" "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/${VERSION}"
	echo "Done installing!"
	echo ""
}

function __sdkman_install_candidate_version {
	CANDIDATE="$1"
	VERSION="$2"
	__sdkman_download "${CANDIDATE}" "${VERSION}" || return 1
	echo "Installing: ${CANDIDATE} ${VERSION}"

	mkdir -p "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}"

	rm -rf "${SDKMAN_DIR}/tmp/out"
	unzip -oq "${SDKMAN_DIR}/archives/${CANDIDATE}-${VERSION}.zip" -d "${SDKMAN_DIR}/tmp/out"
	mv "${SDKMAN_DIR}"/tmp/out/* "${SDKMAN_CANDIDATES_DIR}/${CANDIDATE}/${VERSION}"
	echo "Done installing!"
	echo ""
}
