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

# Global variables
SDKMAN_SERVICE="@SDKMAN_SERVICE@"
SDKMAN_BROKER_SERVICE="@SDKMAN_BROKER_SERVICE@"
SDKMAN_VERSION="@SDKMAN_VERSION@"
SDKMAN_DIR="$HOME/.sdkman"

# Local variables
sdkman_bin_folder="${SDKMAN_DIR}/bin"
sdkman_src_folder="${SDKMAN_DIR}/src"
sdkman_tmp_folder="${SDKMAN_DIR}/tmp"
sdkman_stage_folder="${sdkman_tmp_folder}/stage"
sdkman_zip_file="${sdkman_tmp_folder}/res-${SDKMAN_VERSION}.zip"
sdkman_ext_folder="${SDKMAN_DIR}/ext"
sdkman_etc_folder="${SDKMAN_DIR}/etc"
sdkman_var_folder="${SDKMAN_DIR}/var"
sdkman_config_file="${sdkman_etc_folder}/config"
sdkman_bash_profile="${HOME}/.bash_profile"
sdkman_profile="${HOME}/.profile"
sdkman_bashrc="${HOME}/.bashrc"
sdkman_zshrc="${HOME}/.zshrc"
sdkman_platform=$(uname)

sdkman_init_snippet=$( cat << EOF
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
EOF
)

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

echo '                                                                     '
echo 'Thanks for using                                                     '
echo '                                                                     '
echo '_____/\\\\\\\\\\\\__/\\\________/\\\__/\\\\____________/\\\\_        '
echo ' ___/\\\//////////__\/\\\_______\/\\\_\/\\\\\\________/\\\\\\_       '
echo '  __/\\\_____________\//\\\______/\\\__\/\\\//\\\____/\\\//\\\_      '
echo '   _\/\\\____/\\\\\\\__\//\\\____/\\\___\/\\\\///\\\/\\\/_\/\\\_     '
echo '    _\/\\\___\/////\\\___\//\\\__/\\\____\/\\\__\///\\\/___\/\\\_    '
echo '     _\/\\\_______\/\\\____\//\\\/\\\_____\/\\\____\///_____\/\\\_   '
echo '      _\/\\\_______\/\\\_____\//\\\\\______\/\\\_____________\/\\\_  '
echo '       _\//\\\\\\\\\\\\/_______\//\\\_______\/\\\_____________\/\\\_ '
echo '        __\////////////__________\///________\///______________\///__'
echo '                                                                     '
echo '                                       Will now attempt installing...'
echo '                                                                     '


# Sanity checks

echo "Looking for a previous installation of SDKman..."
if [ -d "${SDKMAN_DIR}" ]; then
	echo "SDKman found."
	echo ""
	echo "======================================================================================================"
	echo " You already have SDKman installed."
	echo " SDKman was found at:"
	echo ""
	echo "    ${SDKMAN_DIR}"
	echo ""
	echo " Please consider running the following if you need to upgrade."
	echo ""
	echo "    $ sdk selfupdate"
	echo ""
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Looking for unzip..."
if [ -z $(which unzip) ]; then
	echo "Not found."
	echo "======================================================================================================"
	echo " Please install unzip on your system using your favourite package manager."
	echo ""
	echo " Restart after installing unzip."
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Looking for curl..."
if [ -z $(which curl) ]; then
	echo "Not found."
	echo ""
	echo "======================================================================================================"
	echo " Please install curl on your system using your favourite package manager."
	echo ""
	echo " SDKman uses curl for crucial interactions with it's backend server."
	echo ""
	echo " Restart after installing curl."
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Looking for sed..."
if [ -z $(which sed) ]; then
	echo "Not found."
	echo ""
	echo "======================================================================================================"
	echo " Please install sed on your system using your favourite package manager."
	echo ""
	echo " SDKman uses sed extensively."
	echo ""
	echo " Restart after installing sed."
	echo "======================================================================================================"
	echo ""
	exit 0
fi

if [[ "${solaris}" == true ]]; then
	echo "Looking for gsed..."
	if [ -z $(which gsed) ]; then
		echo "Not found."
		echo ""
		echo "======================================================================================================"
		echo " Please install gsed on your solaris system."
		echo ""
		echo " SDKman uses gsed extensively."
		echo ""
		echo " Restart after installing gsed."
		echo "======================================================================================================"
		echo ""
		exit 0
	fi
fi


echo "Installing SDKman scripts..."


# Create directory structure

echo "Create distribution directories..."
mkdir -p "${sdkman_bin_folder}"
mkdir -p "${sdkman_src_folder}"
mkdir -p "${sdkman_tmp_folder}"
mkdir -p "${sdkman_stage_folder}"
mkdir -p "${sdkman_ext_folder}"
mkdir -p "${sdkman_etc_folder}"
mkdir -p "${sdkman_var_folder}"

