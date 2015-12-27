package sdkman.specs

import sdkman.env.BashEnv
import sdkman.stubs.CurlStub
import sdkman.env.SdkManBashEnvBuilder
import spock.lang.Specification

import static sdkman.support.FilesystemUtils.prepareBaseDir

class BootstrapSpec extends Specification {

    CurlStub curlStub
    BashEnv bash

    File sdkmanBaseDir
    String sdkmanBaseEnv
    String bootstrap
    String versionToken

    void setup(){
        sdkmanBaseDir = prepareBaseDir()
        sdkmanBaseEnv = sdkmanBaseDir.absolutePath
        bootstrap = "${sdkmanBaseDir.absolutePath}/.sdkman/bin/sdkman-init.sh"
        versionToken = "${sdkmanBaseDir.absolutePath}/.sdkman/var/version"
        curlStub = CurlStub.prepareIn(new File(sdkmanBaseDir, "bin"))
    }

    void "should store version token if not exists"() {

        given: 'a working sdkman installation without version token'
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDir)
                .withCurlStub(curlStub)
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        versionFile.exists()
    }

    void "should not query server if token is found"() {
        given: 'a working sdkman installation with version token'
        def versionFile = new File(versionToken)
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDir)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.z")
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        versionFile.exists()
        versionFile.text.contains("x.y.z")
    }

    void "should query server for version and refresh if token is older than a day"() {
        given: 'a working sdkman installation with expired version token'
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDir)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.a")
                .build()
        def twoDaysAgoInMillis = System.currentTimeMillis() - 172800000
        versionFile.setLastModified(twoDaysAgoInMillis)
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        versionFile.exists()
        versionFile.text.contains("x.y.b")
    }

    void "should ignore version if api is offline"(){
        given: 'a working sdkman installation with api down'
        def sdkmanVersion = "x.y.z"
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo ''").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDir)
                .withCurlStub(curlStub)
                .withVersionToken(sdkmanVersion)
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        versionFile.text.contains(sdkmanVersion)
    }

    void "should not go offline if curl times out"(){
        given: 'a working sdkman installation with api down'
        curlStub.primeWith("http://localhost:8080/app/version", "echo ''").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDir)
                .withCurlStub(curlStub)
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        ! bash.output.contains("SDKMAN can't reach the internet so going offline.")
    }

    void "should ignore version if api returns garbage"(){
        given: 'a working sdkman installation with garbled api'
        def sdkmanVersion = "x.y.z"
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo '<html><title>sorry</title></html>'").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDir)
                .withCurlStub(curlStub)
                .withVersionToken(sdkmanVersion)
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        versionFile.text.contains sdkmanVersion
    }

    void cleanup(){
        println bash.output
        bash.stop()
        assert sdkmanBaseDir.deleteDir()
    }
}
