#!/usr/bin/env bash

#
#   Copyright 2017 Marco Vermeulen
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

SDKMAN_PLATFORM="$(uname)"
if [[ "$SDKMAN_PLATFORM" == 'Linux' && "$(uname -m)" == 'i686' ]]; then
    SDKMAN_PLATFORM="${SDKMAN_PLATFORM}32"
elif [[ "$SDKMAN_PLATFORM" == 'Linux' ]]; then
    SDKMAN_PLATFORM="${SDKMAN_PLATFORM}64"
fi
export SDKMAN_PLATFORM

if [ -z "$SDKMAN_VERSION" ]; then
	export SDKMAN_VERSION="@SDKMAN_VERSION@"
fi

if [ -z "$SDKMAN_LEGACY_API" ]; then
	export SDKMAN_LEGACY_API="@SDKMAN_LEGACY_API@"
fi

if [ -z "$SDKMAN_CURRENT_API" ]; then
	export SDKMAN_CURRENT_API="@SDKMAN_CURRENT_API@"
fi

if [ -z "$SDKMAN_DIR" ]; then
	export SDKMAN_DIR="$HOME/.sdkman"
fi

export SDKMAN_CANDIDATES_DIR="${SDKMAN_DIR}/candidates"

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

# Determine shell
zsh_shell=false;
bash_shell=false;

if [[ -n "$ZSH_VERSION" ]]; then
    zsh_shell=true
else
    bash_shell=true
fi

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

# Load the sdkman config if it exists.
if [ -f "${SDKMAN_DIR}/etc/config" ]; then
	source "${SDKMAN_DIR}/etc/config"
fi

# Create upgrade delay file if it doesn't exist
if [[ ! -f "${SDKMAN_DIR}/var/delay_upgrade" ]]; then
	touch "${SDKMAN_DIR}/var/delay_upgrade"
fi

# set curl connect-timeout and max-time
if [[ -z "$sdkman_curl_connect_timeout" ]]; then sdkman_curl_connect_timeout=7; fi
if [[ -z "$sdkman_curl_max_time" ]]; then sdkman_curl_max_time=10; fi

# Read list of candidates and set array
SDKMAN_CANDIDATES_CACHE="${SDKMAN_DIR}/var/candidates"
SDKMAN_CANDIDATES_CSV=$(cat "$SDKMAN_CANDIDATES_CACHE")
__sdkman_echo_debug "Setting candidates csv: $SDKMAN_CANDIDATES_CSV"
if [[ "$zsh_shell" == 'true' ]]; then
    SDKMAN_CANDIDATES=( ${(s:,:)SDKMAN_CANDIDATES_CSV} )
else
    OLD_IFS="$IFS"
    IFS=","
    SDKMAN_CANDIDATES=(${SDKMAN_CANDIDATES_CSV})
    IFS="$OLD_IFS"
fi

# The candidates are assigned to an array for zsh compliance, a list of words is not iterable
# Arrays are the only way, but unfortunately zsh arrays are not backward compatible with bash
# In bash arrays are zero index based, in zsh they are 1 based(!)
for (( i=0; i <= ${#SDKMAN_CANDIDATES[*]}; i++ )); do
	# Eliminate empty entries due to incompatibility
	CANDIDATE_NAME="${SDKMAN_CANDIDATES[${i}]}"
	CANDIDATE_DIR="${SDKMAN_CANDIDATES_DIR}/${CANDIDATE_NAME}/current"
	if [[ -n "$CANDIDATE_NAME" && ( -h "$CANDIDATE_DIR" || -d "${CANDIDATE_DIR}" ) ]]; then
		__sdkman_export_candidate_home "$CANDIDATE_NAME" "$CANDIDATE_DIR"
		__sdkman_prepend_candidate_to_path "$CANDIDATE_DIR"
	fi
	unset CANDIDATE_NAME CANDIDATE_DIR
done
unset i
export PATH
