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

function sdkman_echo_debug {
	if [[ "$SDKMAN_DEBUG_MODE" == 'true' ]]; then
		echo "$1"
	fi
}

if [[ -n "$GVM_DIR" && -d "$GVM_DIR" ]]; then
    echo ""
    echo "GVM has been detected on your system..."
    echo ""
    echo "This update will upgrade GVM to SDKMAN!"
    echo ""
    echo -n "Do you want to continue with the upgrade? (Y/n)"

    read continue

    if [[ -z "${continue}" || "${continue}" == "y" || "${continue}" == "Y" ]]; then
        echo ''
        echo '                                                               		         '
        echo 'Thanks for upgrading to...                                       		         '
        echo '                                                               		         '
        echo '                                                               		         '
        echo '     SSSSSSSSSSSSSSS DDDDDDDDDDDDD       KKKKKKKKK    KKKKKKK                  '
        echo '   SS:::::::::::::::SD::::::::::::DDD    K:::::::K    K:::::K                  '
        echo '  S:::::SSSSSS::::::SD:::::::::::::::DD  K:::::::K    K:::::K                  '
        echo '  S:::::S     SSSSSSSDDD:::::DDDDD:::::D K:::::::K   K::::::K                  '
        echo '  S:::::S              D:::::D    D:::::DKK::::::K  K:::::KKK                  '
        echo '  S:::::S              D:::::D     D:::::D K:::::K K:::::K                     '
        echo '   S::::SSSS           D:::::D     D:::::D K::::::K:::::K                      '
        echo '    SS::::::SSSSS      D:::::D     D:::::D K:::::::::::K                       '
        echo '      SSS::::::::SS    D:::::D     D:::::D K:::::::::::K                       '
        echo '         SSSSSS::::S   D:::::D     D:::::D K::::::K:::::K                      '
        echo '              S:::::S  D:::::D     D:::::D K:::::K K:::::K                     '
        echo '              S:::::S  D:::::D    D:::::DKK::::::K  K:::::KKK                  '
        echo '  SSSSSSS     S:::::SDDD:::::DDDDD:::::D K:::::::K   K::::::K                  '
        echo '  S::::::SSSSSS:::::SD:::::::::::::::DD  K:::::::K    K:::::K                  '
        echo '  S:::::::::::::::SS D::::::::::::DDD    K:::::::K    K:::::K                  '
        echo '   SSSSSSSSSSSSSSS   DDDDDDDDDDDDD       KKKKKKKKK    KKKKKKK                  '
        echo '                                                                               '
        echo '                                                                               '
        echo '                      mmmmmmm    mmmmmmm     aaaaaaaaaaaaa  nnnn  nnnnnnnn     '
        echo '                    mm:::::::m  m:::::::mm   a::::::::::::a n:::nn::::::::nn   '
        echo '                   m::::::::::mm::::::::::m  aaaaaaaaa:::::an::::::::::::::nn  '
        echo '                   m::::::::::::::::::::::m           a::::ann:::::::::::::::n '
        echo '                   m:::::mmm::::::mmm:::::m    aaaaaaa:::::a  n:::::nnnn:::::n '
        echo '                   m::::m   m::::m   m::::m  aa::::::::::::a  n::::n    n::::n '
        echo '                   m::::m   m::::m   m::::m a::::aaaa::::::a  n::::n    n::::n '
        echo '                   m::::m   m::::m   m::::ma::::a    a:::::a  n::::n    n::::n '
        echo '                   m::::m   m::::m   m::::ma::::a    a:::::a  n::::n    n::::n '
        echo '                   m::::m   m::::m   m::::ma:::::aaaa::::::a  n::::n    n::::n '
        echo '                   m::::m   m::::m   m::::m a::::::::::aa:::a n::::n    n::::n '
        echo '                   mmmmmm   mmmmmm   mmmmmm  aaaaaaaaaa  aaaa nnnnnn    nnnnnn '
        echo '            								                                     '
        echo '                                                                               '

        SDKMAN_DIR=$(echo $GVM_DIR | sed 's/gvm/sdkman/g')
        SDKMAN_SERVICE="$GVM_SERVICE"

        mv "$GVM_DIR" "$SDKMAN_DIR"

        [[ -s "$HOME/.bashrc" ]] && sed -i 's/gvm/sdkman/g' "$HOME/.bashrc" && sed -i 's/GVM/SDKMAN/g' "$HOME/.bashrc"

        [[ -s "$HOME/.profile" ]] && sed -i 's/gvm/sdkman/g' "$HOME/.profile" && sed -i 's/GVM/SDKMAN/g' "$HOME/.profile"

        [[ -s "$HOME/.zshrc" ]] && sed -i 's/gvm/sdkman/g' "$HOME/.zshrc" && sed -i 's/GVM/SDKMAN/g' "$HOME/.zshrc"

        [[ -s "$SDKMAN/etc/config" ]] && sed -i 's/gvm/sdkman/g' "$SDKMAN/etc/config"

    else
        echo ""
        echo "Not upgrading today..."
        touch "${GVM_DIR}/var/delay_upgrade"
        exit
    fi
