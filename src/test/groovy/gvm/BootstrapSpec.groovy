package gvm

import spock.lang.Specification

import static gvm.TestUtils.prepareBaseDir

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

    void "should suggest selfupdate on affirmative suggestive selfupdate configuration"() {

        given: 'a working gvm installation with suggestive selfupdate and curl stub primed for version update'
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .build()
        bash.start()

        when: 'bootstrap the system answering no to selfupdate'
        bash.execute("source $bootstrap", ["N"])

        then: 'a prompt for upgrade is presented'
        bash.output.contains "A new version of GVM is available..."
        bash.output.contains "The current version is x.y.b, but you have x.y.z."
        bash.output.contains "Would you like to upgrade now?"

        then: 'the upgrade is deferred'
        bash.output.contains "Not upgrading now..."

    }

    void "should perform upgrade on affirmative auto selfupdate configuration"() {
        given:
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withConfiguration("gvm_auto_selfupdate", "true")
                .build()
        bash.start()

        and:
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b")
                .primeWith("http://localhost:8080/selfupdate", "echo echo 'Performing selfupdate.'")
                .build()

        when:
        bash.execute("source $bootstrap")

        then:
        bash.output.contains "A new version of GVM is available..."
        bash.output.contains "The current version is x.y.b, but you have x.y.z."
        ! bash.output.contains("Would you like to upgrade now?")

        then:
        bash.output.contains("Performing selfupdate.")

    }

    void "should store version token if not exists"() {

        given: 'a working gvm installation without version token'
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withConfiguration("gvm_auto_selfupdate", "true")
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        bash.output.contains("A new version of GVM is available...")
        versionFile.exists()
    }

    void "should not query server if token is found"() {
        given: 'a working gvm installation with version token'
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.z")
                .withConfiguration("gvm_auto_selfupdate", "true")
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        ! bash.output.contains("A new version of GVM is available...")

    }

    void "should query server for version and refresh if token is older than a day"() {
        given: 'a working gvm installation with expired version token'
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.a")
                .withConfiguration("gvm_auto_selfupdate", "true")
                .build()
        def twoDaysAgoInMillis = System.currentTimeMillis() - 172800000
        versionFile.setLastModified(twoDaysAgoInMillis)
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        bash.output.contains("A new version of GVM is available...")
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
                .withConfiguration("gvm_auto_selfupdate", "true")
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        ! bash.output.contains("A new version of GVM is available...")
        versionFile.text.contains(gvmVersion)
    }

    void "should not go offline if curl times out"(){
        given: 'a working gvm installation with api down'
        def gvmVersion = "x.y.z"
        def versionFile = new File(versionToken)
        curlStub.primeWith("http://localhost:8080/app/version", "echo ''").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withConfiguration("gvm_auto_selfupdate", "true")
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        ! bash.output.contains("GVM can't reach the internet so going offline.")
    }

    void "should ignore version if api returns garbage"(){
        given: 'a working gvm installation with garbled api'
        curlStub.primeWith("http://localhost:8080/app/version", "echo <html><title>sorry</title></html>").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.z")
                .withConfiguration("gvm_auto_selfupdate", "true")
                .build()
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrap")

        then:
        ! bash.output.contains("A new version of GVM is available...")
    }

    void cleanup(){
        bash.stop()
        assert gvmBaseDir.deleteDir()
    }
}
