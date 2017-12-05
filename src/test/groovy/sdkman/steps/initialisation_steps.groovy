package sdkman.steps

import sdkman.stubs.UnameStub

import java.util.zip.ZipException
import java.util.zip.ZipFile

import static cucumber.api.groovy.EN.*
import static sdkman.stubs.WebServiceStub.primeEndpointWithString
import static sdkman.stubs.WebServiceStub.primeSelfupdate

import sdkman.env.SdkmanBashEnvBuilder

import static sdkman.support.UnixUtils.asSdkmanPlatform

def BROADCAST_MESSAGE = "broadcast message"

And(~'^the sdkman work folder is created$') { ->
    assert sdkmanDir.isDirectory(), "The SDKMAN directory does not exist."
}

And(~'^the "([^"]*)" folder exists in user home$') { String arg1 ->
    assert sdkmanDir.isDirectory(), "The SDKMAN directory does not exist."
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
	def archive = new File("${sdkmanDir}/archives/${candidate}-${version}.zip")
	assert ! archive.exists()
}

And(~'^the internet is reachable$') {->
    primeEndpointWithString("/broadcast/latest/id", "12345")
    primeEndpointWithString("/broadcast/latest", BROADCAST_MESSAGE)
    primeEndpointWithString("/app/stable", sdkmanVersion)
    primeSelfupdate()

    offlineMode = false
    serviceUrlEnv = SERVICE_UP_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^the internet is not reachable$') {->
    offlineMode = false
    serviceUrlEnv = SERVICE_DOWN_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^offline mode is disabled with reachable internet$') {->
    primeEndpointWithString("/broadcast/latest/id", "12345")
    primeEndpointWithString("/broadcast/latest", BROADCAST_MESSAGE)
    primeEndpointWithString("/app/stable", sdkmanVersion)

    offlineMode = false
    serviceUrlEnv = SERVICE_UP_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^offline mode is enabled with reachable internet$') {->
    primeEndpointWithString("/broadcast/latest/id", "12345")
    primeEndpointWithString("/broadcast/latest", BROADCAST_MESSAGE)
    primeEndpointWithString("/app/stable", sdkmanVersion)

    offlineMode = true
    serviceUrlEnv = SERVICE_UP_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^offline mode is enabled with unreachable internet$') {->
    offlineMode = true
    serviceUrlEnv = SERVICE_DOWN_URL
    javaHome = FAKE_JDK_PATH
}

And(~'^a machine with "(.*)" installed$') { String platform ->
    def binFolder = "$sdkmanBaseDir/bin" as File
    UnameStub.prepareIn(binFolder)
            .forPlatform(asSdkmanPlatform(platform))
            .build()
}

And(~'^an initialised environment$') {->
    bash = SdkmanBashEnvBuilder.create(sdkmanBaseDir)
        .withOfflineMode(offlineMode)
        .withLegacyService(serviceUrlEnv)
        .withCurrentService(serviceUrlEnv)
        .withJdkHome(javaHome)
        .withHttpProxy(HTTP_PROXY)
        .withVersionCache(sdkmanVersion)
        .withCandidates(localCandidates)
        .withSdkmanVersion(sdkmanVersion)
        .build()
}

And(~'^an outdated initialised environment$') {->
    bash = SdkmanBashEnvBuilder.create(sdkmanBaseDir)
        .withOfflineMode(offlineMode)
        .withLegacyService(serviceUrlEnv)
        .withCurrentService(serviceUrlEnv)
        .withJdkHome(javaHome)
        .withHttpProxy(HTTP_PROXY)
        .withVersionCache(sdkmanVersionOutdated)
        .withSdkmanVersion(sdkmanVersionOutdated)
        .build()

    def twoDaysAgoInMillis = System.currentTimeMillis() - 172800000

    def upgradeFile = "$sdkmanDir/var/delay_upgrade" as File
    upgradeFile.createNewFile()
    upgradeFile.setLastModified(twoDaysAgoInMillis)

    def versionFile = "$sdkmanDir/var/version" as File
    versionFile.setLastModified(twoDaysAgoInMillis)

    def initFile = "$sdkmanDir/bin/sdkman-init.sh" as File
    initFile.text = initFile.text.replace(sdkmanVersion, sdkmanVersionOutdated)
}

And(~'^the system is bootstrapped$') {->
    bash.start()
    bash.execute("source $sdkmanDirEnv/bin/sdkman-init.sh")
}

And(~'^the system is bootstrapped again$') {->
    bash.execute("source $sdkmanDirEnv/bin/sdkman-init.sh")
}

And(~/^the sdkman version is "([^"]*)"$/) { String version ->
    sdkmanVersion = version
}

And(~/^the candidates cache is initialised with "(.*)"$/) { String candidate ->
    localCandidates << candidate
}