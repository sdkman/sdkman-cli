package sdkman.specs

import com.github.tomakehurst.wiremock.WireMockServer
import sdkman.env.BashEnv
import sdkman.env.CleanBashEnvBuilder
import sdkman.utils.WireMockServerProvider
import spock.lang.Specification

import static sdkman.stubs.WebServiceStub.primePlainFileEndpoint
import static sdkman.stubs.WebServiceStub.primeZipEndpoint
import static sdkman.utils.FilesystemUtils.prepareBaseDir

class InstallSpec extends Specification {
    final installScriptName = "install.sh"
    final sdkmanScriptsName = "sdkman-scripts.zip"
    final service = "http://localhost:8080"
    final testScriptBuildDir = "build/testScripts" as File
    final distributionsBuildDir = "build/distributions" as File
    final wiremockStaticFolder = "src/test/resources/__files/" as File
    BashEnv bash
    File sdkmanBaseDir
    WireMockServer wireMockServer


    void setup() {
        sdkmanBaseDir = prepareBaseDir()
        bash = CleanBashEnvBuilder.create(sdkmanBaseDir).build()
        bash.start()
        copyInstallRequiredFilesIntoWiremockFolder()
        wireMockServer = WireMockServerProvider.wireMockServer()
        primeInstallScriptEndpoint()
        primeDownloadSdkmanEndpoint()
    }

    void cleanup() {
        removeInstallRequiredFilesFromWiremockFolder()
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

    private def copyInstallRequiredFilesIntoWiremockFolder() {
        def installScript = "${testScriptBuildDir.absolutePath}/${installScriptName}"
        def sdkManScriptsZip = "${distributionsBuildDir.absolutePath}/${sdkmanScriptsName}"
        bash.execute("cp ${installScript} ${wiremockStaticFolder.absolutePath}")
        bash.execute("cp ${sdkManScriptsZip} ${wiremockStaticFolder.absolutePath}")
    }

    private def removeInstallRequiredFilesFromWiremockFolder() {
        bash.execute("rm -rf ${wiremockStaticFolder.absolutePath}/${installScriptName}")
        bash.execute("rm -rf ${wiremockStaticFolder.absolutePath}/${sdkmanScriptsName}")
    }

    private def primeInstallScriptEndpoint() {
        primePlainFileEndpoint("/", installScriptName)
    }

    private def primeDownloadSdkmanEndpoint() {
        primeZipEndpoint("/res?platform=${getUname()}&purpose=install", sdkmanScriptsName)
    }

    private def getUname() {
        bash.execute('echo $(uname)')
        def uname = bash.output.trim()
        bash.resetOutput()
        uname
    }
}
