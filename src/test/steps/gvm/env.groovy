package gvm

import com.github.tomakehurst.wiremock.WireMockServer
import com.github.tomakehurst.wiremock.client.WireMock

import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig
import static cucumber.api.groovy.Hooks.After
import static cucumber.api.groovy.Hooks.Before

HTTP_PROXY = System.getProperty("httpProxy") ?: ""

FAKE_JDK_PATH = "/path/to/my/openjdk"
SERVICE_UP_HOST="localhost"
SERVICE_UP_PORT=8081
SERVICE_UP_URL = "http://$SERVICE_UP_HOST:$SERVICE_UP_PORT"
SERVICE_DOWN_URL = "http://localhost:0"

counter = "${(Math.random() * 10000).toInteger()}".padLeft(4, "0")

localGroovyCandidate = "/tmp/groovy-core" as File

gvmVersion = "x.y.z"
gvmVersionOutdated = "x.y.y"

gvmBaseEnv = "/tmp/gvm-$counter"
gvmBaseDir = gvmBaseEnv as File

gvmDirEnv = "$gvmBaseEnv/.gvm"
gvmDir = gvmDirEnv as File
binDir = "${gvmDirEnv}/bin" as File
srcDir = "${gvmDirEnv}/src" as File
varDir = "${gvmDirEnv}/var" as File
etcDir = "${gvmDirEnv}/etc" as File
extDir = "${gvmDirEnv}/ext" as File
archiveDir = "${gvmDirEnv}/archives" as File
tmpDir = "${gvmDir}/tmp" as File

broadcastFile = new File(varDir, "broadcast")
candidatesFile = new File(varDir, "candidates")
versionTokenFile = new File(varDir, "version")
initScript = new File(binDir, "gvm-init.sh")

bash = null

if(!binding.hasVariable("wireMock")) {
    wireMock = new WireMockServer(wireMockConfig().port(SERVICE_UP_PORT))
    wireMock.start()
    WireMock.configureFor(SERVICE_UP_HOST, SERVICE_UP_PORT)
}

Before(){
    WireMock.reset()
    cleanUp()
}

private cleanUp(){
    gvmBaseDir.deleteDir()
    localGroovyCandidate.deleteDir()
}

After(){ scenario ->
    def output = bash?.output
    if (output) {
        scenario.write("\nOutput: \n${output}")
    }
	bash?.stop()
}