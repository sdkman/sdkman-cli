# SDKMAN
### The Software Development Kit Manager

[![Build Status](https://drone.io/github.com/gvmtool/gvm/status.png)](https://drone.io/github.com/gvmtool/gvm/latest)
[![Stories in Ready](https://badge.waffle.io/gvmtool/gvm-cli.png?label=ready&title=Ready)](https://waffle.io/gvmtool/gvm-cli)

SDKMAN is a tool for managing parallel Versions of multiple Software Development Kits on any Unix based system. It provides a convenient command line interface for installing, switching, removing and listing Candidates.

See documentation on the [sdkman Project Page](http://sdkman.io).

Please report any bugs and feature request on the [GitHub Issue Tracker](https://github.com/sdkman/sdkman-cli/issues).

## Installation

Open your favourite terminal and enter the following:

    $ curl -s api.sdkman.io | bash

If the environment needs tweaking for SDKMAN to be installed, the installer will prompt you accordingly and ask you to restart.

## Running the Cucumber Features

All SDKMAN's BDD tests are written in Cucumber and can be found under `src/test/cucumber/sdkman`.
These can be run with Gradle by running the following command:

    $ ./gradlew


__Please ensure that the JAVA_HOME environment variable set to JDK 1.8 on your system!__

Mac users can add the following line to their `~/.bash_profile` file to set this variable:

	export JAVA_HOME=$(/usr/libexec/java_home -v1.8)

### Using Docker for tests

You can run the tests in the docker container guaranteeing a clean test environment.

    $ docker build -t sdkman-cli/testing .
    $ docker run --rm sdkman-cli/testing

By running the following command, you don't need to wait for downloading Gradle wrapper and other dependencies. The test reports can be found under the local `build` directory.

    $ docker run --rm -v $PWD:/usr/src/app -v $HOME/.gradle:/root/.gradle sdkman-cli/testing

## Running the Server Locally

It is useful to run the server locally for development purposes. Working installations of MongoDB and vert.x are required to get going. Sdkman can be used to install vert.x, otherwise install it manually as described on the [install page](http://vertx.io/install.html).

	$ sdk install vertx

Next, install MongoDB as described [here](http://www.mongodb.org/downloads). After installing, the database needs to be primed with some data. The following lines may be run with `mongod` running as a separate process.

	$ cd /path/to/sdkman
	$ mongo sdkman
	> db.candidates.insert({candidate:"groovy", default:"2.0.6"})
	> db.versions.insert({candidate:"groovy", version:"2.0.5", url:"http://dist.groovy.codehaus.org/distributions/groovy-binary-2.0.5.zip"})
	> db.versions.insert({candidate:"groovy", version:"2.0.6", url:"http://dist.groovy.codehaus.org/distributions/groovy-binary-2.0.6.zip"})

This will:

*   create a new `sdkman` database
*   the Groovy candidate in the `candidates` collection (defaulting to version 2.0.6)
*   new versions 2.0.5 and 2.0.6 in the `versions` collection.

Add any other candidates that you might require.

Next, prepare the local SDKMAN environment by building and starting the server.

	$ ./gradlew
	$ bin/run.sh

This will start the server on localhost:8080

### Customizing the Database Location

The database may be configured using environment variables. If non are found, it will assume sensible defaults for a local mongodb installation. The follow environment variables can be specified:

    SDKMAN_DB_ADDRESS="mongo-persistor"
    SDKMAN_DB_HOST="xxx.mongohq.com"
    SDKMAN_DB_PORT="1234"
    SDKMAN_DB_NAME="sdkman"
    SDKMAN_DB_PASSWORD="mypassword"
    SDKMAN_DB_USERNAME="myusername"

### Local Installation

To install SDKMAN locally running against your local server, run the following commands:

	$ ./gradlew install
	$ source ~/.sdkman/bin/sdkman-init.sh
