#!/bin/bash

export GVM_SERVICE="@GVM_SERVICE@"

GVM_DIR="$HOME/.gvm"
PATH="$GVM_DIR/bin:$GVM_DIR/ext:$PATH"

GROOVY_HOME="$GVM_DIR/groovy/current"
GRAILS_HOME="$GVM_DIR/grails/current"
GRIFFON_HOME="$GVM_DIR/griffon/current"
GRADLE_HOME="$GVM_DIR/gradle/current"
VERTX_HOME="$GVM_DIR/vert.x/current"

export PATH="$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GRIFFON_HOME/bin:$GRADLE_HOME/bin:$VERTX_HOME/bin:$PATH"
