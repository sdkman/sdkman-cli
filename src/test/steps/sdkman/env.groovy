package sdkman

import com.github.tomakehurst.wiremock.WireMockServer
import com.github.tomakehurst.wiremock.client.WireMock

import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig
import static cucumber.api.groovy.Hooks.After
import static cucumber.api.groovy.Hooks.Before

HTTP_PROXY = System.getProperty("httpProxy") ?: ""

FAKE_JDK_PATH = "/path/to/my/openjdk"
SERVICE_UP_HOST="localhost"
SERVICE_UP_PORT=8080
SERVICE_UP_URL = "http://$SERVICE_UP_HOST:$SERVICE_UP_PORT"
SERVICE_DOWN_URL = "http://localhost:0"

counter = "${(Math.random() * 10000).toInteger()}".padLeft(4, "0")

localGroovyCandidate = "/tmp/groovy-core" as File

sdkManVersion = "x.y.z"
sdkManVersionOutdated = "x.y.y"

sdkManBaseEnv = "/tmp/sdkman-$counter"
sdkManBaseDir = sdkManBaseEnv as File

sdkManDirEnv = "$sdkManBaseEnv/.sdkman"
sdkManDir = sdkManDirEnv as File
binDir = "${sdkManDirEnv}/bin" as File
srcDir = "${sdkManDirEnv}/src" as File
varDir = "${sdkManDirEnv}/var" as File
etcDir = "${sdkManDirEnv}/etc" as File
extDir = "${sdkManDirEnv}/ext" as File
archiveDir = "${sdkManDirEnv}/archives" as File
tmpDir = "${sdkManDir}/tmp" as File

broadcastFile = new File(varDir, "broadcast")
broadcastIdFile = new File(varDir, "broadcast_id")
candidatesFile = new File(varDir, "candidates")
versionTokenFile = new File(varDir, "version")
initScript = new File(binDir, "sdkman-init.sh")

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
    sdkManBaseDir.deleteDir()
    localGroovyCandidate.deleteDir()
}

After(){ scenario ->
    def output = bash?.output
    if (output) {
        scenario.write("\nOutput: \n${output}")
    }
	bash?.stop()
}