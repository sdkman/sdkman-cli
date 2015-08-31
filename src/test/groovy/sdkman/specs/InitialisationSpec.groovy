package sdkman.specs

import sdkman.env.BashEnv
import sdkman.env.SdkManBashEnvBuilder
import sdkman.stubs.CurlStub
import spock.lang.Specification

import static sdkman.utils.TestUtils.prepareBaseDir

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
        def candidates = [
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
                .withAvailableCandidates(candidates)
                .withCandidates(candidates)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.z")
                .build()
        bash.start()
        bash.execute("source $bootstrap")
        bash.resetOutput()

        when: 'obtaining and parsing PATH'
        bash.execute('echo $PATH')
        def pathParts = bash.output.split(':')
        def pathElementMatcher = ~/$sdkmanDotDir\/([^\/]+)\/.*/
        def includedCandidates = pathParts
                .collect { it =~ pathElementMatcher }
                .findAll { it }
                .collect { it[0][1] }

        then:
        def missingCandidates = (candidates - includedCandidates)
        missingCandidates.empty
    }

    void cleanup(){
        println bash.output
        bash.stop()
        assert sdkmanBaseDir.deleteDir()
    }
}
