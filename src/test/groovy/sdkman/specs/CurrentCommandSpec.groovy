package sdkman.specs

import sdkman.env.BashEnv
import sdkman.env.SdkManBashEnvBuilder
import sdkman.stubs.CurlStub
import spock.lang.Specification

import java.nio.file.Paths

import static java.nio.file.Files.createSymbolicLink
import static sdkman.utils.TestUtils.prepareBaseDir

class CurrentCommandSpec extends Specification {

    BashEnv bash
    CurlStub curlStub

    File sdkmanBaseDir
    String sdkmanDotDir
    String bootstrap

    void setup() {
        sdkmanBaseDir = prepareBaseDir()
        sdkmanDotDir = "${sdkmanBaseDir.absolutePath}/.sdkman"
        bootstrap = "${sdkmanDotDir}/bin/sdkman-init.sh"
        curlStub = CurlStub.prepareIn(new File(sdkmanBaseDir, "bin"))
    }

    void "should display current version of all candidates installed"() {
        given:
        def installedCandidates = [
                "gradle" : "2.7",
                "groovy" : "2.4.4",
                "vertx" : "3.0.0"
        ]
        def longAvailableCandidateList = [
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
                .withAvailableCandidates(longAvailableCandidateList)
                .withCandidates(installedCandidates.keySet().toList())
                .withVersionToken("x.y.z")
                .build()

        prepareFoldersFor(installedCandidates)

        bash.start()
        bash.execute("source $bootstrap")
        bash.resetOutput()

        when:
        bash.execute('sdk current')

        then:
        bash.output.contains("Using:")
        bash.output.contains("groovy: 2.4.4")
        bash.output.contains("gradle: 2.7")
        bash.output.contains("vertx: 3.0.0")
    }

    private prepareFoldersFor(Map installedCandidates) {
        installedCandidates.forEach { candidate, version ->
            def candidateVersionDir = "$sdkmanDotDir/$candidate/$version"
            def candidateVersionPath = Paths.get(candidateVersionDir)
            def symlink = Paths.get("$sdkmanDotDir/$candidate/current")
            new File(candidateVersionDir).mkdirs()
            createSymbolicLink(symlink, candidateVersionPath)
        }
    }
}
