# SDKMAN! CLI
### The Software Development Kit Manager Command Line Interface

[![Build Status](https://travis-ci.org/sdkman/sdkman-cli.svg?branch=master)](https://travis-ci.org/sdkman/sdkman-cli)
[![Latest Version](https://api.bintray.com/packages/sdkman/generic/sdkman-cli/images/download.svg) ](https://bintray.com/sdkman/generic/sdkman-cli/_latestVersion)
[![Gitter](https://badges.gitter.im/sdkman/user-issues.png)](https://gitter.im/sdkman/user-issues)

SDKMAN is a tool for managing parallel Versions of multiple Software Development Kits on any Unix based system. It provides a convenient command line interface for installing, switching, removing and listing Candidates.

See documentation on the [SDKMAN! website](https://sdkman.io).

## Installation

Open your favourite terminal and enter the following:

    $ curl -s https://get.sdkman.io | bash

If the environment needs tweaking for SDKMAN to be installed, the installer will prompt you accordingly and ask you to restart.

## Running the Cucumber Features

All SDKMAN's BDD tests describing the CLI behaviour are written in Cucumber and can be found under `src/test/cucumber/sdkman`. These can be run with Gradle by running the following command:

    $ ./gradlew test

To perform development, you will need to have a JDK 8 or higher installed which can be obtained by running the following after installing SDKMAN:

    $ sdk install java

### Using Docker for tests

You can run the tests in a Docker container to guarantee a clean test environment.

    $ docker build --tag=sdkman-cli/gradle .
    $ docker run --rm -it sdkman-cli/gradle test

By running the following command, you don't need to wait for downloading Gradle wrapper and other dependencies. The test reports can be found under the local `build` directory.

    $ docker run --rm -it -v $PWD:/usr/src/app -v $HOME/.gradle:/root/.gradle sdkman-cli/gradle test

### Local Installation

To install SDKMAN locally running against your local server, run the following commands:

	$ ./gradlew install
	$ source ~/.sdkman/bin/sdkman-init.sh

Or run install locally with Production configuration:

	$ ./gradlew -Penv=production install
	$ source ~/.sdkman/bin/sdkman-init.sh
