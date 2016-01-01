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
	echo ""
	echo "Usage: sdk <command> [candidate] [version]"
	echo "       sdk offline <enable|disable>"
	echo ""
	echo "   commands:"
	echo "       install   or i    <candidate> [version]"
	echo "       uninstall or rm   <candidate> <version>"
	echo "       list      or ls   [candidate]"
	echo "       use       or u    <candidate> [version]"
	echo "       default   or d    <candidate> [version]"
	echo "       current   or c    [candidate]"
	echo "       outdated  or o    [candidate]"
	echo "       version   or v"
	echo "       broadcast or b"
	echo "       help      or h"
	echo "       offline           [enable|disable]"
	echo "       selfupdate        [force]"
	echo "       flush             <candidates|broadcast|archives|temp>"
	echo ""
	echo "   candidate  :  the SDK to install: groovy, scala, grails, akka, etc."
	echo "                 use list command for comprehensive list of candidates"
	echo "                 eg: \$ sdk list"
	echo ""
	echo "   version    :  where optional, defaults to latest stable if not provided"
	echo "                 eg: \$ sdk install groovy"
	echo ""
}
