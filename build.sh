#!/bin/bash
export JAVA_HOME="/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home"
export GVM_SERVICE="http://localhost:8080"
export GVM_DIR="/tmp/gvm"
./gradlew -i clean test
