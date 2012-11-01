#!/bin/bash
export JAVA_HOME=$(/usr/libexec/java_home -v1.7)
export GVM_SERVICE="http://localhost:8080"
export GVM_DIR="/tmp/gvm"
./gradlew --daemon -i clean test
