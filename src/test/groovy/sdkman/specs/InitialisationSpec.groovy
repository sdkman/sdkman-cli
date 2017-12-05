package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

import java.nio.file.Files
import java.nio.file.Paths

class InitialisationSpec extends SdkmanEnvSpecification {

    static final allCandidates = ["asciidoctorj", "crash", "gaiden", "glide", "gradle", "grails", "griffon", "groovy",
                                  "groovyserv", "jbake", "jbossforge", "lazybones", "springboot", "vertx"]

    def setup() {
        bash = sdkmanBashEnvBuilder
                .withCandidates(allCandidates)
                .withVersionCache("x.y.z")
                .build()
        prepareCandidateDirectories(allCandidates)
    }

    void "should include all candidates in PATH"() {
        given:
        bash.start()
        bash.execute("source $bootstrapScript")
        bash.resetOutput()

        when:
        bash.execute('echo "$PATH"')
        def pathParts = bash.output.split(':')
        def pathElementMatcher = ~/$candidatesDirectory\/([^\/]+)\/.*/
        def includedCandidates = pathParts
                .collect { it.replace("\n", "") }
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
        bash.execute("source $bootstrapScript")
        bash.resetOutput()

        and:
        def originalPath = bash.env.grep { it =~ /^PATH=/ }.first() as String
        bash.execute(originalPath)

        when:
        bash.execute("source $bootstrapScript")
        bash.execute('echo "$PATH"')

        then:
        def pathParts = bash.output.split(':')
        def pathElementMatcher = ~/$candidatesDirectory\/([^\/]+)\/.*/
        def includedCandidates = pathParts
                .collect { it.replace("\n", "") }
                .collect { it =~ pathElementMatcher }
                .findAll { it }
                .collect { it[0][1] }
                .sort()

        println("Available: $allCandidates")
        println("Included : $includedCandidates")

        def missingCandidates = allCandidates - includedCandidates
        missingCandidates.isEmpty()
    }

    void "should not duplicate PATH entries if re-sourced"() {
        given:
        bash.start()
        bash.execute("source $bootstrapScript")
        bash.resetOutput()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute('echo "$PATH"')

        def pathParts = bash.output.split(':')
        def pathElementMatcher = ~/$candidatesDirectory\/([^\/]+)\/.*/
        def includedCandidates = pathParts
                .collect { it.replace("\n", "") }
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

    private prepareCandidateDirectories(List candidates) {
        candidates.forEach {
            def current = Paths.get("$candidatesDirectory/$it/current")
            def targetFilename = "$candidatesDirectory/$it/xxx"

            new File(targetFilename).createNewFile()
            def target = Paths.get(targetFilename)

            Files.createSymbolicLink(current, target)
        }
    }
}
