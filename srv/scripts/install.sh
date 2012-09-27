#!/bin/bash

GVM_SERVICE="http://beta.freshgroovy.org"

echo '                                                                     '
echo 'Thanks for using                                                     '
echo '                                                                     '
echo '_____/\\\\\\\\\\\\__/\\\________/\\\__/\\\\____________/\\\\_        '
echo ' ___/\\\//////////__\/\\\_______\/\\\_\/\\\\\\________/\\\\\\_       '
echo '  __/\\\_____________\//\\\______/\\\__\/\\\//\\\____/\\\//\\\_      '
echo '   _\/\\\____/\\\\\\\__\//\\\____/\\\___\/\\\\///\\\/\\\/_\/\\\_     '
echo '    _\/\\\___\/////\\\___\//\\\__/\\\____\/\\\__\///\\\/___\/\\\_    '
echo '     _\/\\\_______\/\\\____\//\\\/\\\_____\/\\\____\///_____\/\\\_   '
echo '      _\/\\\_______\/\\\_____\//\\\\\______\/\\\_____________\/\\\_  '
echo '       _\//\\\\\\\\\\\\/_______\//\\\_______\/\\\_____________\/\\\_ '
echo '        __\////////////__________\///________\///______________\///__'
echo '                                                                     '
echo '                                       Will now attempt installing...'
echo '                                                                     '

echo "Looking for JAVA_HOME..."
if [ -z "$JAVA_HOME" ]; then
	echo "Not found."
	echo ""
	echo "======================================================================================================"
	echo " Please ensure that you have a Java SDK installed and that JAVA_HOME environment variable is set."
	echo " accordingly."
	echo ""
	echo " Java can be found here:"
	echo "     http://www.oracle.com/technetwork/java/javase/downloads/index.html"
	echo ""
	echo " Set JAVA_HOME by editing your ~/.profile file and adding:"
	echo "     export JAVA_HOME=\"/path/to/my/jdk\""
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Validating JAVA_HOME..."
if [ ! -f "$JAVA_HOME/bin/java" ]; then
	echo "Invalid."
	echo ""
	echo "======================================================================================================"
	echo " Please ensure that your JAVA_HOME points to a valid Java SDK."
	echo " You are currently pointing to:"
	echo ""
	echo "  $JAVA_HOME"
	echo ""
	echo " This does not seem to be valid. Please rectify and restart."
	echo "======================================================================================================"
	echo ""
	exit 0	
fi

echo "Checking for previous versions of Grails..."
if [ ! -z "$GRAILS_HOME" ]; then
	echo "GRAILS_HOME found."
	echo ""
	echo "======================================================================================================"
	echo " You already have a GRAILS_HOME defined. This will cause problems with GVM."
	echo " GRAILS_HOME is currently pointing to:"
	echo ""
	echo "  $GRAILS_HOME"
	echo ""
	echo " Please remove it from your PATH and restart."
	echo "======================================================================================================"
	echo ""
	exit 0
fi

if [ ! -z $(which grails) ]; then
	echo "Grails found."
	echo ""
	echo "======================================================================================================"
	echo " You already have Grails installed. This will cause problems with GVM."
	echo " Grails was found at:"
	echo ""
	echo " $(which grails)"
	echo ""
	echo " Please remove it from your PATH and restart."
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Looking for curl..."
if [ -z $(which curl) ]; then
	echo "Not found."
	echo ""
	echo "======================================================================================================"
	echo " Please install curl on your system using your favourite package manager."
	echo ""
	echo " What is 'curl' you might ask?"
	echo ""
	echo " From the curl manpage:"
	echo ""
	echo " curl  is a tool to transfer data from or to a server, using one of the supported protocols. The"
	echo " command is designed to work without user interaction. curl offers a busload of useful tricks like"
	echo " proxy support, user authentication, FTP upload, HTTP post, SSL connections, cookies, file transfer"
	echo " resume, Metalink, and more. the number of features will make your head spin!"
	echo ""
	echo " GVM uses curl for crucial interactions with it's backend server."
	echo ""
	echo " Please install curl and restart."
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Installing gvm scripts..."
mkdir -p "$HOME/.gvm/bin"
curl -s "$GVM_SERVICE/res/init" > "$HOME/.gvm/bin/gvm-init.sh"
curl -s "$GVM_SERVICE/res/gvm" > "$HOME/.gvm/bin/gvm"
chmod +x "$HOME/.gvm/bin/gvm-init.sh"
chmod +x "$HOME/.gvm/bin/gvm"

SNIPPET='[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && . "$HOME/.gvm/bin/gvm-init.sh"'
echo "Attempting to update bash profile..."
if [ ! -f "$HOME/.profile" -a ! -f "$HOME/.bashrc" ]; then
	echo "#!/bin/bash" > "$HOME/.profile"
	echo "$SNIPPET" >> "$HOME/.profile"
	echo "Created and updated .profile"
else
	if [ -f "$HOME/.profile" ]; then
		echo "" >> "$HOME/.profile"
		echo "$SNIPPET" >> "$HOME/.profile"
		echo "Updated existing .profile"
	else
		echo "" >> "$HOME/.bashrc"
		echo "$SNIPPET" >> "$HOME/.bashrc"
		echo "Updated existing .bashrc"
	fi
fi

echo "All done!"

echo ""
echo "Please open a new terminal and enter 'gvm help' to get started."
echo "Enjoy!!!"
