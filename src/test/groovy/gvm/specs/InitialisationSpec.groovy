package gvm.specs

import gvm.env.BashEnv
import gvm.env.GvmBashEnvBuilder
import gvm.stubs.CurlStub
import spock.lang.Specification

import static gvm.utils.TestUtils.prepareBaseDir

class InitialisationSpec extends Specification {

    CurlStub curlStub
    BashEnv bash

    File gvmBaseDir
    String gvmDotDir
    String bootstrap

    void setup(){
        gvmBaseDir = prepareBaseDir()
        gvmDotDir = "${gvmBaseDir.absolutePath}/.gvm"
        bootstrap = "${gvmDotDir}/bin/gvm-init.sh"
        curlStub = CurlStub.prepareIn(new File(gvmBaseDir, "bin"))
    }

    void "should include all candidates in PATH"(){
        given: 'a working gvm installation with many candidates'
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
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withAvailableCandidates(allCandidates)
                .withCandidates(allCandidates)
                .withCurlStub(curlStub)
                .withVersionToken("x.y.z")
                .build()
        bash.start()
        bash.execute("source $bootstrap")
        bash.resetOutput()

        when: 'obtaining and parsing PATH'
        bash.execute('echo $PATH')
        def pathParts = bash.output.split(':')
        def pathElementMatcher = ~/$gvmDotDir\/([^\/]+)\/.*/
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
        assert gvmBaseDir.deleteDir()
    }
}
