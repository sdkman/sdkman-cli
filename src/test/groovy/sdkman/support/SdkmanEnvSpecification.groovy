package sdkman.support

import sdkman.env.SdkmanBashEnvBuilder
import sdkman.stubs.CurlStub

import static sdkman.support.FilesystemUtils.prepareBaseDir

abstract class SdkmanEnvSpecification extends BashEnvSpecification {

    SdkmanBashEnvBuilder sdkmanBashEnvBuilder

    CurlStub curlStub

    File sdkmanBaseDirectory
    File sdkmanDotDirectory
    File candidatesDirectory

    String bootstrapScript

    def setup() {
        sdkmanBaseDirectory = prepareBaseDir()
        curlStub = CurlStub.prepareIn(new File(sdkmanBaseDirectory, "bin"))
        sdkmanBashEnvBuilder = SdkmanBashEnvBuilder
                .create(sdkmanBaseDirectory)
                .withCurlStub(curlStub)

        sdkmanDotDirectory = new File(sdkmanBaseDirectory, ".sdkman")
        candidatesDirectory = new File(sdkmanDotDirectory, "candidates")
        bootstrapScript = "${sdkmanDotDirectory}/bin/sdkman-init.sh"
    }

    def cleanup() {
        assert sdkmanBaseDirectory.deleteDir()
    }
}
