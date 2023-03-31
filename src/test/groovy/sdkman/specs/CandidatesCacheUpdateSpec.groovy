package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class CandidatesCacheUpdateSpec extends SdkmanEnvSpecification {

	static final String CANDIDATES_API = "http://localhost:8080/2"

	static final String HEALTHCHECK_ENDPOINT = "$CANDIDATES_API/healthcheck"
	static final String CANDIDATES_ALL_ENDPOINT = "$CANDIDATES_API/candidates/all"

	File candidatesCache

	def setup() {
		candidatesCache = new File("${sdkmanDotDirectory}/var", "candidates")
		curlStub.primeWith(HEALTHCHECK_ENDPOINT, "echo dbfb025be9f97fda2052b5febcca0155")
				.primeWith(CANDIDATES_ALL_ENDPOINT, "echo groovy,scala")
		sdkmanBashEnvBuilder.withConfiguration("sdkman_debug_mode", "true")
	}

	void "should issue a warning and escape if cache is empty"() {
		given:
		bash = sdkmanBashEnvBuilder
				.withCandidates([])
				.build()

		and:
		bash.start()

		when:
		bash.execute("source $bootstrapScript")
		bash.execute("sdk version")

		then:
		bash.output.contains('WARNING: Cache is corrupt. SDKMAN cannot be used until updated.')
		bash.output.contains('$ sdk update')

		and:
		!bash.output.contains("SDKMAN 5.0.0")
	}

	void "should NOT issue a warning if cache is older than a month"() {
		given:
		bash = sdkmanBashEnvBuilder
				.withCandidates(['groovy'])
				.build()

		and:
		candidatesCache.setLastModified(((new Date() - 31) as Date).time)

		and:
		bash.start()

		when:
		bash.execute("source $bootstrapScript")
		bash.execute("sdk help")

		then:
		!bash.output.contains('We periodically need to update the local cache.')
		!bash.output.contains('$ sdk update')
	}

	void "should log a success message if cache exists"() {
		given:
		bash = sdkmanBashEnvBuilder
				.withCandidates(['groovy'])
				.build()

		and:
		bash.start()

		when:
		bash.execute("source $bootstrapScript")
		bash.execute("sdk help")

		then:
		bash.output.contains('Using existing cache')
	}

	void "should bypass cache check if update command issued"() {
		given:
		bash = sdkmanBashEnvBuilder
				.withCandidates([])
				.build()

		and:
		bash.start()

		when:
		bash.execute("source $bootstrapScript")
		bash.execute("sdk update")

		then:
		bash.output.contains('Adding new candidates(s): groovy scala')

		and:
		candidatesCache.text.trim() == "groovy,scala"
	}
}
