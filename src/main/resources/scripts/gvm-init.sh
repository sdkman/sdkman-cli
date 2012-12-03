#!/bin/bash

export GVM_SERVICE="@GVM_SERVICE@"

GVM_BASE="$HOME/.gvm"
PATH="$GVM_BASE/bin:$GVM_BASE/ext:$PATH"

GROOVY_HOME="$GVM_BASE/groovy/current"
GRAILS_HOME="$GVM_BASE/grails/current"
GRIFFON_HOME="$GVM_BASE/griffon/current"
GRADLE_HOME="$GVM_BASE/gradle/current"
VERTX_HOME="$GVM_BASE/vert.x/current"

export PATH="$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GRIFFON_HOME/bin:$GRADLE_HOME/bin:$VERTX_HOME/bin:$PATH"
