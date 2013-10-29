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

export GVM_VERSION="@GVM_VERSION@"
export GVM_PLATFORM=$(uname)

if [ -z "${GVM_SERVICE}" ]; then
    export GVM_SERVICE="@GVM_SERVICE@"
fi

if [ -z "${GVM_DIR}" ]; then
	export GVM_DIR="$HOME/.gvm"
fi

function gvm_source_modules {
	# Source gvm module scripts.
    for f in $(find "${GVM_DIR}/src" -type f -name 'gvm-*' -exec basename {} \;); do
        source "${GVM_DIR}/src/${f}"
    done

	# Source extension files prefixed with 'gvm-' and found in the ext/ folder
	# Use this if extensions are written with the functional approach and want
	# to use functions in the main gvm script.
	for f in $(find "${GVM_DIR}/ext" -type f -name 'gvm-*' -exec basename {} \;); do
		source "${GVM_DIR}/ext/${f}"
	done
	unset f
}

function gvm_set_candidates {
    # Set the candidate array
    OLD_IFS="$IFS"
    IFS=","
    GVM_CANDIDATES=(${GVM_CANDIDATES_CSV})
    IFS="$OLD_IFS"
}

function gvm_check_offline {
    RESPONSE="$1"
	DETECT_HTML="$(echo "$RESPONSE" | tr '[:upper:]' '[:lower:]' | grep 'html')"
	if [[ -z "$RESPONSE" || -n "$DETECT_HTML" ]]; then
		echo "GVM can't reach the internet so going offline. Re-enable online with:"
		echo ""
		echo "  $ gvm offline disable"
		echo ""
		GVM_FORCE_OFFLINE="true"
	fi
	unset RESPONSE
	unset DETECT_HTML
}

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
if [[ -f "${GVM_DIR}/var/candidates" ]]; then
	GVM_CANDIDATES_CSV=$(cat "${GVM_DIR}/var/candidates")
else
	GVM_CANDIDATES_CSV=$(curl -s "${GVM_SERVICE}/candidates")
	echo "$GVM_CANDIDATES_CSV" > "${GVM_DIR}/var/candidates"
fi

# initialise once only
if [[ "${GVM_INIT}" == "true" ]]; then
    gvm_set_candidates
	gvm_source_modules
	return
fi

# Attempt to set JAVA_HOME if it's not already set.
if [ -z "${JAVA_HOME}" ] ; then
    if ${darwin} ; then
        [ -z "${JAVA_HOME}" -a -f "/usr/libexec/java_home" ] && export JAVA_HOME=$(/usr/libexec/java_home)
        [ -z "${JAVA_HOME}" -a -d "/Library/Java/Home" ] && export JAVA_HOME="/Library/Java/Home"
        [ -z "${JAVA_HOME}" -a -d "/System/Library/Frameworks/JavaVM.framework/Home" ] && export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
    else
        javaExecutable="$(which javac 2> /dev/null)"
        [[ -z "${javaExecutable}" ]] && echo "GVM: JAVA_HOME not set and cannot find javac to deduce location, please set JAVA_HOME." && return

        readLink="$(which readlink 2> /dev/null)"
        [[ -z "${readLink}" ]] && echo "GVM: JAVA_HOME not set and readlink not available, please set JAVA_HOME." && return

        javaExecutable="$(readlink -f "${javaExecutable}")"
        javaHome="$(dirname "${javaExecutable}")"
        javaHome=$(expr "${javaHome}" : '\(.*\)/bin')
        JAVA_HOME="${javaHome}"
        [[ -z "${JAVA_HOME}" ]] && echo "GVM: could not find java, please set JAVA_HOME" && return
        export JAVA_HOME
    fi
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if ${cygwin} ; then
    [ -n "${JAVACMD}" ] && JAVACMD=$(cygpath --unix "${JAVACMD}")
    [ -n "${JAVA_HOME}" ] && JAVA_HOME=$(cygpath --unix "${JAVA_HOME}")
    [ -n "${CP}" ] && CP=$(cygpath --path --unix "${CP}")
fi

# Build _HOME environment variables and prefix them all to PATH

# The candidates are assigned to an array for zsh compliance, a list of words is not iterable
# Arrays are the only way, but unfortunately zsh arrays are not backward compatible with bash
# In bash arrays are zero index based, in zsh they are 1 based(!)
gvm_set_candidates
if [[ -z "$ZSH_VERSION" ]]; then
	GVM_CANDIDATE_COUNT=${#GVM_CANDIDATES[@]}
else
	GVM_CANDIDATE_COUNT=${#GVM_CANDIDATES}
fi
for (( i=0; i <= ${GVM_CANDIDATE_COUNT}; i++ )); do
	# Eliminate empty entries due to incompatibility
	if [[ -n ${GVM_CANDIDATES[${i}]} ]]; then
		CANDIDATE_NAME="${GVM_CANDIDATES[${i}]}"
		CANDIDATE_HOME_VAR="$(echo ${CANDIDATE_NAME} | tr '[:lower:]' '[:upper:]')_HOME"
		CANDIDATE_DIR="${GVM_DIR}/${CANDIDATE_NAME}/current"
		export $(echo ${CANDIDATE_HOME_VAR})="$CANDIDATE_DIR"
		PATH="${CANDIDATE_DIR}/bin:${PATH}"
		unset CANDIDATE_HOME_VAR
		unset CANDIDATE_NAME
		unset CANDIDATE_DIR
	fi
done

export PATH

gvm_source_modules

# Load the gvm config if it exists.
if [ -f "${GVM_DIR}/etc/config" ]; then
	source "${GVM_DIR}/etc/config"
fi

# determine if up to date
GVM_VERSION_TOKEN="${GVM_DIR}/var/version"
if [[ -f "$GVM_VERSION_TOKEN" && -z "$(find "$GVM_VERSION_TOKEN" -mtime +1)" ]]; then
    GVM_REMOTE_VERSION=$(cat "$GVM_VERSION_TOKEN")

else
    GVM_REMOTE_VERSION=$(curl -s "${GVM_SERVICE}/app/version" -m 1)
    gvm_check_offline "$GVM_REMOTE_VERSION"
    if [[ "$GVM_FORCE_OFFLINE" == 'true' ]]; then
        GVM_REMOTE_VERSION="$GVM_VERSION"
    else
        echo ${GVM_REMOTE_VERSION} > "$GVM_VERSION_TOKEN"
    fi
fi

if [[ "$GVM_REMOTE_VERSION" != "$GVM_VERSION" ]]; then
    echo "A new version of GVM is available..."
    echo ""
    echo "The current version is $GVM_REMOTE_VERSION, but you have $GVM_VERSION."
    echo ""

    if [[ "$gvm_auto_selfupdate" != "true" ]]; then
        echo -n "Would you like to upgrade now? (Y/n)"
        read upgrade
    fi

    if [[ -z "$upgrade" ]]; then upgrade="Y"; fi

    if [[ "$upgrade" == "Y" || "$upgrade" == "y" ]]; then
        __gvmtool_selfupdate
        unset upgrade
    else
        echo "Not upgrading now..."
    fi
fi

unset i
export GVM_INIT="true"
