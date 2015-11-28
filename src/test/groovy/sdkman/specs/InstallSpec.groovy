package sdkman.specs

import java.nio.file.Files
import java.nio.file.Paths
import com.github.tomakehurst.wiremock.WireMockServer
import sdkman.env.BashEnv
import sdkman.env.CleanBashEnvBuilder
import sdkman.utils.WireMockServerProvider
import spock.lang.Specification

import static sdkman.stubs.WebServiceStub.primeEndpointWithBinary
import static sdkman.utils.FilesystemUtils.prepareBaseDir

class InstallSpec extends Specification {
    final service = "http://localhost:8080"
    BashEnv bash
    File sdkmanBaseDir
    WireMockServer wireMockServer


    void setup() {
        sdkmanBaseDir = prepareBaseDir()
        bash = CleanBashEnvBuilder.create(sdkmanBaseDir).build()
        bash.start()
        wireMockServer = WireMockServerProvider.wireMockServer()
        primeInstallScriptEndpoint()
        primeDownloadSdkmanEndpoint()
    }

    void "should install init script at bin dir"() {
        given:
        bash.execute("curl -s ${service} | bash")
        bash.resetOutput()

        when:
        bash.execute("ls ${sdkmanBaseDir.absolutePath}/.sdkman/bin")

        then:
        bash.output.contains("sdkman-init.sh")
    }

    private def primeInstallScriptEndpoint() {
        def binary = Files.readAllBytes(Paths.get("build/testScripts/install.sh"))
        primeEndpointWithBinary("/", binary)
    }

    private def primeDownloadSdkmanEndpoint() {
        def binary = Files.readAllBytes(Paths.get("build/distributions/sdkman-scripts.zip"))
        primeEndpointWithBinary("/res?platform=${getUname()}&purpose=install", binary)
    }

    private def getUname() {
        bash.execute('echo $(uname)')
        def uname = bash.output.trim()
        bash.resetOutput()
        uname
    }
}
