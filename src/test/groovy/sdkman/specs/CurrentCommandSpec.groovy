package sdkman.specs

import sdkman.env.BashEnv
import sdkman.env.SdkManBashEnvBuilder
import sdkman.stubs.CurlStub
import spock.lang.Specification

import java.nio.file.Paths

import static java.nio.file.Files.createSymbolicLink
import static sdkman.utils.FilesystemUtils.prepareSdkmanDir

class CurrentCommandSpec extends Specification {

    BashEnv bash
    CurlStub curlStub

    File sdkmanBaseDir
    String sdkmanDotDir
    String bootstrap
    String candidatesDir

    void setup() {
        sdkmanBaseDir = prepareSdkmanDir()
        sdkmanDotDir = "${sdkmanBaseDir.absolutePath}/.sdkman"
        bootstrap = "${sdkmanDotDir}/bin/sdkman-init.sh"
        candidatesDir = "${sdkmanDotDir}/candidates"
        curlStub = CurlStub.prepareIn(new File(sdkmanBaseDir, "bin")).build()
    }

    void "should display current version of all candidates installed"() {
        given:
        def installedCandidates = [
                "gradle" : "2.7",
                "groovy" : "2.4.4",
                "vertx" : "3.0.0"
        ]
        def allCandidates = [
                "asciidoctorj",
                "crash",
                "gaiden",
                "glide",
                "gradle",
                "grails",
                "griffon",
                "groovy",
                "groovyserv",
                "jbake",
                "jbossforge",
                "lazybones",
                "springboot",
                "vertx"
        ]
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDir)
                .withCurlStub(curlStub)
                .withOnlineMode(true)
                .withForcedOfflineMode(false)
                .withAvailableCandidates(allCandidates)
                .withCandidates(installedCandidates.keySet().toList())
                .withVersionToken("x.y.z")
                .build()

        prepareFoldersFor(installedCandidates)

        bash.start()
        bash.execute("source $bootstrap")

        when:
        bash.execute('sdk current')

        then:
        bash.output.contains("Using:")
        bash.output.contains("groovy: 2.4.4")
        bash.output.contains("gradle: 2.7")
        bash.output.contains("vertx: 3.0.0")
    }

    void cleanup() {
        bash.stop()
        assert sdkmanBaseDir.deleteDir()
    }

    private prepareFoldersFor(Map installedCandidates) {
        installedCandidates.forEach { candidate, version ->
            def candidateVersionDir = "$candidatesDir/$candidate/$version"
            def candidateVersionBinDir = "$candidateVersionDir/bin"
            new File(candidateVersionBinDir).mkdirs()
            def candidateVersionPath = Paths.get(candidateVersionDir)
            def symlink = Paths.get("$candidatesDir/$candidate/current")
            createSymbolicLink(symlink, candidateVersionPath)
        }
    }

}
