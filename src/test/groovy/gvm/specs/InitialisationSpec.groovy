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
                "vertx",
        ]
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
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
        def pathElementMatcher = ~/$gvmDotDir\/([^\/]+)\/.*/
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
        assert gvmBaseDir.deleteDir()
    }
}
