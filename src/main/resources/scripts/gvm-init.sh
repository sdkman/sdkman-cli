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

export GVM_SERVICE="@GVM_SERVICE@"
export GVM_VERSION="@GVM_VERSION@"
export PLATFORM=$(uname)


if [ -z "${GVM_DIR}" ]; then
	export GVM_DIR="$HOME/.gvm"
fi

PATH="${GVM_DIR}/bin:${GVM_DIR}/ext:$PATH"

GROOVY_HOME="${GVM_DIR}/groovy/current"
GRAILS_HOME="${GVM_DIR}/grails/current"
GRIFFON_HOME="${GVM_DIR}/griffon/current"
GRADLE_HOME="${GVM_DIR}/gradle/current"
VERTX_HOME="${GVM_DIR}/vert.x/current"

export PATH="${GROOVY_HOME}/bin:${GRAILS_HOME}/bin:${GRIFFON_HOME}/bin:${GRADLE_HOME}/bin:${VERTX_HOME}/bin:$PATH"

# Source the main `gvm` script.
source "${GVM_DIR}/bin/gvm"

# Source any extension files whose names begin with 'sourced-'
if [ -d "${GVM_DIR}/ext" ]; then
    for f in ${GVM_DIR}/ext/sourced-*; do
        if [ -r ${f} ]; then
            source ${f}
        fi
    done
    unset f
fi
