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

_sdk_completion() {
	local -r previous_word="${COMP_WORDS[COMP_CWORD - 1]}"
	local -r current_word="${COMP_WORDS[COMP_CWORD]}"
	local candidates

 	case "$previous_word" in
	sdk)
		candidates=("install" "uninstall" "list" "use" "default" "home" "env" "current" "upgrade" "version" "broadcast" "help" "offline" "selfupdate" "update" "flush")
		;;
	env)
		candidates=("init")
		;;
	current)
		candidates=()

		for candidate_path in "$SDKMAN_CANDIDATES_DIR"/*; do
			candidates+=("${candidate_path##*/}")
		done
		;;
	offline)
		candidates=("enable" "disable")
		;;
	selfupdate)
		candidates=("force")
		;;
	flush)
		candidates=("broadcast archives temp")
		;;
	esac

	COMPREPLY=($(compgen -W "${candidates[*]}" -- "$current_word"))
}

complete -F _sdk_completion sdk
