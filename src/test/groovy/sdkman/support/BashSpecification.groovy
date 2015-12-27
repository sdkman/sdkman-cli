package sdkman.support

import sdkman.env.BashEnv
import sdkman.stubs.CurlStub
import spock.lang.Specification

import static sdkman.support.FilesystemUtils.prepareBaseDir

abstract class BashSpecification extends Specification {

    BashEnv bash
    CurlStub curlStub

    File sdkmanBaseDirectory
    File sdkmanDotDirectory
    File candidatesDirectory

    String bootstrapScript

    void setup() {
        sdkmanBaseDirectory = prepareBaseDir()
        sdkmanDotDirectory = new File(sdkmanBaseDirectory, ".sdkman")
        candidatesDirectory = new File(sdkmanDotDirectory, "candidates")
        bootstrapScript = "${sdkmanDotDirectory}/bin/sdkman-init.sh"
        curlStub = CurlStub.prepareIn(new File(sdkmanBaseDirectory, "bin"))
    }

    void cleanup() {
        println bash.output
        bash.stop()
        assert sdkmanBaseDirectory.deleteDir()
    }

}
