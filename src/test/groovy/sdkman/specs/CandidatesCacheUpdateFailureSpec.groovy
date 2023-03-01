package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class CandidatesCacheUpdateFailureSpec extends SdkmanEnvSpecification {

	static final String CANDIDATES_API = "http://localhost:8080/2"

	static final String HEALTHCHECK_ENDPOINT = "$CANDIDATES_API/healthcheck"
	static final String CANDIDATES_ALL_ENDPOINT = "$CANDIDATES_API/candidates/all"

	File candidatesCache

	def setup() {
		candidatesCache = new File("${sdkmanDotDirectory}/var", "candidates")
		curlStub.primeWith(HEALTHCHECK_ENDPOINT, "echo dbfb025be9f97fda2052b5febcca0155")
				.primeWith(CANDIDATES_ALL_ENDPOINT, "echo html")
		sdkmanBashEnvBuilder.withConfiguration("sdkman_debug_mode", "true")
	}

	void "should not update candidates if error downloading candidate list"() {
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
		!bash.output.contains('Fresh and cached candidate lengths')
	}
}
