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

export SDKMAN_VERSION="@SDKMAN_VERSION@"
export SDKMAN_PLATFORM=$(uname)

if [ -z "${SDKMAN_SERVICE}" ]; then
    export SDKMAN_SERVICE="@SDKMAN_SERVICE@"
fi

if [ -z "${SDKMAN_BROADCAST_SERVICE}" ]; then
    export SDKMAN_BROADCAST_SERVICE="@SDKMAN_BROADCAST_SERVICE@"
fi

if [ -z "${SDKMAN_BROKER_SERVICE}" ]; then
    export SDKMAN_BROKER_SERVICE="@SDKMAN_BROKER_SERVICE@"
fi

if [ -z "${SDKMAN_DIR}" ]; then
	export SDKMAN_DIR="$HOME/.sdkman"
fi

export SDKMAN_CANDIDATES_DIR="${SDKMAN_DIR}/candidates"

# force zsh to behave well
if [[ -n "$ZSH_VERSION" ]]; then
	setopt shwordsplit
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

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if ${cygwin} ; then
    [ -n "${JAVACMD}" ] && JAVACMD=$(cygpath --unix "${JAVACMD}")
    [ -n "${JAVA_HOME}" ] && JAVA_HOME=$(cygpath --unix "${JAVA_HOME}")
    [ -n "${CP}" ] && CP=$(cygpath --path --unix "${CP}")
fi


OFFLINE_BROADCAST=$( cat << EOF
==== BROADCAST =============================================

OFFLINE MODE ENABLED! Some functionality is now disabled.

============================================================
EOF
)

ONLINE_BROADCAST=$( cat << EOF
==== BROADCAST =============================================

ONLINE MODE RE-ENABLED! All functionality now restored.

============================================================
EOF
)

OFFLINE_MESSAGE="This command is not available in offline mode."

# fabricate list of candidates
if [[ -f "${SDKMAN_DIR}/var/candidates" ]]; then
	SDKMAN_CANDIDATES_CSV=$(cat "${SDKMAN_DIR}/var/candidates")
else
	SDKMAN_CANDIDATES_CSV=$(curl -s "${SDKMAN_SERVICE}/candidates")
	echo "$SDKMAN_CANDIDATES_CSV" > "${SDKMAN_DIR}/var/candidates"
fi



# Set the candidate array
OLD_IFS="$IFS"
IFS=","
SDKMAN_CANDIDATES=(${SDKMAN_CANDIDATES_CSV})
IFS="$OLD_IFS"

# Source sdkman module scripts.
for f in $(find "${SDKMAN_DIR}/src" -type f -name 'sdkman-*' -exec basename {} \;); do
    source "${SDKMAN_DIR}/src/${f}"
done

# Source extension files prefixed with 'sdkman-' and found in the ext/ folder
# Use this if extensions are written with the functional approach and want
# to use functions in the main sdkman script.
for f in $(find "${SDKMAN_DIR}/ext" -type f -name 'sdkman-*' -exec basename {} \;); do
    source "${SDKMAN_DIR}/ext/${f}"
done
unset f

# Attempt to set JAVA_HOME if it's not already set.
if [ -z "${JAVA_HOME}" ] ; then
    if ${darwin} ; then
        [ -z "${JAVA_HOME}" -a -f "/usr/libexec/java_home" ] && export JAVA_HOME=$(/usr/libexec/java_home)
        [ -z "${JAVA_HOME}" -a -d "/Library/Java/Home" ] && export JAVA_HOME="/Library/Java/Home"
        [ -z "${JAVA_HOME}" -a -d "/System/Library/Frameworks/JavaVM.framework/Home" ] && export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
    else
        javaExecutable="$(which javac 2> /dev/null)"
        [[ -z "${javaExecutable}" ]] && echo "SDKMAN: JAVA_HOME not set and cannot find javac to deduce location, please set JAVA_HOME." && return

        readLink="$(which readlink 2> /dev/null)"
        [[ -z "${readLink}" ]] && echo "SDKMAN: JAVA_HOME not set and readlink not available, please set JAVA_HOME." && return

        javaExecutable="$(readlink -f "${javaExecutable}")"
        javaHome="$(dirname "${javaExecutable}")"
        javaHome=$(expr "${javaHome}" : '\(.*\)/bin')
        JAVA_HOME="${javaHome}"
        [[ -z "${JAVA_HOME}" ]] && echo "SDKMAN: could not find java, please set JAVA_HOME" && return
        export JAVA_HOME
    fi
fi

# Load the sdkman config if it exists.
if [ -f "${SDKMAN_DIR}/etc/config" ]; then
	source "${SDKMAN_DIR}/etc/config"
fi

# Create upgrade delay token if it doesn't exist
if [[ ! -f "${SDKMAN_DIR}/var/delay_upgrade" ]]; then
	touch "${SDKMAN_DIR}/var/delay_upgrade"
fi

# determine if up to date
SDKMAN_VERSION_TOKEN="${SDKMAN_DIR}/var/version"
if [[ -f "$SDKMAN_VERSION_TOKEN" && -z "$(find "$SDKMAN_VERSION_TOKEN" -mmin +$((60*24)))" ]]; then
    SDKMAN_REMOTE_VERSION=$(cat "$SDKMAN_VERSION_TOKEN")

else
    SDKMAN_REMOTE_VERSION=$(curl -s "${SDKMAN_SERVICE}/app/version" --connect-timeout 1 --max-time 1)
    sdkman_force_offline_on_proxy "$SDKMAN_REMOTE_VERSION"
    if [[ -z "$SDKMAN_REMOTE_VERSION" || "$SDKMAN_FORCE_OFFLINE" == 'true' ]]; then
        SDKMAN_REMOTE_VERSION="$SDKMAN_VERSION"
    else
        echo ${SDKMAN_REMOTE_VERSION} > "$SDKMAN_VERSION_TOKEN"
    fi
fi

# Build _HOME environment variables and prefix them all to PATH

# The candidates are assigned to an array for zsh compliance, a list of words is not iterable
# Arrays are the only way, but unfortunately zsh arrays are not backward compatible with bash
# In bash arrays are zero index based, in zsh they are 1 based(!)
for (( i=0; i <= ${#SDKMAN_CANDIDATES[*]}; i++ )); do
	# Eliminate empty entries due to incompatibility
	CANDIDATE_NAME="${SDKMAN_CANDIDATES[${i}]}"
	CANDIDATE_DIR="${SDKMAN_CANDIDATES_DIR}/${CANDIDATE_NAME}/current"
	if [[ -n "${CANDIDATE_NAME}" && -h "${CANDIDATE_DIR}" ]]; then
		CANDIDATE_HOME_VAR="$(echo ${CANDIDATE_NAME} | tr '[:lower:]' '[:upper:]')_HOME"
		export $(echo "${CANDIDATE_HOME_VAR}")="$CANDIDATE_DIR"
		if [[ -d "${CANDIDATE_DIR}/bin" ]]; then
			CANDIDATE_BIN_DIR="${CANDIDATE_DIR}/bin"
		else
			CANDIDATE_BIN_DIR="${CANDIDATE_DIR}"
		fi
		echo "$PATH" | grep -q "${CANDIDATE_DIR}" || PATH="${CANDIDATE_BIN_DIR}:${PATH}"
		unset CANDIDATE_HOME_VAR CANDIDATE_BIN_DIR
	fi
	unset CANDIDATE_NAME CANDIDATE_DIR
done
unset i
export PATH

alias gvm="sdk"
