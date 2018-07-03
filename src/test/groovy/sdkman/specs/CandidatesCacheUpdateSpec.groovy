package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class CandidatesCacheUpdateSpec extends SdkmanEnvSpecification {

    static final LEGACY_API = "http://localhost:8080/1"
    static final CURRENT_API = "http://localhost:8080/2"

    static final LEGACY_VERSIONS_STABLE_ENDPOINT = "$LEGACY_API/candidates/app/stable"
    static final LEGACY_VERSIONS_BETA_ENDPOINT = "$LEGACY_API/candidates/app/beta"
    static final BROADCAST_API_LATEST_ID_ENDPOINT = "$CURRENT_API/broadcast/latest/id"
    static final CANDIDATES_ALL_ENDPOINT = "$CURRENT_API/candidates/all"

    File candidatesCache

    def setup() {
        candidatesCache = new File("${sdkmanDotDirectory}/var", "candidates")
        curlStub.primeWith(LEGACY_VERSIONS_STABLE_ENDPOINT, "echo x.y.y")
                .primeWith(LEGACY_VERSIONS_BETA_ENDPOINT, "echo x.y.z")
                .primeWith(BROADCAST_API_LATEST_ID_ENDPOINT, "echo dbfb025be9f97fda2052b5febcca0155")
                .primeWith(CANDIDATES_ALL_ENDPOINT, "echo groovy,scala")
        sdkmanBashEnvBuilder.withConfiguration("sdkman_debug_mode", "true")
    }

    void "should issue a warning and escape if cache is empty"() {
        given:
        bash = sdkmanBashEnvBuilder
                .withCandidates([])
                .withLegacyService(LEGACY_API)
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute("sdk version")

        then:
        bash.output.contains('WARNING: Cache is corrupt. SDKMAN can not be used until updated.')
        bash.output.contains('$ sdk update')

        and:
        !bash.output.contains("SDKMAN 5.0.0")
    }

    void "should issue a warning if cache is older than a month"() {
        given:
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withCandidates(['groovy'])
                .build()

        and:
        candidatesCache.setLastModified(((new Date() - 31) as Date).time)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute("sdk version")

        then:
        bash.output.contains('WARNING: SDKMAN is out-of-date and requires an update. Please run:')
        bash.output.contains('$ sdk update')

        and:
        bash.output.contains('SDKMAN 5.0.0')
    }

    void "should log a success message in debug mode when no update needed"() {
        given:
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withCandidates(['groovy'])
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute("sdk version")

        then:
        bash.output.contains('No update needed. Using existing candidates cache')

        and:
        bash.output.contains('SDKMAN 5.0.0')
    }

    void "should bypass cache check if update command issued"() {
        given:
        bash = sdkmanBashEnvBuilder
                .withCandidates([])
                .withLegacyService(LEGACY_API)
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
