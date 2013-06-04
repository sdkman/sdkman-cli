package gvm

import java.util.zip.ZipException
import java.util.zip.ZipFile

import static cucumber.api.groovy.EN.*

final SERVICE_DOWN = "http://localhost:0"
final FAKE_JDK_PATH = "/path/to/my/openjdk"

Then(~'^the gvm work folder is created$') { ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

Then(~'^the "([^"]*)" folder exists in user home$') { String arg1 ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

Given(~'^an initialised system$') { ->
    gvmDir.mkdirs()
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

When(~'^I reinitialise the shell$') { ->
    def initScript = "$gvmDir/bin/gvm-init.sh" as File
    assert initScript.exists()
}

Given(~'^the internet is reachable$') {->
    def forceOffline = "false"
    def online = "true"
    initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, serviceUrlEnv, FAKE_JDK_PATH)
}

Given(~'^the internet is not reachable$') {->
    def forceOffline = "false"
    def online = "false"
    initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, SERVICE_DOWN, FAKE_JDK_PATH)
}

And(~'^offline mode is disabled with reachable internet$') {->
    def forceOffline = "false"
    def online = "true"
    initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, serviceUrlEnv, FAKE_JDK_PATH)
}

And(~'^offline mode is enabled with reachable internet$') {->
    def forceOffline = "true"
    def online = "true"
    initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, serviceUrlEnv, FAKE_JDK_PATH)
}

And(~'^offline mode is enabled with unreachable internet$') {->
    def forceOffline = "true"
    def online = "false"
    initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, SERVICE_DOWN, FAKE_JDK_PATH)
}

private initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, serviceUrlEnv, javaHome){
    bash = new BashEnv(gvmBaseEnv, [GVM_DIR: gvmDirEnv, GVM_ONLINE:online, GVM_FORCE_OFFLINE: forceOffline, GVM_SERVICE: serviceUrlEnv, JAVA_HOME: javaHome])
    bash.start()
    bash.execute("source $gvmDirEnv/bin/gvm-init.sh")
}