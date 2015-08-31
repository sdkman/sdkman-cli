package gvm.specs

import com.github.tomakehurst.wiremock.WireMockServer
import gvm.env.BashEnv
import gvm.env.GvmBashEnvBuilder
import gvm.stubs.CurlStub
import spock.lang.Specification

import java.nio.file.Files
import java.nio.file.Paths

import static gvm.stubs.WebServiceStub.primeEndpoint
import static gvm.stubs.WebServiceStub.primeSelfupdate
import static gvm.utils.TestUtils.prepareBaseDir

class CurrentCommandSpec extends Specification {

    BashEnv bash
    CurlStub curlStub

    File gvmBaseDir
    String gvmDotDir
    String bootstrap

    void setup() {
        gvmBaseDir = prepareBaseDir()
        gvmDotDir = "${gvmBaseDir.absolutePath}/.gvm"
        bootstrap = "${gvmDotDir}/bin/gvm-init.sh"
        curlStub = CurlStub.prepareIn(new File(gvmBaseDir, "bin"))
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
        bash = GvmBashEnvBuilder
                .create(gvmBaseDir)
                .withCurlStub(curlStub)
                .withAvailableCandidates(longAvailableCandidateList)
                .withCandidates(installedCandidates.keySet().toList())
                .withVersionToken("x.y.z")
                .build()

        installedCandidates.each { candidate, version ->
            def candidateVersionDir = "$gvmDotDir/$candidate/$version"
            def candidateVersionPath = Paths.get(candidateVersionDir)
            def symlink = Paths.get("$gvmDotDir/$candidate/current")
            new File(candidateVersionDir).mkdirs()
            Files.createSymbolicLink(symlink, candidateVersionPath)
        }

        bash.start()
        bash.execute("source $bootstrap")
        bash.resetOutput()

        when:
        bash.execute('gvm current')

        then:
        bash.output.contains("Using:")
        bash.output.contains("groovy: 2.4.4")
        bash.output.contains("gradle: 2.7")
        bash.output.contains("vertx: 3.0.0")
    }
}
