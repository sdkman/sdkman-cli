#!/bin/bash

GVM_SERVICE="@GVM_SERVICE@"
PLATFORM=$(uname)
GVM_DIR="$HOME/.gvm"

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

echo "Looking for a previous installation of GVM..."
if [ -d "${GVM_DIR}" ]; then
	echo "GVM found."
	echo ""
	echo "======================================================================================================"
	echo " You already have GVM installed."
	echo " GVM was found at:"
	echo ""
	echo "    ${GVM_DIR}"
	echo ""
	echo " Please consider running the following if you need to upgrade."
	echo ""
	echo "    $ gvm selfupdate"
	echo ""
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Looking for JAVA_HOME..."
if [ -z "${JAVA_HOME}" ]; then
	echo "Not found."
	echo ""
	echo "======================================================================================================"
	echo " Please ensure that you have a Java SDK installed and that JAVA_HOME environment variable is set."
	echo " accordingly."
	echo ""
	echo " Java can be found here:"
	echo "     http://www.oracle.com/technetwork/java/javase/downloads/index.html"
	echo ""
	echo " Set JAVA_HOME by editing your ~/.profile file and adding:"
	echo "     export JAVA_HOME=\"/path/to/my/jdk\""
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Validating JAVA_HOME..."
if [ ! -f "${JAVA_HOME}/bin/java" ]; then
	echo "Invalid."
	echo ""
	echo "======================================================================================================"
	echo " Please ensure that your JAVA_HOME points to a valid Java SDK."
	echo " You are currently pointing to:"
	echo ""
	echo "  ${JAVA_HOME}"
	echo ""
	echo " This does not seem to be valid. Please rectify and restart."
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
	echo " GVM uses curl for crucial interactions with it's backend server."
	echo ""
	echo " Restart after installing curl."
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Installing gvm scripts..."
BIN_FOLDER="${GVM_DIR}/bin"
TMP_ZIP="/tmp/res.zip"
mkdir -p "${BIN_FOLDER}"
curl -s "${GVM_SERVICE}/res?platform=${PLATFORM}" > "${TMP_ZIP}"
unzip -qo "${TMP_ZIP}" -d "${BIN_FOLDER}"
rm "${TMP_ZIP}"
chmod +x "${BIN_FOLDER}"/*

mkdir -p "${GVM_DIR}/ext"

echo "Creating candidate directories..."
mkdir -p "${GVM_DIR}/groovy"
mkdir -p "${GVM_DIR}/grails"
mkdir -p "${GVM_DIR}/griffon"
mkdir -p "${GVM_DIR}/gradle"
mkdir -p "${GVM_DIR}/vert.x"

echo "Attempting to update bash profile..."
SNIPPET=$( cat << EOF
#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "${GVM_DIR}/bin/gvm-init.sh" && ! $(which gvm-init.sh) ]] && source "${GVM_DIR}/bin/gvm-init.sh"
EOF
)

BASH_PROFILE="$HOME/.bash_profile"
PROFILE="$HOME/.profile"
BASHRC="$HOME/.bashrc"
ZSHRC="$HOME/.zshrc"

if [ ! -f "${BASH_PROFILE}" -a ! -f "${PROFILE}" ]; then
	echo "#!/bin/bash" > "${BASH_PROFILE}"
	echo "${SNIPPET}" >> "${BASH_PROFILE}"
	echo "Created and initialised ${BASH_PROFILE}"
else
	if [ -f "${BASH_PROFILE}" ]; then
		if [[ -z `grep 'gvm-init.sh' "${BASH_PROFILE}"` ]]; then
			echo -e "\n${SNIPPET}" >> "${BASH_PROFILE}"
			echo "Updated existing ${BASH_PROFILE}"
		fi
	fi

	if [ -f "${PROFILE}" ]; then
		if [[ -z `grep 'gvm-init.sh' "${PROFILE}"` ]]; then
			echo -e "\n${SNIPPET}" >> "${PROFILE}"
			echo "Updated existing ${PROFILE}"
		fi
	fi
fi

if [ ! -f "${BASHRC}" ]; then
	echo "#!/bin/bash" > "${BASHRC}"
	echo "${SNIPPET}" >> "${BASHRC}"
	echo "Created and initialised ${BASHRC}"
else
	if [[ -z `grep 'gvm-init.sh' "${BASHRC}"` ]]; then
		echo -e "\n${SNIPPET}" >> "${BASHRC}"
		echo "Updated existing ${BASHRC}"
	fi
fi

if [ ! -f "${ZSHRC}" ]; then
	echo "${SNIPPET}" >> "${ZSHRC}"
	echo "Created and initialised ${ZSHRC}"
else
	if [[ -z `grep 'gvm-init.sh' "${ZSHRC}"` ]]; then
		echo -e "\n${SNIPPET}" >> "${ZSHRC}"
		echo "Updated existing ${ZSHRC}"
	fi
fi

echo "All done!"

echo ""
echo ""
echo "Please open a new terminal, or run the following in the existing one:"
echo ""
echo "    source \"${GVM_DIR}/bin/gvm-init.sh\""
echo ""
echo "Then issue the following command:"
echo ""
echo "    gvm help"
echo ""
echo "Enjoy!!!"
