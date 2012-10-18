# GVM the Groovy enVironment Manager

GVM is a tool for managing parallel Versions of multiple Software Development Kits on any Unix based system. It provides a convenient command line interface for installing, switching, removing and listing Candidates.

See documentation on http://gvmtool.net/

Candidates that will initially be supported are:

*   Groovy
*   Grails
*   Griffon
*   Gradle

The beta version will only be providing Grails for the sake of simplicity.

Supported platforms are:

*   Linux
*   Mac OSX
*   Cygwin
*   Solaris
*   FreeBSD

GVM only depends on bash, curl and unzip to be present on your system. The installer will check for these before completing the installation process.

GVM also has a server-side component written with vertx enabling it's dynamic behavior. New available candidates and versions can be added to GVM without the need for re-installation. It also facilitates easy installation and upgrade of the client-side components. As well as a facility for live notifications. 

The server will use MongoDB for persistence and gathering of usage statistics.


## Installation

Open your favourite terminal and enter the following:

    curl -s beta.gvmtool.net | bash

If the environment needs tweaking for GVM to be installed, the installer will prompt you accordingly and ask you to restart.

## Running the Cucumber Features

All GVM's tests are written in Cucumber and can be found under *src/test/cucumber/gvm*. These can be run with Gradle by running the following command:

    ./build.sh

__Do not run Gradle directly! Doing so will delete your local GVM installation (with all installed candidates) on teardown of the tests.__

## Running the Server locally

Ensure that you have vertx installed and set up on your path. To start up the server locally, simply enter:

    ./run.sh

This will start the server on localhost:8080

