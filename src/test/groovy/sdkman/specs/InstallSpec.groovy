package sdkman.specs

import java.nio.file.Files
import java.nio.file.Paths
import com.github.tomakehurst.wiremock.WireMockServer
import sdkman.env.BashEnv
import sdkman.env.CleanBashEnvBuilder
import sdkman.utils.WireMockServerProvider
import spock.lang.Specification

import static sdkman.stubs.WebServiceStub.primeEndpointWithBinary
import static sdkman.stubs.WebServiceStub.primeEndpointWithString
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

    void cleanup(){
        println bash.output
        bash.stop()
        assert sdkmanBaseDir.deleteDir()
    }

    void "should install init script at bin dir"() {
        given:
        def sdkmanBinFolder = new File(sdkmanBaseDir, ".sdkman/bin")
        def sdkmanInitScript = new File(sdkmanBinFolder, "sdkman-init.sh")

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        sdkmanBinFolder.exists()
        sdkmanInitScript.exists()
    }

    void "should skip installation if SDKMAN has been already installed"() {
        given:
        new File(sdkmanBaseDir, ".sdkman").mkdirs()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains('You already have SDKMAN installed')
    }

    void "should store version in var/version file"() {
        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.execute("cat ${sdkmanBaseDir}/.sdkman/var/version")
        bash.output.trim() == 'x.y.z'
    }

    void "should update existing bash_profile when sdkman snippet is not present"() {
        given:
        new File(sdkmanBaseDir, ".bash_profile").createNewFile()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Updated existing ${sdkmanBaseDir}/.bash_profile")
        bash.execute("cat ${sdkmanBaseDir}/.bash_profile")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should skip updating existing bash_profile when sdkman snippet is present"() {
        given:
        def file = new File(sdkmanBaseDir, ".bash_profile")
        file.createNewFile()
        file.write "sdkman-init.sh"

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        !bash.output.contains("Updated existing ${sdkmanBaseDir}/.bash_profile")
    }

    void "should update existing profile when sdkman snippet is not present"() {
        given:
        new File(sdkmanBaseDir, ".profile").createNewFile()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Updated existing ${sdkmanBaseDir}/.profile")
        bash.execute("cat ${sdkmanBaseDir}/.profile")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should skip updating existing profile when sdkman snippet is present"() {
        given:
        def file = new File(sdkmanBaseDir, ".profile")
        file.createNewFile()
        file.write "sdkman-init.sh"

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        !bash.output.contains("Updated existing ${sdkmanBaseDir}/.profile")
    }

    void "should update existing bashrc when sdkman snippet is not present"() {
        given:
        new File(sdkmanBaseDir, ".bashrc").createNewFile()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Updated existing ${sdkmanBaseDir}/.bashrc")
        bash.execute("cat ${sdkmanBaseDir}/.bashrc")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should skip updating existing bashrc when sdkman snippet is present"() {
        given:
        def file = new File(sdkmanBaseDir, ".bashrc")
        file.createNewFile()
        file.write "sdkman-init.sh"

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        !bash.output.contains("Updated existing ${sdkmanBaseDir}/.bashrc")
    }

    void "should update existing zshrc when sdkman snippet is not present"() {
        given:
        new File(sdkmanBaseDir, ".zshrc").createNewFile()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Updated existing ${sdkmanBaseDir}/.zshrc")
        bash.execute("cat ${sdkmanBaseDir}/.zshrc")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should skip updating existing zshrc when sdkman snippet is present"() {
        given:
        def file = new File(sdkmanBaseDir, ".zshrc")
        file.createNewFile()
        file.write "sdkman-init.sh"

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        !bash.output.contains("Updated existing ${sdkmanBaseDir}/.zshrc")
    }

    void "should create bash_profile when not present"() {
        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Created and initialised ${sdkmanBaseDir}/.bash_profile")
        bash.execute("cat ${sdkmanBaseDir}/.bash_profile")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should create bashrc when not present"() {
        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Created and initialised ${sdkmanBaseDir}/.bashrc")
        bash.execute("cat ${sdkmanBaseDir}/.bashrc")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should create zshrc when not present"() {
        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Created and initialised ${sdkmanBaseDir}/.zshrc")
        bash.execute("cat ${sdkmanBaseDir}/.zshrc")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    private static primeInstallScriptEndpoint() {
        primeEndpointWithString("/", ("build/testScripts/install.sh" as File).text)
    }

    private primeDownloadSdkmanEndpoint() {
        def binary = Files.readAllBytes(Paths.get("build/distributions/sdkman-scripts.zip"))
        primeEndpointWithBinary("/res?platform=${getUname()}&purpose=install", binary)
    }

    private getUname() {
        bash.execute('echo $(uname)')
        def uname = bash.output.trim()
        bash.resetOutput()
        uname
    }
}
