#!/bin/bash

if [ -z $(which java) ]; then
	echo "Please install java before continuing..."
fi

if [ -z $(which vertx) ]; then
	echo "Please install vertx before continuing..."
	exit 0
fi

export JAVA_HOME="/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home"
vertx run srv/server.groovy
