package sdkman.specs

import java.nio.file.Files
import java.nio.file.Paths
import com.github.tomakehurst.wiremock.WireMockServer
import sdkman.env.BashEnv
import sdkman.env.CleanBashEnvBuilder
import sdkman.support.WireMockServerProvider
import spock.lang.Specification

import static sdkman.stubs.WebServiceStub.primeEndpointWithBinary
import static sdkman.stubs.WebServiceStub.primeEndpointWithString
import static sdkman.support.FilesystemUtils.prepareBaseDir

class InstallSpec extends Specification {

    final service = "http://localhost:8080"
    WireMockServer wireMockServer

    BashEnv bash
    File sdkmanBaseDirectory

    void setup() {
        sdkmanBaseDirectory = prepareBaseDir()
        bash = CleanBashEnvBuilder.create(sdkmanBaseDirectory).build()
        bash.start()
        wireMockServer = WireMockServerProvider.wireMockServer()
        primeInstallScriptEndpoint()
        primeDownloadSdkmanEndpoint()
    }

    void "should install init script at bin dir"() {
        given:
        def sdkmanBinFolder = new File(sdkmanBaseDirectory, ".sdkman/bin")
        def sdkmanInitScript = new File(sdkmanBinFolder, "sdkman-init.sh")

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        sdkmanBinFolder.exists()
        sdkmanInitScript.exists()
    }

    void "should skip installation if SDKMAN has been already installed"() {
        given:
        new File(sdkmanBaseDirectory, ".sdkman").mkdirs()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains('You already have SDKMAN installed')
    }

    void "should store version in var/version file"() {
        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.execute("cat ${sdkmanBaseDirectory}/.sdkman/var/version")
        bash.output.trim() == 'x.y.z'
    }

    void "should update existing bash_profile when sdkman snippet is not present"() {
        given:
        new File(sdkmanBaseDirectory, ".bash_profile").createNewFile()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Updated existing ${sdkmanBaseDirectory}/.bash_profile")
        bash.execute("cat ${sdkmanBaseDirectory}/.bash_profile")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should skip updating existing bash_profile when sdkman snippet is present"() {
        given:
        def file = new File(sdkmanBaseDirectory, ".bash_profile")
        file.createNewFile()
        file.write "sdkman-init.sh"

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        !bash.output.contains("Updated existing ${sdkmanBaseDirectory}/.bash_profile")
    }

    void "should update existing profile when sdkman snippet is not present"() {
        given:
        new File(sdkmanBaseDirectory, ".profile").createNewFile()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Updated existing ${sdkmanBaseDirectory}/.profile")
        bash.execute("cat ${sdkmanBaseDirectory}/.profile")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should skip updating existing profile when sdkman snippet is present"() {
        given:
        def file = new File(sdkmanBaseDirectory, ".profile")
        file.createNewFile()
        file.write "sdkman-init.sh"

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        !bash.output.contains("Updated existing ${sdkmanBaseDirectory}/.profile")
    }

    void "should update existing bashrc when sdkman snippet is not present"() {
        given:
        new File(sdkmanBaseDirectory, ".bashrc").createNewFile()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Updated existing ${sdkmanBaseDirectory}/.bashrc")
        bash.execute("cat ${sdkmanBaseDirectory}/.bashrc")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should skip updating existing bashrc when sdkman snippet is present"() {
        given:
        def file = new File(sdkmanBaseDirectory, ".bashrc")
        file.createNewFile()
        file.write "sdkman-init.sh"

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        !bash.output.contains("Updated existing ${sdkmanBaseDirectory}/.bashrc")
    }

    void "should update existing zshrc when sdkman snippet is not present"() {
        given:
        new File(sdkmanBaseDirectory, ".zshrc").createNewFile()

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Updated existing ${sdkmanBaseDirectory}/.zshrc")
        bash.execute("cat ${sdkmanBaseDirectory}/.zshrc")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should skip updating existing zshrc when sdkman snippet is present"() {
        given:
        def file = new File(sdkmanBaseDirectory, ".zshrc")
        file.createNewFile()
        file.write "sdkman-init.sh"

        when:
        bash.execute("curl -s ${service} | bash")

        then:
        !bash.output.contains("Updated existing ${sdkmanBaseDirectory}/.zshrc")
    }

    void "should create bash_profile when not present"() {
        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Created and initialised ${sdkmanBaseDirectory}/.bash_profile")
        bash.execute("cat ${sdkmanBaseDirectory}/.bash_profile")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should create bashrc when not present"() {
        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Created and initialised ${sdkmanBaseDirectory}/.bashrc")
        bash.execute("cat ${sdkmanBaseDirectory}/.bashrc")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void "should create zshrc when not present"() {
        when:
        bash.execute("curl -s ${service} | bash")

        then:
        bash.output.contains("Created and initialised ${sdkmanBaseDirectory}/.zshrc")
        bash.execute("cat ${sdkmanBaseDirectory}/.zshrc")
        bash.output.contains('#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!')
    }

    void cleanup(){
        println bash.output
        bash.stop()
        assert sdkmanBaseDirectory.deleteDir()
    }

    private static primeInstallScriptEndpoint() {
        primeEndpointWithString("/", ("build/testScripts/install.sh" as File).text)
    }

    private primeDownloadSdkmanEndpoint() {
        def binary = Files.readAllBytes(Paths.get("build/distributions/sdkman-scripts.zip"))
        primeEndpointWithBinary("/res?platform=${determineUname()}&purpose=install", binary)
    }

    private determineUname() {
        bash.execute('echo $(uname)')
        def uname = bash.output.trim()
        bash.resetOutput()
        uname
    }
}
