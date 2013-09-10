package gvm

import java.util.zip.ZipException
import java.util.zip.ZipFile

import static cucumber.api.groovy.EN.*

Then(~'^the gvm work folder is created$') { ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

Then(~'^the "([^"]*)" folder exists in user home$') { String arg1 ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

When(~'^the archive for candidate "([^"]*)" version "([^"]*)" is corrupt$') { String candidate, String version ->
	try {
		new ZipFile(new File("src/test/resources/${candidate}-${version}.zip"))
		assert false, "Archive was not corrupt!"

	} catch (ZipException ze){
		//expected behaviour
	}
}

Then(~'^the archive for candidate "([^"]*)" version "([^"]*)" is removed$') { String candidate, String version ->
	def archive = new File("${gvmDir}/archives/${candidate}-${version}.zip")
	assert ! archive.exists()
}

Given(~'^an initialised shell$') { ->
    def initScript = "$gvmDir/bin/gvm-init.sh" as File
    assert initScript.exists()
}

Given(~'^an outdated system$') {->
    def initScript = "$gvmDir/bin/gvm-init.sh" as File
    initScript.text = initScript.text.replace(gvmVersion, gvmVersionOutdated)
}

When(~'^I reinitialise the shell$') { ->
    def initScript = "$gvmDir/bin/gvm-init.sh" as File
    assert initScript.exists()
}

Given(~'^the internet is reachable$') {->
    forcedOffline = false
    online = true
    serviceUrlEnv = SERVICE_UP_URL
    javaHome = FAKE_JDK_PATH
}

Given(~'^the internet is not reachable$') {->
    forcedOffline = false
    online = false
    serviceUrlEnv = SERVICE_DOWN_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^offline mode is disabled with reachable internet$') {->
    forcedOffline = false
    online = true
    serviceUrlEnv = SERVICE_UP_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^offline mode is enabled with reachable internet$') {->
    forcedOffline = true
    online = true
    serviceUrlEnv = SERVICE_UP_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^offline mode is enabled with unreachable internet$') {->
    forcedOffline = true
    online = false
    serviceUrlEnv = SERVICE_DOWN_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^an initialised environment$') {->
    bash = GvmBashEnvBuilder.create(gvmBaseDir)
        .withOnlineMode(online)
        .withForcedOfflineMode(forcedOffline)
        .withService(serviceUrlEnv)
        .withJdkHome(javaHome)
        .build()

    bash.start()
    bash.execute("source $gvmDirEnv/bin/gvm-init.sh")
}

And(~'^the system is bootstrapped$') {->
    bash.execute("source $gvmDirEnv/bin/gvm-init.sh")
}