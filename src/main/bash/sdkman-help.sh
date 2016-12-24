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

function __sdk_help {
	__sdkman_echo_white ""
	__sdkman_echo_white "Usage: sdk <command> [candidate] [version]"
	__sdkman_echo_white "       sdk offline <enable|disable>"
	__sdkman_echo_white ""
	__sdkman_echo_white "   commands:"
	__sdkman_echo_white "       install   or i    <candidate> [version]"
	__sdkman_echo_white "       uninstall or rm   <candidate> <version>"
	__sdkman_echo_white "       list      or ls   [candidate]"
	__sdkman_echo_white "       use       or u    <candidate> [version]"
	__sdkman_echo_white "       default   or d    <candidate> [version]"
	__sdkman_echo_white "       current   or c    [candidate]"
	__sdkman_echo_white "       upgrade   or ug   [candidate]"
	__sdkman_echo_white "       version   or v"
	__sdkman_echo_white "       broadcast or b"
	__sdkman_echo_white "       help      or h"
	__sdkman_echo_white "       offline           [enable|disable]"
	__sdkman_echo_white "       selfupdate        [force]"
	__sdkman_echo_white "       flush             <candidates|broadcast|archives|temp>"
	__sdkman_echo_white ""
	__sdkman_echo_white "   candidate  :  the SDK to install: groovy, scala, grails, gradle, kotlin, etc."
	__sdkman_echo_white "                 use list command for comprehensive list of candidates"
	__sdkman_echo_white "                 eg: \$ sdk list"
	__sdkman_echo_white ""
	__sdkman_echo_white "   version    :  where optional, defaults to latest stable if not provided"
	__sdkman_echo_white "                 eg: \$ sdk install groovy"
	__sdkman_echo_white ""
}
