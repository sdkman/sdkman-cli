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

function __gvmtool_help {
	echo ""
	echo "Usage: gvm <command> <candidate> [version]"
	echo ""
	echo "   command    :  install, uninstall, list, use, current, version, default, selfupdate, broadcast or help"
	echo "   candidate  :  groovy, grails, griffon, gradle, vert.x"
	echo "   version    :  optional, defaults to latest stable if not provided"
	echo ""
	echo "eg: gvm install groovy"
}
