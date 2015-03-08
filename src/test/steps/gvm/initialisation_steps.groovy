package gvm

import java.util.zip.ZipException
import java.util.zip.ZipFile

import static cucumber.api.groovy.EN.*
import static gvm.stubs.WebServiceStub.primeEndpoint
import static gvm.stubs.WebServiceStub.primeSelfupdate

And(~'^the gvm work folder is created$') { ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

And(~'^the "([^"]*)" folder exists in user home$') { String arg1 ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

And(~'^the archive for candidate "([^"]*)" version "([^"]*)" is corrupt$') { String candidate, String version ->
	try {
		new ZipFile(new File("src/test/resources/__files/${candidate}-${version}.zip"))
		assert false, "Archive was not corrupt!"

	} catch (ZipException ze){
		//expected behaviour
	}
}

And(~'^the archive for candidate "([^"]*)" version "([^"]*)" is removed$') { String candidate, String version ->
	def archive = new File("${gvmDir}/archives/${candidate}-${version}.zip")
	assert ! archive.exists()
}

And(~'^an initialised shell$') { ->
    def initScript = "$gvmDir/bin/gvm-init.sh" as File
    assert initScript.exists()
}

And(~'^I reinitialise the shell$') { ->
    def initScript = "$gvmDir/bin/gvm-init.sh" as File
    assert initScript.exists()
}

And(~'^the internet is reachable$') {->
    primeEndpoint("/broadcast/latest/id", "12345")
    primeEndpoint("/app/version", gvmVersion)
    primeSelfupdate()

    forcedOffline = false
    online = true
    serviceUrlEnv = SERVICE_UP_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^the internet is not reachable$') {->
    forcedOffline = false
    online = false
    serviceUrlEnv = SERVICE_DOWN_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^offline mode is disabled with reachable internet$') {->
    primeEndpoint("/broadcast/latest", "This is a LIVE Broadcast!")

    forcedOffline = false
    online = true
    serviceUrlEnv = SERVICE_UP_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^offline mode is enabled with reachable internet$') {->
    primeEndpoint("/broadcast/latest/id", "12345")

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
    bash = env.GvmBashEnvBuilder.create(gvmBaseDir)
        .withOnlineMode(online)
        .withForcedOfflineMode(forcedOffline)
        .withService(serviceUrlEnv)
        .withBroadcastService(serviceUrlEnv)
        .withJdkHome(javaHome)
        .withHttpProxy(HTTP_PROXY)
        .withVersionToken(gvmVersion)
        .build()

    bash.start()
    bash.execute("source $gvmDirEnv/bin/gvm-init.sh")
}

And(~'^an outdated initialised environment$') {->
    bash = env.GvmBashEnvBuilder.create(gvmBaseDir)
        .withOnlineMode(online)
        .withForcedOfflineMode(forcedOffline)
        .withService(serviceUrlEnv)
        .withBroadcastService(serviceUrlEnv)
        .withJdkHome(javaHome)
        .withHttpProxy(HTTP_PROXY)
        .withVersionToken(gvmVersionOutdated)
        .build()

    def twoDaysAgoInMillis = System.currentTimeMillis() - 172800000

    def upgradeToken = "$gvmDir/var/delay_upgrade" as File
    upgradeToken.createNewFile()
    upgradeToken.setLastModified(twoDaysAgoInMillis)

    def versionToken = "$gvmDir/var/version" as File
    versionToken.setLastModified(twoDaysAgoInMillis)

    def initFile = "$gvmDir/bin/gvm-init.sh" as File
    initFile.text = initFile.text.replace(gvmVersion, gvmVersionOutdated)

    bash.start()
    bash.execute("source $gvmDirEnv/bin/gvm-init.sh")
}

And(~'^the system is bootstrapped$') {->
    bash.execute("source $gvmDirEnv/bin/gvm-init.sh")
}