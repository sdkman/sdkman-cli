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

function gvm_source_modules {
	# Source gvm module scripts.
	for f in $(find "${GVM_DIR}/src" -type f -name 'gvm-*'); do
		source "${f}"
	done

	# Source extension files prefixed with 'gvm-' and found in the ext/ folder
	# Use this if extensions are written with the functional approach and want
	# to use functions in the main gvm script.
	for f in $(find "${GVM_DIR}/ext" -type f -name 'gvm-*'); do
		if [ -r "${f}" ]; then
			source "${f}"
		fi
	done
	unset f
}

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

AEROPLANE MODE ENABLED! Some functionality is now disabled.

============================================================
EOF
)

ONLINE_BROADCAST=$( cat << EOF
==== BROADCAST =============================================

ONLINE MODE RE-ENABLED! All functionality now restored.

============================================================
EOF
)

OFFLINE_MESSAGE="This command is not available in aeroplane mode."
GVM_CANDIDATES=("groovy" "grails" "griffon" "gradle" "lazybones" "vertx")

if [[ "${GVM_INIT}" == "true" ]]; then
	gvm_source_modules
	exit
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

if [ -z "${GVM_SERVICE}" ]; then
    export GVM_SERVICE="@GVM_SERVICE@"
fi

if [ -z "${GVM_DIR}" ]; then
	export GVM_DIR="$HOME/.gvm"
fi

PATH="${GVM_DIR}/bin:${GVM_DIR}/ext:$PATH"

GROOVY_HOME="${GVM_DIR}/groovy/current"
GRAILS_HOME="${GVM_DIR}/grails/current"
GRIFFON_HOME="${GVM_DIR}/griffon/current"
GRADLE_HOME="${GVM_DIR}/gradle/current"
LAZYBONES_HOME="${GVM_DIR}/lazybones/current"
VERTX_HOME="${GVM_DIR}/vertx/current"

export PATH="${GROOVY_HOME}/bin:${GRAILS_HOME}/bin:${GRIFFON_HOME}/bin:${GRADLE_HOME}/bin:${LAZYBONES_HOME}/bin:${VERTX_HOME}/bin:$PATH"

gvm_source_modules
export GVM_INIT="true"
