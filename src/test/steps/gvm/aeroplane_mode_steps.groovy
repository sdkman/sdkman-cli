package gvm

import static cucumber.api.groovy.EN.*

final SERVICE_DOWN = "http://localhost:0"
final FAKE_JDK_PATH = "/path/to/my/openjdk"

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