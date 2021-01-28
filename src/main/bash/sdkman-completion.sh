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

function __sdk_completion() {
	local -r shell="$1"

	case "$shell" in
    	bash)
    		__sdkman_completion_bash
			;;
		zsh)
			__sdkman_completion_zsh
			;;
		*)
			__sdkman_echo_red "No shell provided." && return 1
	esac
}

function __sdkman_completion_bash() {
	\cat <<- 'EOF'
	_sdk_completion() {
	    local -r previous_word="${COMP_WORDS[COMP_CWORD - 1]}"
	    local -r current_word="${COMP_WORDS[COMP_CWORD]}"

	    local candidates

	    case "$previous_word" in
	    sdk)
	        candidates=("install" "uninstall" "list" "use" "completion" "default" "home" "env" "current" "upgrade" "version" "broadcast" "help" "offline" "selfupdate" "update" "flush")
	        ;;
	    completion)
	        candidates=("bash" "zsh")
	        ;;
	    env)
	        candidates=("init install clear")
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
	        candidates=("archives" "temp" "broadcast" "version")
	        ;;
	    esac

	    COMPREPLY=($(compgen -W "${candidates[*]}" -- "$current_word"))
	}

	complete -o default -F _sdk_completion sdk		
	EOF
}

function __sdkman_completion_zsh() {
	__sdkman_echo_yellow "zsh is not supported yet."
}