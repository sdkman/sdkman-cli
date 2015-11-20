package sdkman.specs

import sdkman.env.*
import sdkman.stubs.CurlStub
import spock.lang.Specification

import java.nio.file.Files
import java.nio.file.Paths

import static sdkman.utils.FilesystemUtils.prepareBaseDir

class SdkCompatibilitySpec extends Specification {

    File sdkmanBaseDirectory
    String sdkmanDotDirectory
    String candidatesDir
    String bootstrapScript

    CurlStub curlStub
    BashEnv bash

    def allCandidates = ["groovy", "grails", "scala", "activator"]

    void setup() {
        sdkmanBaseDirectory = prepareBaseDir()
        sdkmanDotDirectory = "${sdkmanBaseDirectory.absolutePath}/.sdkman"
        candidatesDir = "${sdkmanDotDirectory}/candidates"
        bootstrapScript = "${sdkmanDotDirectory}/bin/sdkman-init.sh"
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDirectory)
                .withAvailableCandidates(allCandidates)
                .withCandidates(allCandidates)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.z")
                .build()
    }

    void "should add candidate bin folder to the path if present"() {
        given:
        def candidateFolder = prepareCandidateFolder("scala", "2.11.7", true)

        and:
        bash.start()
        bash.execute("source $bootstrapScript")
        bash.resetOutput()

        when:
        bash.execute('echo "$PATH"')
        def pathEntries = bash.output.split(':')
        def firstPathEntry = pathEntries.first()

        then:
        firstPathEntry.contains("$candidateFolder/bin")
    }

    void "should add candidate base folder to the path if no bin folder present"() {
        given:
        def candidateFolder = prepareCandidateFolder("activator", "1.3.6", false)

        and:
        bash.start()
        bash.execute("source $bootstrapScript")
        bash.resetOutput()

        when:
        bash.execute('echo "$PATH"')
        def pathEntries = bash.output.split(':')
        def firstPathEntry = pathEntries.first()

        then:
        firstPathEntry.contains("$candidateFolder")

        and:
        ! firstPathEntry.contains("$candidateFolder/bin")
    }

    private prepareCandidateFolder(String candidate, String version, boolean hasBinFolder) {
        def candidateBaseDir = "$candidatesDir/$candidate"
        def candidateCurrentDir = Paths.get("$candidateBaseDir/current")

        def candidateLocation = "$candidatesDir/$candidate/$version"
        def candidatePath = Paths.get(candidateLocation)

        def binLocation = hasBinFolder ? "$candidateLocation/bin/" : "$candidateLocation"
        def executableFilename = "run.sh"
        def executableFile = "$binLocation/$executableFilename" as File

        new File(binLocation).mkdirs()
        executableFile.createNewFile()

        Files.createSymbolicLink(candidateCurrentDir, candidatePath)
        candidateCurrentDir.toString()
    }

    void cleanup(){
        println bash.output
        bash.stop()
        assert sdkmanBaseDirectory.deleteDir()
    }
}
