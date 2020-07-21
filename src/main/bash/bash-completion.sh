#!/usr/bin/env bash

_sdk_completion() {
  local -r previous_word=${COMP_WORDS[$COMP_CWORD - 1]}
  local -r current_word=${COMP_WORDS[$COMP_CWORD]}

  case "$previous_word" in
    sdk)
      COMPREPLY=($(compgen -W "install uninstall list use default home env current upgrade version broadcast help offline selfupdate update flush" -- "$current_word"))
      ;;
    env)
      COMPREPLY=($(compgen -W "init" -- "$current_word"))
      ;;
    current)
      local candidates=()

      for candidate_path in "$SDKMAN_CANDIDATES_DIR"/*; do
        candidates+=(${candidate_path##*/})
      done

      COMPREPLY=($(compgen -W "${candidates[*]}" -- "$current_word")) 
      ;;
    offline)
      COMPREPLY=($(compgen -W "enable disable" -- "$current_word"))
      ;;
    selfupdate)
      COMPREPLY=($(compgen -W "force" -- "$current_word"))
      ;;
    flush)
      COMPREPLY=($(compgen -W "broadcast archives temp" -- "$current_word"))
  esac
}

complete -F _sdk_completion sdk