fi

echo ""
echo "Updating SDKMAN..."

SDKMAN_VERSION="@SDKMAN_VERSION@"
if [ -z "${SDKMAN_DIR}" ]; then
	SDKMAN_DIR="$HOME/.sdkman"
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

sdkman_platform=$(uname)
sdkman_bin_folder="${SDKMAN_DIR}/bin"
sdkman_tmp_zip="${SDKMAN_DIR}/tmp/res-${SDKMAN_VERSION}.zip"
sdkman_stage_folder="${SDKMAN_DIR}/tmp/stage"
sdkman_src_folder="${SDKMAN_DIR}/src"

sdkman_echo_debug "Purge existing scripts..."
rm -rf "${sdkman_bin_folder}"
rm -rf "${sdkman_src_folder}"

sdkman_echo_debug "Refresh directory structure..."
mkdir -p "${SDKMAN_DIR}/bin"
mkdir -p "${SDKMAN_DIR}/ext"
mkdir -p "${SDKMAN_DIR}/etc"
mkdir -p "${SDKMAN_DIR}/src"
mkdir -p "${SDKMAN_DIR}/var"
mkdir -p "${SDKMAN_DIR}/tmp"

# prepare candidates
SDKMAN_CANDIDATES_CSV=$(curl -s "${SDKMAN_SERVICE}/candidates")
echo "$SDKMAN_CANDIDATES_CSV" > "${SDKMAN_DIR}/var/candidates"

# drop version token
echo "$SDKMAN_VERSION" > "${SDKMAN_DIR}/var/version"

# create candidate directories
# convert csv to array
OLD_IFS="$IFS"
IFS=","
SDKMAN_CANDIDATES=(${SDKMAN_CANDIDATES_CSV})
IFS="$OLD_IFS"

for candidate in "${SDKMAN_CANDIDATES[@]}"; do
    if [[ -n "$candidate" ]]; then
        mkdir -p "${SDKMAN_DIR}/${candidate}"
        sdkman_echo_debug "Created for ${candidate}: ${SDKMAN_DIR}/${candidate}"
    fi
done

if [[ -f "${SDKMAN_DIR}/ext/config" ]]; then
	sdkman_echo_debug "Removing config from ext folder..."
	rm -v "${SDKMAN_DIR}/ext/config"
fi

sdkman_echo_debug "Prime the config file..."
sdkman_config_file="${SDKMAN_DIR}/etc/config"
touch "${sdkman_config_file}"
if [[ -z $(cat ${sdkman_config_file} | grep 'sdkman_auto_answer') ]]; then
	echo "sdkman_auto_answer=false" >> "${sdkman_config_file}"
fi

if [[ -z $(cat ${sdkman_config_file} | grep 'sdkman_auto_selfupdate') ]]; then
	echo "sdkman_auto_selfupdate=false" >> "${sdkman_config_file}"
fi

if [[ -z $(cat ${sdkman_config_file} | grep 'sdkman_insecure_ssl') ]]; then
	echo "sdkman_insecure_ssl=false" >> "${sdkman_config_file}"
fi

download_url="${SDKMAN_SERVICE}/res?platform=${sdkman_platform}&purpose=selfupdate"
sdkman_echo_debug "Download new scripts from: ${download_url}"
sdkman_echo_debug "Download new scripts to: ${sdkman_tmp_zip}"
curl -s "${download_url}" > "${sdkman_tmp_zip}"

sdkman_echo_debug "Extract script archive..."
sdkman_echo_debug "Unziping scripts to: ${sdkman_stage_folder}"
if [[ "${cygwin}" == 'true' ]]; then
	sdkman_echo_debug "Cygwin detected - normalizing paths for unzip..."
	unzip -qo $(cygpath -w "${sdkman_tmp_zip}") -d $(cygpath -w "${sdkman_stage_folder}")
else
	unzip -qo "${sdkman_tmp_zip}" -d "${sdkman_stage_folder}"
fi

sdkman_echo_debug "Moving sdkman-init file to bin folder..."
mv "${sdkman_stage_folder}/sdkman-init.sh" "${sdkman_bin_folder}"

sdkman_echo_debug "Move remaining module scripts to src folder: ${sdkman_src_folder}"
mv "${sdkman_stage_folder}"/sdkman-* "${sdkman_src_folder}"

sdkman_echo_debug "Clean up staging folder..."
rm -rf "${sdkman_stage_folder}"

echo ""
echo ""
echo "Successfully upgraded SDKMAN."
echo ""
echo "Please open a new terminal, or run the following in the existing one:"
echo ""
echo "    export SDKMAN_DIR=\"${SDKMAN_DIR}\" && source \"${SDKMAN_DIR}/bin/sdkman-init.sh\""
echo ""
echo ""
