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

function __gvmtool_contains {
    replaced=$(echo "$1" | sed -e s,"$2",,g)
    [ "$replaced" != "$1" ]
}

function __gvmtool_init {

    # OS specific support (must be 'true' or 'false').
    cygwin=false;
    darwin=false;
    case "`uname`" in
        CYGWIN*)
            cygwin=true
            ;;
        
        Darwin*)
            darwin=true
            ;;
    esac

    GVM_SERVICE_DEFAULT="@GVM_SERVICE@"
    GVM_CANDIDATES_DEFAULT=("groovy" "grails" "griffon" "gradle" "vertx")

    if [ -z "${GVM_DIR}" ]; then
	    export GVM_DIR="$HOME/.gvm"
    fi
    mkdir -p $GVM_DIR/var/candidates

    if [ -z "${GVM_SERVICE}" ]; then
	    if [ -f "${GVM_DIR}/var/service" ]; then
		    GVM_SERVICE=$(cat "${GVM_DIR}/var/service")
	    else
		    GVM_SERVICE=${GVM_SERVICE_DEFAULT}
	    fi
    fi
    export GVM_SERVICE
    echo -n ${GVM_SERVICE} > "${GVM_DIR}/var/service"

    # check cached candidates first
    candidate_cache="${GVM_DIR}/var/candidates/$(echo ${GVM_SERVICE} | tr ':/' '_')"
    if [ -f "${candidate_cache}" -a "${*/--flush/}" == "${*}" ]; then
	    GVM_CANDIDATES=($(cat "${candidate_cache}"))
    else
	    GVM_CANDIDATES=($(curl -s "${GVM_SERVICE}/candidates" | sed -e 's/,//g'))
	    if [[ "${#GVM_CANDIDATES[@]}" == "0" ]]; then
		    GVM_CANDIDATES=(${GVM_CANDIDATES_DEFAULT[@]})
	    else
		    # only cache the candidates if derived from online service
		    echo -n ${GVM_CANDIDATES[@]} > "${candidate_cache}"
	    fi
    fi
    export GVM_CANDIDATES

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
    if ! __gvmtool_contains "$PATH" "$GVM_DIR"; then
        PATH="${GVM_DIR}/bin:${GVM_DIR}/ext:$PATH"
    fi

    # Source gvm module scripts (except this one).
    for f in $(find "${GVM_DIR}/src" -type f -name 'gvm-*'); do
	    if [ "${f##*/}" != "gvm-init.sh" ]; then source "${f}"; fi
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

__gvmtool_init

