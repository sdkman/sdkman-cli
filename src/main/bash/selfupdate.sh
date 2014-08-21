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

function gvm_echo_debug {
	if [[ "$GVM_DEBUG_MODE" == 'true' ]]; then
		echo "$1"
	fi
}

echo ""
echo "Updating gvm..."

GVM_VERSION="@GVM_VERSION@"
if [ -z "${GVM_DIR}" ]; then
	GVM_DIR="$HOME/.gvm"
fi

# OS specific support (must be 'true' or 'false').
cygwin=false;
darwin=false;
solaris=false;
freebsd=false;
case "$(uname)" in
    CYGWIN*)
        cygwin=true
        ;;
    Darwin*)
        darwin=true
        ;;
    SunOS*)
        solaris=true
        ;;
    FreeBSD*)
        freebsd=true
esac

gvm_platform=$(uname)
gvm_bin_folder="${GVM_DIR}/bin"
gvm_tmp_zip="${GVM_DIR}/tmp/res-${GVM_VERSION}.zip"
gvm_stage_folder="${GVM_DIR}/tmp/stage"
gvm_src_folder="${GVM_DIR}/src"

gvm_echo_debug "Purge existing scripts..."
rm -rf "${gvm_bin_folder}"
rm -rf "${gvm_src_folder}"

gvm_echo_debug "Refresh directory structure..."
mkdir -p "${GVM_DIR}/bin"
mkdir -p "${GVM_DIR}/ext"
mkdir -p "${GVM_DIR}/etc"
mkdir -p "${GVM_DIR}/src"
mkdir -p "${GVM_DIR}/var"
mkdir -p "${GVM_DIR}/tmp"

# prepare candidates
GVM_CANDIDATES_CSV=$(curl -s "${GVM_SERVICE}/candidates")
echo "$GVM_CANDIDATES_CSV" > "${GVM_DIR}/var/candidates"

# drop version token
echo "$GVM_VERSION" > "${GVM_DIR}/var/version"

# create candidate directories
# convert csv to array
OLD_IFS="$IFS"
IFS=","
GVM_CANDIDATES=(${GVM_CANDIDATES_CSV})
IFS="$OLD_IFS"

for (( i=0; i <= ${#GVM_CANDIDATES}; i++ )); do
	# Eliminate empty entries due to incompatibility
	if [[ -n ${GVM_CANDIDATES[${i}]} ]]; then
		CANDIDATE_NAME="${GVM_CANDIDATES[${i}]}"
		mkdir -p "${GVM_DIR}/${CANDIDATE_NAME}"
		gvm_echo_debug "Created for ${CANDIDATE_NAME}: ${GVM_DIR}/${CANDIDATE_NAME}"
		unset CANDIDATE_NAME
	fi
done

if [[ -f "${GVM_DIR}/ext/config" ]]; then
	gvm_echo_debug "Removing config from ext folder..."
	rm -v "${GVM_DIR}/ext/config"
fi

gvm_echo_debug "Prime the config file..."
gvm_config_file="${GVM_DIR}/etc/config"
touch "${gvm_config_file}"
if [[ -z $(cat ${gvm_config_file} | grep 'gvm_auto_answer') ]]; then
	echo "gvm_auto_answer=false" >> "${gvm_config_file}"
fi

if [[ -z $(cat ${gvm_config_file} | grep 'gvm_auto_selfupdate') ]]; then
	echo "gvm_auto_selfupdate=false" >> "${gvm_config_file}"
fi

gvm_echo_debug "Download new scripts to: ${gvm_tmp_zip}"
curl -s "${GVM_SERVICE}/res?platform=${gvm_platform}&purpose=selfupdate" > "${gvm_tmp_zip}"

gvm_echo_debug "Extract script archive..."
gvm_echo_debug "Unziping scripts to: ${gvm_stage_folder}"
if [[ "${cygwin}" == 'true' ]]; then
	gvm_echo_debug "Cygwin detected - normalizing paths for unzip..."
	unzip -qo $(cygpath -w "${gvm_tmp_zip}") -d $(cygpath -w "${gvm_stage_folder}")
else
	unzip -qo "${gvm_tmp_zip}" -d "${gvm_stage_folder}"
fi

gvm_echo_debug "Moving gvm-init file to bin folder..."
mv "${gvm_stage_folder}/gvm-init.sh" "${gvm_bin_folder}"

gvm_echo_debug "Move remaining module scripts to src folder: ${gvm_src_folder}"
mv "${gvm_stage_folder}"/gvm-* "${gvm_src_folder}"

gvm_echo_debug "Clean up staging folder..."
rm -rf "${gvm_stage_folder}"

echo "Please note that the upgrade prompts are configurable in:"
echo "    ~.gvm/etc/config"

echo -e "\n\n\n\n"

echo "Successfully upgraded GVM."
echo ""
echo "Please open a new terminal, or run the following in the existing one:"
echo ""
echo "    source \"${GVM_DIR}/bin/gvm-init.sh\""
echo ""
echo ""
