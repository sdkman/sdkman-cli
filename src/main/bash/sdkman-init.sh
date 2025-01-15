#!/usr/bin/env bash

#
#   Copyright 2021 Marco Vermeulen
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

# set env vars if not set
# use parameter expansion as it is faster
export SDKMAN_CANDIDATES_API=${SDKMAN_CANDIDATES_API:-"@SDKMAN_CANDIDATES_API@"}
export SDKMAN_DIR=${SDKMAN_DIR:-"$HOME/.sdkman"}

# Load the sdkman config if it exists.
[[ -f "${SDKMAN_DIR}/etc/config" ]] && source "${SDKMAN_DIR}/etc/config"

# Read the platform file
# don't need to use cat
SDKMAN_PLATFORM="$(<"${SDKMAN_DIR}/var/platform")"
export SDKMAN_PLATFORM

# OS specific support (must be 'true' or 'false').
cygwin=false
darwin=false
solaris=false
freebsd=false
SDKMAN_KERNEL="$(uname -s)"
case "${SDKMAN_KERNEL}" in
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
zsh_shell=false
bash_shell=false

if [[ -n "$ZSH_VERSION" ]]; then
	zsh_shell=true
elif [[ -n "$BASH_VERSION" ]]; then
	bash_shell=true
fi

# move  these here to reduce the number of times we have to test zsh_shell
# read list of candidates and set array
SDKMAN_CANDIDATES_CACHE="${SDKMAN_DIR}/var/candidates"
SDKMAN_CANDIDATES_CSV=$(<"$SDKMAN_CANDIDATES_CACHE")
__sdkman_echo_debug "Setting candidates csv: $SDKMAN_CANDIDATES_CSV"

# Source sdkman module scripts and extension files.
#
# Extension files are prefixed with 'sdkman-' and found in the ext/ folder.
# Use this if extensions are written with the functional approach and want
# to use functions in the main sdkman script. For more details, refer to
# <https://github.com/sdkman/sdkman-extensions>.
if [[ $zsh_shell == "true" ]]; then
	SDKMAN_CANDIDATES=(${(s:,:)SDKMAN_CANDIDATES_CSV})
	scripts=(
		${SDKMAN_DIR}/{src,ext}/sdkman-*.sh(N)
	)
else
	IFS=',' read -a SDKMAN_CANDIDATES <<< "${SDKMAN_CANDIDATES_CSV}"
	# if nullglob is on then do nothing
	if shopt nullglob > /dev/null; then
		scripts=(
			"${SDKMAN_DIR}"/{src,ext}/sdkman-*.sh
		)
	else
		# if nullglob is off then turn it on and reset it back
		# for bash turn nullglob on so that if there are no files in 'ext' that
		# have the pattern 'sdkman-*.sh'
		# then it will not be expanded or cause an error
		shopt -s nullglob
		scripts=(
			"${SDKMAN_DIR}"/{src,ext}/sdkman-*.sh
		)
		# reset it back to the how the original status
		shopt -u nullglob
	fi
fi

for f in "${scripts[@]}"; do
	source "$f"
done

# Create upgrade delay file if it doesn't exist
[[ -f "${SDKMAN_DIR}/var/delay_upgrade" ]] || touch "${SDKMAN_DIR}/var/delay_upgrade"

# use parameter expansion
# set curl connect-timeout and max-time
sdkman_curl_connect_timeout=${sdkman_curl_connect_timeout:-7}
sdkman_curl_max_time=${sdkman_curl_max_time:-10}

# set curl retry
sdkman_curl_retry=${sdkman_curl_retry:-0}

# set curl retry max time in seconds
sdkman_curl_retry_max_time=${sdkman_curl_retry_max_time:-60}

# set curl to continue downloading automatically
sdkman_curl_continue=${sdkman_curl_continue:-true}

# if has a custom location
export SDKMAN_CANDIDATES_DIR=${SDKMAN_CANDIDATES_DIR:-"$SDKMAN_DIR/candidates"}

# only need to check the directorys that already exist in the $SDKMAN_CANDIDATES_DIR
for candidate_name in "$SDKMAN_CANDIDATES_DIR"/*; do
	candidate_dir="${candidate_name}/current"
	if [[ -h "$candidate_dir" || -d "${candidate_dir}" ]]; then
		# use f as a temparary variable
		# delete sdkman_export_candidate_home as this was the only place it was used
		# this does the same as __sdkman_export_candidate_home
		# get the basename
		f="${candidate_name##*/}"
		# the ':u' makes f uppercase
		f="${f:u}"
		[[ -z "${f}_HOME" ]] && export "${f}_HOME"="$candidate_dir"

		# prepend candidate to path
		# this does the same as __sdkman_prepend_candidate_to_path
		# so I deleted __sdkman_prepend_candidate_to_path as it was only used here
		# just update candidate_dir if ${candidate_dir}/bin exists
		# otherwise leave it the same
		if [[ -d "${candidate_dir}/bin" ]]; then
			candidate_dir="$candidate_dir/bin"
		fi
		# check if candidate_dir is in the path otherwise add it to the path
		[[ "$PATH" == *"$candidate_dir"* ]] || PATH="${candidate_dir}:${PATH}"
	fi
done

# unset everything in at once
unset candidate_name candidate_dir f scripts
export PATH

# source completion scripts
if [[ "$sdkman_auto_complete" == 'true' ]]; then
	if [[ "$zsh_shell" == 'true' ]]; then
		# initialize zsh completions (if not already done)
		if ! (( $+functions[compdef] )) ; then
			autoload -Uz compinit
			if [[ $ZSH_DISABLE_COMPFIX == 'true' ]]; then
				compinit -u -C
			else
				compinit
			fi
		fi
		autoload -U bashcompinit
		bashcompinit
		source "${SDKMAN_DIR}/contrib/completion/bash/sdk"
		__sdkman_echo_debug "ZSH completion script loaded..."
	elif [[ "$bash_shell" == 'true' ]]; then
		source "${SDKMAN_DIR}/contrib/completion/bash/sdk"
		__sdkman_echo_debug "Bash completion script loaded..."
	else
		__sdkman_echo_debug "No completion scripts found for $SHELL"
	fi
fi

if [[ "$sdkman_auto_env" == "true" ]]; then
	if [[ "$zsh_shell" == "true" ]]; then
		function sdkman_auto_env() {
			if [[ -n $SDKMAN_ENV ]] && [[ ! $PWD =~ ^$SDKMAN_ENV ]]; then
				sdk env clear
			fi
			[[ -f .sdkmanrc ]] && sdk env
		}

		chpwd_functions+=(sdkman_auto_env)
	else
		function sdkman_auto_env() {
			if [[ -n $SDKMAN_ENV ]] && [[ ! $PWD =~ ^$SDKMAN_ENV ]]; then
				sdk env clear
			fi
			if [[ "$SDKMAN_OLD_PWD" != "$PWD" ]] && [[ -f ".sdkmanrc" ]]; then
				sdk env
			fi

			export SDKMAN_OLD_PWD="$PWD"
		}

		trimmed_prompt_command="${PROMPT_COMMAND%"${PROMPT_COMMAND##*[![:space:]]}"}"
		[[ -z "$trimmed_prompt_command" ]] && PROMPT_COMMAND="sdkman_auto_env" || PROMPT_COMMAND="${trimmed_prompt_command%\;};sdkman_auto_env"
	fi

	sdkman_auto_env
fi