# GVM the Groovy enVironment Manager

GVM is a tool for managing parallel Versions of multiple Software Development Kits on any Unix based system. It provides a convenient command line interface for installing, switching, removing and listing Candidates.

See documentation on the [GVM Project Page](http://gvmtool.net).

Please report any bugs and feature request on the [GitHub Issue Tracker](https://github.com/gvmtool/gvm/issues).

Questions and discussions at the [Nabble Forum](http://forum.gvmtool.net).

## Installation

Open your favourite terminal and enter the following:

    curl -s get.gvmtool.net | bash

If the environment needs tweaking for GVM to be installed, the installer will prompt you accordingly and ask you to restart.

## Running the Cucumber Features

All GVM's tests are written in Cucumber and can be found under `src/test/cucumber/gvm`. These can be run with Gradle by running the following command:

    ./gradlew

or to see the output

	./gradlew -i

__Please enusre that the JAVA_HOME environment variable set to JDK 1.7 on you system!__

Mac users can add the following line to their `~/.bash_profile` file to set this variable:

	export JAVA_HOME=$(/usr/libexec/java_home -v1.7)

## Running the Server locally

It is useful to run the server locally for development purposes. Working installations of MongoDB and vert.x are required to get going. GVM can be used to install vert.x, otherwise install it manually as described on the [install page](http://vertx.io/install.html).

	gvm install vert.x

Next, install MongoDB as described [here](http://www.mongodb.org/downloads). After installing, the database needs to be primed with some data. The following lines may be run with `mongod` running as a separate process.

	$ mongo default_db
	> db.candidates.insert({candidate:"groovy", default:"2.0.6"})
	> db.versions.insert({candidate:"groovy", version:"2.0.5", url:"http://dist.groovy.codehaus.org/distributions/groovy-binary-2.0.5.zip"})
	> db.versions.insert({candidate:"groovy", version:"2.0.6", url:"http://dist.groovy.codehaus.org/distributions/groovy-binary-2.0.6.zip"})

This will:

*   create a new `default_db` database
*   the Groovy candidate in the `candidates` collection defaulting to version 2.0.6
*   new versions in the `versions` collection.

Add any other candidates that you might require.

Next, prepare the local GVM environment by stepping into the cloned `gvm` folder, then building and starting the server.

	cd /path/to/gvm
	./gradlew
	./run.sh

This will start the server on localhost:8080

### Customizing the Database Location

The database may be configured in the `mongo.json` file in the root folder of the project. If no file is found, it will assume sensible defaults for a local mongodb installation. The file should be structured as follows:

	{
		"address":"mongo-persistor",
		"host":"host",
		"port":port,
		"username":"myuser",
		"password":"password",
		"db_name":"dbname"
	}

### Making the Local Installation the Default

To make your local GVM installation work with your local server, run the following commands:

	./gradlew install
	source ~/.gvm/bin/gvm-init.sh


