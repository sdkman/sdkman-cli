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

    ./build.sh

__Do not run Gradle directly! Doing so will delete your local GVM installation (with all installed candidates) on teardown of the tests.__

## Running the Server locally

Ensure that you have vertx installed and set up on your path. To start up the server locally, simply enter:

    ./run.sh

This will start the server on localhost:8080

To make your GVM installation work with your local server, edit the GVM_SERVICE variable in the `~/.gvm/bin/gvm-init.sh` file as follows:

    export GVM_SERVICE="http://localhost:8080"


