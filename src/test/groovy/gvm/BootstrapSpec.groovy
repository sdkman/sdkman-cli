package gvm

import spock.lang.Specification

import static gvm.TestUtils.prepareBaseDir

class BootstrapSpec extends Specification {

    CurlStub curlStub
    BashEnv bash

    File gvmBaseDir
    String gvmBaseEnv
    String bootstrap

    void setup(){
        gvmBaseDir = prepareBaseDir()
        gvmBaseEnv = gvmBaseDir.absolutePath
        bootstrap = "${gvmBaseDir.absolutePath}/.gvm/bin/gvm-init.sh"
        curlStub = CurlStub.prepareIn(new File(gvmBaseDir, "bin"))
    }

    void "should suggest selfupdate on affirmative suggestive selfupdate configuration"() {

        given: 'a working gvm installation with suggestive selfupdate and curl stub primed for version update'
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withConfiguration("gvm_suggestive_selfupdate", "true")
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

    void "should not suggest selfupdate on negative suggestive selfupdate configuration"(){

        given: 'a working gvm installation with suggestive selfupdate and curl stub primed for version update'
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withConfiguration("gvm_suggestive_selfupdate", "false")
                .build()
        bash.start()

        when: 'bootstrap the system answering no to selfupdate'
        bash.execute("source $bootstrap")

        then: 'no prompt for upgrade is presented'
        ! bash.output.contains("A new version of GVM is available...")
        ! bash.output.contains("The current version is x.y.b, but you have x.y.z.")
    }

    void "should perform upgrade on affirmative auto selfupdate configuration"() {
        given:
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withConfiguration("gvm_auto_selfupdate", "true")
                .withConfiguration("gvm_suggestive_selfupdate", "true")
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

    void "should not suggest selfupdate on negative auto selfupdate configuration"(){

        given: 'a working gvm installation with auto selfupdate and curl stub primed for version update'
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withConfiguration("gvm_auto_selfupdate", "false")
                .build()
        bash.start()

        when: 'bootstrap the system answering no to selfupdate'
        bash.execute("source $bootstrap")

        then: 'no prompt for upgrade is presented'
        ! bash.output.contains("A new version of GVM is available...")
        ! bash.output.contains("The current version is x.y.b, but you have x.y.z.")
    }

    void cleanup(){
        bash.stop()
        assert gvmBaseDir.deleteDir()
    }
}
