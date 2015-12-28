package sdkman.steps

import com.github.tomakehurst.wiremock.client.WireMock
import sdkman.support.UnixUtils
import sdkman.support.WireMockServerProvider

import static cucumber.api.groovy.Hooks.After
import static cucumber.api.groovy.Hooks.Before

HTTP_PROXY = System.getProperty("httpProxy") ?: ""
PLATFORM = UnixUtils.platform

FAKE_JDK_PATH = "/path/to/my/openjdk"
SERVICE_UP_HOST="localhost"
SERVICE_UP_PORT=8080
SERVICE_UP_URL = "http://$SERVICE_UP_HOST:$SERVICE_UP_PORT"
SERVICE_DOWN_URL = "http://localhost:0"

counter = "${(Math.random() * 10000).toInteger()}".padLeft(4, "0")

localGroovyCandidate = "/tmp/groovy-core" as File

sdkmanVersion = "x.y.z"
sdkmanVersionOutdated = "x.y.y"

sdkmanBaseEnv = "/tmp/sdkman-$counter"
sdkmanBaseDir = sdkmanBaseEnv as File

sdkmanDirEnv = "$sdkmanBaseEnv/.sdkman"
sdkmanDir = sdkmanDirEnv as File
candidatesDir = "${sdkmanDirEnv}/candidates" as File
binDir = "${sdkmanDirEnv}/bin" as File
srcDir = "${sdkmanDirEnv}/src" as File
varDir = "${sdkmanDirEnv}/var" as File
etcDir = "${sdkmanDirEnv}/etc" as File
extDir = "${sdkmanDirEnv}/ext" as File
archiveDir = "${sdkmanDirEnv}/archives" as File
tmpDir = "${sdkmanDir}/tmp" as File

broadcastFile = new File(varDir, "broadcast")
broadcastIdFile = new File(varDir, "broadcast_id")
candidatesFile = new File(varDir, "candidates")
versionTokenFile = new File(varDir, "version")
initScript = new File(binDir, "sdkman-init.sh")

bash = null

if(!binding.hasVariable("wireMock")) {
    wireMock = WireMockServerProvider.wireMockServer()
}

Before(){
    WireMock.reset()
    cleanUp()
}

private cleanUp(){
    sdkmanBaseDir.deleteDir()
    localGroovyCandidate.deleteDir()
}

After(){ scenario ->
    def output = bash?.output
    if (output) {
        scenario.write("\nOutput: \n${output}")
    }
	bash?.stop()
}