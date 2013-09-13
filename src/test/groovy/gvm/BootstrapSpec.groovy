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

    void "should set gvm version"(){
        given:
        bash = GvmBashEnvBuilder.create(gvmBaseDir).build()
        bash.start()
        bash.execute("source $bootstrap")

        when:
        bash.execute("gvm version")

        then:
        bash.output.contains "x.y.z"
    }

    void "should suggest selfupdate on new version available if no suggestive selfupdate configuration found"() {
        given:
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .build()
        bash.start()

        when:
        bash.execute("source $bootstrap", ["N"])

        then:
        bash.output.contains "A new version of GVM is available..."
        bash.output.contains "The current version is x.y.b, but you have x.y.z."
        bash.output.contains "Would you like to upgrade now?"

        then:
        bash.output.contains "Not upgrading now..."

    }

    void "should suggest selfupdate on new version available if suggestive selfupdate configuration found"() {
        given:
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withConfiguration("gvm_suggestive_selfupdate", "true")
                .build()
        bash.start()

        when:
        bash.execute("source $bootstrap", ["N"])

        then:
        bash.output.contains "A new version of GVM is available..."
        bash.output.contains "The current version is x.y.b, but you have x.y.z."
        bash.output.contains "Would you like to upgrade now?"

        then:
        bash.output.contains "Not upgrading now..."

    }

    void "should not suggest selfupdate on new version if auto selfupdate configuration found"() {
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



    void cleanup(){
        bash.stop()
        assert gvmBaseDir.deleteDir()
    }
}