echo "Create candidate directories..."

SDKMAN_CANDIDATES_CSV=$(curl -s "${SDKMAN_SERVICE}/candidates")
echo "$SDKMAN_CANDIDATES_CSV" > "${SDKMAN_DIR}/var/candidates"

echo "$SDKMAN_VERSION" > "${SDKMAN_DIR}/var/version"

# convert csv to array
OLD_IFS="$IFS"
IFS=","
SDKMAN_CANDIDATES=(${SDKMAN_CANDIDATES_CSV})
IFS="$OLD_IFS"

for (( i=0; i <= ${#SDKMAN_CANDIDATES}; i++ )); do
	# Eliminate empty entries due to incompatibility
	if [[ -n ${SDKMAN_CANDIDATES[${i}]} ]]; then
		CANDIDATE_NAME="${SDKMAN_CANDIDATES[${i}]}"
		mkdir -p "${SDKMAN_DIR}/${CANDIDATE_NAME}"
		echo "Created for ${CANDIDATE_NAME}: ${SDKMAN_DIR}/${CANDIDATE_NAME}"
		unset CANDIDATE_NAME
	fi
done

echo "Prime the config file..."
touch "${sdkman_config_file}"
echo "sdkman_auto_answer=false" >> "${sdkman_config_file}"
echo "sdkman_auto_selfupdate=false" >> "${sdkman_config_file}"
echo "sdkman_insecure_ssl=false" >> "${sdkman_config_file}"

echo "Download script archive..."
curl -s "${SDKMAN_SERVICE}/res?platform=${sdkman_platform}&purpose=install" > "${sdkman_zip_file}"

echo "Extract script archive..."
if [[ "${cygwin}" == 'true' ]]; then
	echo "Cygwin detected - normalizing paths for unzip..."
	sdkman_zip_file=$(cygpath -w "${sdkman_zip_file}")
	sdkman_stage_folder=$(cygpath -w "${sdkman_stage_folder}")
fi
unzip -qo "${sdkman_zip_file}" -d "${sdkman_stage_folder}"

echo "Install scripts..."
mv "${sdkman_stage_folder}/sdkman-init.sh" "${sdkman_bin_folder}"
mv "${sdkman_stage_folder}"/sdkman-* "${sdkman_src_folder}"

echo "Attempt update of bash profiles..."
if [ ! -f "${sdkman_bash_profile}" -a ! -f "${sdkman_profile}" ]; then
	echo "#!/bin/bash" > "${sdkman_bash_profile}"
	echo "${sdkman_init_snippet}" >> "${sdkman_bash_profile}"
	echo "Created and initialised ${sdkman_bash_profile}"
else
	if [ -f "${sdkman_bash_profile}" ]; then
		if [[ -z `grep 'sdkman-init.sh' "${sdkman_bash_profile}"` ]]; then
			echo -e "\n${sdkman_init_snippet}" >> "${sdkman_bash_profile}"
			echo "Updated existing ${sdkman_bash_profile}"
		fi
	fi

	if [ -f "${sdkman_profile}" ]; then
		if [[ -z `grep 'sdkman-init.sh' "${sdkman_profile}"` ]]; then
			echo -e "\n${sdkman_init_snippet}" >> "${sdkman_profile}"
			echo "Updated existing ${sdkman_profile}"
		fi
	fi
fi

if [ ! -f "${sdkman_bashrc}" ]; then
	echo "#!/bin/bash" > "${sdkman_bashrc}"
	echo "${sdkman_init_snippet}" >> "${sdkman_bashrc}"
	echo "Created and initialised ${sdkman_bashrc}"
else
	if [[ -z `grep 'gvm-init.sh' "${gvm_bashrc}"` ]]; then
		echo -e "\n${gvm_init_snippet}" >> "${gvm_bashrc}"
		echo "Updated existing ${gvm_bashrc}"
	fi
fi

echo "Attempt update of zsh profiles..."
if [ ! -f "${gvm_zshrc}" ]; then
	echo "${gvm_init_snippet}" >> "${gvm_zshrc}"
	echo "Created and initialised ${gvm_zshrc}"
else
	if [[ -z `grep 'gvm-init.sh' "${gvm_zshrc}"` ]]; then
		echo -e "\n${gvm_init_snippet}" >> "${gvm_zshrc}"
		echo "Updated existing ${gvm_zshrc}"
	fi
fi

echo -e "\n\n\nAll done!\n\n"

echo "Please open a new terminal, or run the following in the existing one:"
echo ""
echo "    source \"${GVM_DIR}/bin/gvm-init.sh\""
echo ""
echo "Then issue the following command:"
echo ""
echo "    gvm help"
echo ""
echo "Enjoy!!!"
