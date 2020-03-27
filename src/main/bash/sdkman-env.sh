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

function __sdk_env {
  readonly sdkmanrc='.sdkmanrc'

  if [[ ! -f "$sdkmanrc" ]]; then
    __sdkman_echo_red "$sdkmanrc not found."

    return 1
  fi

  local line_number=0

  while IFS= read -r line || [[ -n $line ]]; do
    if [[ ! $line =~ ^[[:lower:]]+=.+$ ]]; then
      __sdkman_echo_red "${sdkmanrc}:${line_number}: Invalid candidate format! Expected 'candidate=version' but found '$line'"

      return 1
    fi

    __sdk_use "${line%*=}" "${line#=*}"

    ((line_number++))
  done < "$sdkmanrc"
}