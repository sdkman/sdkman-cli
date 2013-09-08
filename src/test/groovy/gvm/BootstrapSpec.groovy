package gvm

import spock.lang.Specification

import static gvm.TestUtils.prepareBaseDir

class BootstrapSpec extends Specification {

    CurlStub curlStub
    BashEnv bash

    File gvmBaseDir
    String gvmBaseEnv

    void setup(){
        gvmBaseDir = prepareBaseDir()
        gvmBaseEnv = gvmBaseDir.absolutePath

        curlStub = CurlStub.prepareIn(new File(gvmBaseDir, "bin"))
        curlStub.primeWith("echo x.y.b")

        bash = GvmBashEnvBuilder
                .create(gvmBaseDir, curlStub)
                .build()

        bash.start()
    }

    void "should set gvm version"(){
        given:
        def bootstrap = "${gvmBaseDir.absolutePath}/.gvm/bin/gvm-init.sh"
        bash.execute("source $bootstrap")

        when:
        bash.execute("gvm version")

        then:
        bash.output.contains "x.y.z"
    }

    void cleanup(){
        bash.stop()
        assert gvmBaseDir.deleteDir()
    }
}
