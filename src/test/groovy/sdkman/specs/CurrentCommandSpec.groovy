package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

import java.nio.file.Paths

import static java.nio.file.Files.createSymbolicLink

class CurrentCommandSpec extends SdkmanEnvSpecification {

    static final CANDIDATES_API = "http://localhost:8080/2"
    static final BROADCAST_API_LATEST_ID_ENDPOINT = "$CANDIDATES_API/broadcast/latest/id"

    def setup() {
        curlStub.primeWith(BROADCAST_API_LATEST_ID_ENDPOINT, "echo dbfb025be9f97fda2052b5febcca0155")
    }

    void "should display current version of all candidates installed"() {
        given:
        def installedCandidates = [
                "gradle": "2.7",
                "groovy": "2.4.4",
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

        bash = sdkmanBashEnvBuilder
                .withOfflineMode(false)
                .withVersionCache("5.0.0")
                .withCandidates(installedCandidates.keySet().toList())
                .build()

        prepareFoldersFor(installedCandidates)

        bash.start()
        bash.execute("source $bootstrapScript")

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
            def candidateVersionDirectory = "$candidatesDirectory/$candidate/$version"
            def candidateVersionBinDirectory = "$candidateVersionDirectory/bin"
            new File(candidateVersionBinDirectory).mkdirs()
            def candidateVersionPath = Paths.get(candidateVersionDirectory)
            def symlink = Paths.get("$candidatesDirectory/$candidate/current")
            createSymbolicLink(symlink, candidateVersionPath)
        }
    }

}
