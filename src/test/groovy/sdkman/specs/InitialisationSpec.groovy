package sdkman.specs

import sdkman.env.BashEnv
import sdkman.env.SdkManBashEnvBuilder
import sdkman.stubs.CurlStub
import spock.lang.Specification

import java.nio.file.Files
import java.nio.file.Paths

import static sdkman.utils.FilesystemUtils.prepareSdkmanDir

class InitialisationSpec extends Specification {

    static final allCandidates = ["asciidoctorj", "crash", "gaiden", "glide", "gradle", "grails", "griffon", "groovy",
                                  "groovyserv", "jbake", "jbossforge", "lazybones", "springboot", "vertx"]

    CurlStub curlStub
    BashEnv bash

    File sdkmanBaseDir
    String sdkmanDotDir
    String bootstrap
    String candidatesDir

    void setup(){
        sdkmanBaseDir = prepareSdkmanDir()
        sdkmanDotDir = "${sdkmanBaseDir.absolutePath}/.sdkman"
        bootstrap = "${sdkmanDotDir}/bin/sdkman-init.sh"
        candidatesDir = "${sdkmanDotDir}/candidates"
        curlStub = CurlStub.prepareIn(new File(sdkmanBaseDir, "bin"))
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDir)
                .withAvailableCandidates(allCandidates)
                .withCandidates(allCandidates)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.z")
                .build()
        prepareCandidateDirectories(allCandidates)
    }

    void "should include all candidates in PATH"(){
        given:
        bash.start()
        bash.execute("source $bootstrap")
        bash.resetOutput()

        when:
        bash.execute('echo "$PATH"')
        def pathParts = bash.output.split(':')
        def pathElementMatcher = ~/$candidatesDir\/([^\/]+)\/.*/
        def includedCandidates = pathParts
                .collect { it.replace("\n", "")}
                .collect { it =~ pathElementMatcher }
                .findAll { it }
                .collect { it[0][1] }
                .sort()

        println("Available: ${allCandidates}")
        println("Included : $includedCandidates")

        and:
        def missingCandidates = allCandidates - includedCandidates

        then:
        missingCandidates.isEmpty()
    }

    void "should reinitialize candidates in PATH if necessary"() {
        given:
        bash.start()
        bash.execute("source $bootstrap")
        bash.resetOutput()

        when:
        def originalPath = bash.env.grep { it =~ /^PATH=/ }.first() as String
        bash.execute(originalPath)

        and:
        bash.execute("source $bootstrap")
        bash.execute('echo "$PATH"')

        def pathParts = bash.output.split(':')
        def pathElementMatcher = ~/$candidatesDir\/([^\/]+)\/.*/
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

    void "should not duplicate PATH entries if re-sourced"() {
        given:
        bash.start()
        bash.execute("source $bootstrap")
        bash.resetOutput()

        when:
        bash.execute("source $bootstrap")
        bash.execute('echo "$PATH"')

        def pathParts = bash.output.split(':')
        def pathElementMatcher = ~/$candidatesDir\/([^\/]+)\/.*/
        def includedCandidates = pathParts
                .collect { it.replace("\n", "")}
                .collect { it =~ pathElementMatcher }
                .findAll { it }
                .collect { it[0][1] }
                .sort()

        println("Available: $allCandidates")
        println("Included : $includedCandidates")

        and:
        def duplicateCandidates = includedCandidates - allCandidates

        then:
        duplicateCandidates.isEmpty()
    }

    void cleanup(){
        println bash.output
        bash.stop()
        assert sdkmanBaseDir.deleteDir()
    }

    private prepareCandidateDirectories(List candidates) {
        candidates.forEach {
            def current = Paths.get("$candidatesDir/$it/current")
            def targetFilename = "$candidatesDir/$it/xxx"

            new File(targetFilename).createNewFile()
            def target = Paths.get(targetFilename)

            Files.createSymbolicLink(current, target)
        }
    }
}
