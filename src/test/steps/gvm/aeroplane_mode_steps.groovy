package gvm

import static cucumber.api.groovy.EN.*

final SERVICE_DOWN = "http://localhost:0"
final FAKE_JDK_PATH = "/path/to/my/openjdk"

Given(~'^the internet is not reachable$') {->
    bash = new BashEnv(gvmBaseEnv, [GVM_DIR: gvmDirEnv, GVM_SERVICE: SERVICE_DOWN, JAVA_HOME: FAKE_JDK_PATH])
    bash.start()
    bash.execute("source $binDir/gvm-init.sh")
}


And(~'^the internet is reachable$') {->
    bash = new BashEnv(gvmBaseEnv, [GVM_DIR: gvmDirEnv, GVM_SERVICE: serviceUrlEnv, JAVA_HOME: FAKE_JDK_PATH])
    bash.start()
    bash.execute("source $binDir/gvm-init.sh")
}
