package sdkman.specs

import sdkman.env.BashEnv
import sdkman.env.SdkManBashEnvBuilder
import sdkman.stubs.CurlStub
import spock.lang.Specification

import static sdkman.utils.FilesystemUtils.defineSdkmanDir
import static sdkman.utils.FilesystemUtils.defineCounterForSdkmanDir
import static sdkman.utils.FilesystemUtils.prepareStubInstallDir

class InstallSpec extends Specification {
    CurlStub curlStub
    BashEnv bash
    String home
    String tmpSdkmanScriptsDir
    String stubInstallBaseDirPath

    void setup() {
        String counterForBaseDir = defineCounterForSdkmanDir()
        File stubInstallBaseDir = prepareStubInstallDir(counterForBaseDir)
        home = defineSdkmanDir(counterForBaseDir)
        stubInstallBaseDirPath = "${stubInstallBaseDir.absolutePath}"
        tmpSdkmanScriptsDir = "${stubInstallBaseDirPath}/tmpSdkmanScripts"
        curlStub = CurlStub.prepareIn(new File(stubInstallBaseDir, "bin"))
        bash = SdkManBashEnvBuilder
                .create(stubInstallBaseDir)
                .withCurlStub(curlStub)
                .withShouldEmulateInstallScript(false)
                .withHome(home)
                .build()
    }

    void "should install init script at bin dir"() {
        given:
        bash.start()
        primeDownloadSdkmanEndpoint()
        bash.execute("bash ${stubInstallBaseDirPath}/install.sh")
        bash.resetOutput()

        when:
        bash.execute("ls ${home}/.sdkman/bin")

        then:
        bash.output.contains("sdkman-init.sh")
    }

    private def primeDownloadSdkmanEndpoint() {
        def sdkmanScriptsZip = createSdkmanScriptsZip()
        curlStub.primeWith("http://localhost:8080/res?platform=${getUname()}&purpose=install", "cat ${sdkmanScriptsZip}").build()
    }

    private def createSdkmanScriptsZip() {
        def sdkmanScriptsZipPath = "${stubInstallBaseDirPath}/sdkman-scripts.zip"
        bash.execute("zip -j ${sdkmanScriptsZipPath} ${tmpSdkmanScriptsDir}/*")
        bash.execute("rm -rf ${tmpSdkmanScriptsDir}")
        sdkmanScriptsZipPath
    }

    private def getUname() {
        bash.execute('echo $(uname)')
        def uname = bash.output.trim()
        bash.resetOutput()
        uname
    }
}
