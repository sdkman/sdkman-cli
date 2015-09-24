package sdkman.specs

import sdkman.env.BashEnv
import sdkman.env.SdkManBashEnvBuilder
import sdkman.stubs.CurlStub
import spock.lang.Specification

import java.nio.file.Files
import java.nio.file.Paths

import static sdkman.utils.FilesystemUtils.prepareBaseDir

class InitialisationSpec extends Specification {

    CurlStub curlStub
    BashEnv bash

    File sdkmanBaseDir
    String sdkmanDotDir
    String bootstrap

    void setup(){
        sdkmanBaseDir = prepareBaseDir()
        sdkmanDotDir = "${sdkmanBaseDir.absolutePath}/.sdkman"
        bootstrap = "${sdkmanDotDir}/bin/sdkman-init.sh"
        curlStub = CurlStub.prepareIn(new File(sdkmanBaseDir, "bin"))
    }

    void "should include all candidates in PATH"(){
        given: 'a working sdkman installation with many candidates'
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
                .withAvailableCandidates(allCandidates)
                .withCandidates(allCandidates)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.z")
                .build()

        and:
        allCandidates.forEach {
            def current = Paths.get("$sdkmanDotDir/$it/current")
            def targetFilename = "$sdkmanDotDir/$it/xxx"

            new File(targetFilename).createNewFile()
            def target = Paths.get(targetFilename)

            Files.createSymbolicLink(current, target)
        }

        bash.start()
        bash.execute("source $bootstrap")
        bash.resetOutput()

        when: 'obtaining and parsing PATH'
        bash.execute('echo $PATH')
        def pathParts = bash.output.split(':')
        def pathElementMatcher = ~/$sdkmanDotDir\/([^\/]+)\/.*/
        def includedCandidates = pathParts
                .collect { it.replace("\n", "")}
                .collect { it =~ pathElementMatcher }
                .findAll { it }
                .collect { it[0][1] }
                .sort()

        println("Available: $allCandidates")
        println("Included : $includedCandidates")

        and:
        def missingCandidates = allCandidates - includedCandidates

        then:
        missingCandidates.isEmpty()
    }

    void cleanup(){
        println bash.output
        bash.stop()
        assert sdkmanBaseDir.deleteDir()
    }
}
