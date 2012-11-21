# GVM the Groovy enVironment Manager

GVM is a tool for managing parallel Versions of multiple Software Development Kits on any Unix based system. It provides a convenient command line interface for installing, switching, removing and listing Candidates.

See documentation on the [GVM Project Page](http://gvmtool.net).

Please report any bugs and feature request on the [GitHub Issue Tracker](https://github.com/gvmtool/gvm/issues).

Questions and disccusion at the [Nabble Forum](http://forum.gvmtool.net).

## Installation

Open your favourite terminal and enter the following:

    curl -s get.gvmtool.net | bash

If the environment needs tweaking for GVM to be installed, the installer will prompt you accordingly and ask you to restart.

## Running the Cucumber Features

All GVM's tests are written in Cucumber and can be found under `src/test/cucumber/gvm`. These can be run with Gradle by running the following command:

    ./gradlew -i

__Please enusre that the JAVA_HOME environment variable set to JDK 1.7 on you system!__

Mac users can add the following line to their `~/.bash_profile` file to set this variable:

	export JAVA_HOME=$(/usr/libexec/java_home -v1.7)

## Running the Server locally

Ensure that you have vertx installed on your machine.

	gvm install vert.x

To start up the server locally, simply enter:

    vertx run build/server/server.groovy

This will start the server on localhost:8080

To make your GVM installation work with your local server, edit the GVM_SERVICE variable in the `~/.gvm/bin/gvm-init.sh` file as follows:

    export GVM_SERVICE="http://localhost:8080"


