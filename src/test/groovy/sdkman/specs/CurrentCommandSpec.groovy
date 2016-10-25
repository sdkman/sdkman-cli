package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

import java.nio.file.Paths

import static java.nio.file.Files.createSymbolicLink

class CurrentCommandSpec extends SdkmanEnvSpecification {

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

        curlStub.primeWith("http://localhost:8080/app/cliversion", "echo x.y.z").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withOfflineMode(false)
                .withAvailableCandidates(allCandidates)
                .withCandidates(installedCandidates.keySet().toList())
                .withVersionFile("x.y.z")
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
