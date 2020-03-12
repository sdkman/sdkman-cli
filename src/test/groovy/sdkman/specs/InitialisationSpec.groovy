package sdkman.specs

import java.util.regex.Pattern
import sdkman.support.SdkmanEnvSpecification

import static java.nio.file.Files.createDirectory
import static java.nio.file.Files.createSymbolicLink

class InitialisationSpec extends SdkmanEnvSpecification {

	static final List<String> allCandidates = [
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
		final String[] pathParts = bash.output.split(':')
		final Pattern pathElementPattern = ~/$candidatesDirectory\/([^\/]+)\/.*/
		final List<String> includedCandidates = pathParts
			.collect { it.replace("\n", "") }
			.collect { it =~ pathElementPattern }
			.findAll { it }
			.collect { it[0][1] }
			.sort()

		println("Available: ${allCandidates}")
		println("Included : $includedCandidates")

		and:
		final List<String> missingCandidates = allCandidates - includedCandidates

		then:
		missingCandidates.empty
	}

	void "should reinitialize candidates in PATH if necessary"() {
		given:
		bash.start()
		bash.execute("source $bootstrapScript")
		bash.resetOutput()

		and:
		final String originalPath = bash.env.grep { it =~ /^PATH=/ }.first()
		bash.execute(originalPath)

		when:
		bash.execute("source $bootstrapScript")
		bash.execute('echo "$PATH"')

		then:
		final String[] pathParts = bash.output.split(':')
		final Pattern pathElementPattern = ~/$candidatesDirectory\/([^\/]+)\/.*/
		final List<String> includedCandidates = pathParts
			.collect { it.replace("\n", "") }
			.collect { it =~ pathElementPattern }
			.findAll { it }
			.collect { it[0][1] }
			.sort()

		println("Available: $allCandidates")
		println("Included : $includedCandidates")

		final List<String> missingCandidates = allCandidates - includedCandidates
		missingCandidates.empty
	}

	void "should not duplicate PATH entries if re-sourced"() {
		given:
		bash.start()
		bash.execute("source $bootstrapScript")
		bash.resetOutput()

		when:
		bash.execute("source $bootstrapScript")
		bash.execute('echo "$PATH"')

		final String[] pathParts = bash.output.split(':')
		final Pattern pathElementPattern = ~/$candidatesDirectory\/([^\/]+)\/.*/
		final List<String> includedCandidates = pathParts
			.collect { it.replace("\n", "") }
			.collect { it =~ pathElementPattern }
			.findAll { it }
			.collect { it[0][1] }
			.sort()

		println("Available: $allCandidates")
		println("Included : $includedCandidates")

		and:
		final List<String> duplicateCandidates = includedCandidates - allCandidates

		then:
		duplicateCandidates.empty
	}

	private void prepareCandidateDirectories(final List<String> candidates) {
		candidates.forEach {
			createSymbolicLink(
				candidatesDirectory.toPath().resolve("${it}/current"),
				createDirectory(candidatesDirectory.toPath().resolve("${it}/xxx"))
			)
		}
	}
}
