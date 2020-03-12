package sdkman.specs

import java.nio.file.Path
import sdkman.support.SdkmanEnvSpecification

import static java.nio.file.Files.createDirectories
import static java.nio.file.Files.createFile
import static java.nio.file.Files.createSymbolicLink

class SdkCompatibilitySpec extends SdkmanEnvSpecification {

	List<String> allCandidates = ["groovy", "grails", "scala", "sbt"]

	def setup() {
		bash = sdkmanBashEnvBuilder
			.withCandidates(allCandidates)
			.withVersionCache("x.y.z")
			.build()
	}

	void "should add candidate bin folder to the path if present"() {
		given:
		final String currentLink = prepareCandidateFolder("scala", "2.11.7", true)

		and:
		bash.start()
		bash.execute("source ${bootstrapScript}")
		bash.resetOutput()

		when:
		bash.execute('echo "${PATH}"')
		final String[] pathEntries = bash.output.split(':')
		final String firstPathEntry = pathEntries.first()

		then:
		firstPathEntry.contains("${currentLink}/bin")
	}

	void "should add candidate base folder to the path if no bin folder present"() {
		given:
		final String currentLink = prepareCandidateFolder("sbt", "1.0.3", false)

		and:
		bash.start()
		bash.execute("source ${bootstrapScript}")
		bash.resetOutput()

		when:
		bash.execute('echo "${PATH}"')
		final String[] pathEntries = bash.output.split(':')
		final String firstPathEntry = pathEntries.first()

		then:
		firstPathEntry.contains("${currentLink}")

		and:
		!firstPathEntry.contains("${currentLink}/bin")
	}

	private String prepareCandidateFolder(final String candidate, final String version, final boolean hasBinFolder) {
		final Path candidateDir = candidatesDirectory.toPath().toAbsolutePath().resolve(candidate)
		final Path candidateVersionDir = candidateDir.resolve(version)
		createFile(
			createDirectories(
				hasBinFolder
					? candidateVersionDir.resolve('bin')
					: candidateVersionDir
			)
			.resolve('run.sh')
		)
		createSymbolicLink(
			candidateDir.resolve('current'),
			candidateVersionDir
		).toString()
	}
}
