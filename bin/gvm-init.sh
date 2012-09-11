#!/bin/bash

# add groovy to path
GROOVY_HOME="$HOME/.gvm/groovy/current"
if [ -L "$GROOVY_HOME" ]; then
	PATH="$PATH:$GROOVY_HOME/bin"
fi

# add grails to path
GRAILS_HOME="$HOME/.gvm/grails/current"
if [ -L "$GRAILS_HOME" ]; then
	PATH="$PATH:$GRAILS_HOME/bin"
fi

# add griffon to path
GRIFFON_HOME="$HOME/.gvm/griffon/current"
if [ -L "$GRIFFON_HOME" ]; then
	PATH="$PATH:$GRIFFON_HOME/bin"
fi

#add gradle to path
GRADLE_HOME="$HOME/.gvm/gradle/current"
if [ -L "$GRADLE_HOME" ]; then
	PATH="$PATH:$GRADLE_HOME/bin"
fi

export PATH
