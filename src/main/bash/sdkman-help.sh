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

function __sdk_help {
	__sdkman_validate_no_arguments "sdk ${COMMAND}" "${@}" || return 1

	__sdkman_command_usage 'sdk' '' '1*' 'command_or_alias' 'argument'

	printf '
    COMMAND    ALIAS ARGUMENTS
    ========== ===== ======================================'
	__sdkman_color_usage '
    install    i      <candidate>  [<version>] [<local_path>]
    uninstall  rm     <candidate>   <version>
    list       ls    [<candidate>]
    use        u      <candidate>   <version>
    default    d      <candidate>  [<version>]
    home       h      <candidate>   <version>
    current    c     [<candidate>]
    upgrade    ug    [<candidate>]
    version    v
    broadcast  b
    help
    offline          [enable|disable]
    selfupdate       [force]
    update
    flush            (archives|broadcast|temp|version)'
	printf '

    VARIABLE ARGUMENTS:
    '
    __sdkman_color_usage '<candidate>'
    printf ':  SDK to install, eg: groovy, scala, grails, gradle, kotlin, etc.
                  use list command without arguments for complete candidates list
                  eg: $ sdk list

    '
    __sdkman_color_usage '<version>'
    printf ':    version to install
                  if not provided when optional, defaults to latest stable version
                  eg: $ sdk install groovy

    '
    __sdkman_color_usage '<local_path>'
    printf ': path to an existing local installation
                  eg: $ sdk install groovy 2.4.13-local /opt/groovy-2.4.13
'
}
