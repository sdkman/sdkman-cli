package gvm

import static cucumber.api.groovy.EN.*

final SERVICE_DOWN = "http://localhost:0"
final FAKE_JDK_PATH = "/path/to/my/openjdk"

And(~'^offline mode is disabled$') {->
    forceOffline = false
}

And(~'^offline mode is enabled$') {->
    forceOffline = true
}

Given(~'^the internet is not reachable$') {->
    def online = "false"
    def forceOffline = forceOffline ?: "false"
    initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, SERVICE_DOWN, FAKE_JDK_PATH)
}


And(~'^the internet is reachable$') {->
    def online = "true"
    def forceOffline = forceOffline ?: "false"
    initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, serviceUrlEnv, FAKE_JDK_PATH)
}

Given(~'^forced offline mode is enabled$') {->
    def online = "false"
    def forceOffline = "true"
    initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, serviceUrlEnv, FAKE_JDK_PATH)
}

private initialiseEnvironment(gvmBaseEnv, gvmDirEnv, online, forceOffline, serviceUrlEnv, javaHome){
    bash = new BashEnv(gvmBaseEnv, [GVM_DIR: gvmDirEnv, GVM_ONLINE:online, GVM_FORCE_OFFLINE: forceOffline, GVM_SERVICE: serviceUrlEnv, JAVA_HOME: javaHome])
    bash.start()
    bash.execute("source $gvmDirEnv/bin/gvm-init.sh")
}