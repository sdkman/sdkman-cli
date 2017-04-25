#!/usr/bin/env bash

if [ -z $(which java) ]; then
	echo "Please install java before continuing..."
fi

if [ -z $(which vertx) ]; then
	echo "Please install vertx before continuing..."
	exit 0
fi

if [ -z "$JAVA_HOME" ]; then
	echo "Please point JAVA_HOME at a valid JDK 7.0"
	exit 0
fi

vertx run build/server/server.groovy
