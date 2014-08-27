package gvm.specs

import gvm.env.BashEnv
import gvm.stubs.CurlStub
import gvm.env.GvmBashEnvBuilder
import spock.lang.Specification

import static gvm.utils.TestUtils.prepareBaseDir

class BootstrapSpec extends Specification {

    CurlStub curlStub
    BashEnv bash

    File gvmBaseDir
    String gvmBaseEnv
    String bootstrap
    String versionToken

    void setup(){
        gvmBaseDir = prepareBaseDir()
        gvmBaseEnv = gvmBaseDir.absolutePath
        bootstrap = "${gvmBaseDir.absolutePath}/.gvm/bin/gvm-init.sh"
        versionToken = "${gvmBaseDir.absolutePath}/.gvm/var/version"
        curlStub = CurlStub.prepareIn(new File(gvmBaseDir, "bin"))
    }

    void "should store version token if not exists"() {

        given: 'a working gvm installation without version token'
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        versionFile.exists()
    }

    void "should not query server if token is found"() {
        given: 'a working gvm installation with version token'
        def versionFile = new File(versionToken)
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
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
        given: 'a working gvm installation with expired version token'
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
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
        given: 'a working gvm installation with api down'
        def gvmVersion = "x.y.z"
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo ''").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withVersionToken(gvmVersion)
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        versionFile.text.contains(gvmVersion)
    }

    void "should not go offline if curl times out"(){
        given: 'a working gvm installation with api down'
        curlStub.primeWith("http://localhost:8080/app/version", "echo ''").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        ! bash.output.contains("GVM can't reach the internet so going offline.")
    }

    void "should ignore version if api returns garbage"(){
        given: 'a working gvm installation with garbled api'
        def gvmVersion = "x.y.z"
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo '<html><title>sorry</title></html>'").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withVersionToken(gvmVersion)
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        versionFile.text.contains gvmVersion
    }

    void cleanup(){
        println bash.output
        bash.stop()
        assert gvmBaseDir.deleteDir()
    }
}
