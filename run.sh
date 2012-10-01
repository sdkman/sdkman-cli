#!/bin/bash

if [ -z $(which java) ]; then
	echo "Please install java before continuing..."
fi

if [ -z $(which vertx) ]; then
	echo "Please install vertx before continuing..."
	exit 0
fi

vertx run srv/server.groovy
