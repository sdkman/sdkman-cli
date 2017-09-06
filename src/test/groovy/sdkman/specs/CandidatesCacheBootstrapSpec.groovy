package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

import static java.lang.System.currentTimeMillis

class CandidatesCacheBootstrapSpec extends SdkmanEnvSpecification {

    static final MORE_THAN_A_DAY_IN_MILLIS = 24 * 61 * 60 * 1000

    static final LEGACY_API = "http://localhost:8080/1"
    static final LEGACY_VERSIONS_STABLE_ENDPOINT = "$LEGACY_API/candidates/app/stable"
    static final LEGACY_VERSIONS_BETA_ENDPOINT = "$LEGACY_API/candidates/app/beta"

    static final CURRENT_API = "http://localhost:8080/2"
    static final CURRENT_CANDIDATES_ENDPOINT = "$CURRENT_API/candidates/all"

    File candidatesCache

    def setup() {
        candidatesCache = new File("${sdkmanDotDirectory}/var", "candidates")
        curlStub.primeWith(LEGACY_VERSIONS_STABLE_ENDPOINT, "echo x.y.y")
                .primeWith(LEGACY_VERSIONS_BETA_ENDPOINT, "echo x.y.z")
        sdkmanBashEnvBuilder.withConfiguration("sdkman_debug_mode", "true")
    }

    void "should not query server if unexpired candidates cache is found"() {
        given:
        bash = sdkmanBashEnvBuilder
                .withCandidatesCache(['gradle', 'sbt'])
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute('echo $SDKMAN_CANDIDATES_CSV')

        then:
        candidatesCache.exists()
        candidatesCache.text.contains("gradle,sbt")

        and:
        bash.output.contains "gradle,sbt"
    }

    void "should fetch and store candidates in cache if cache is empty"() {
        given:
        curlStub.primeWith(CURRENT_CANDIDATES_ENDPOINT, "echo groovy,scala")
        bash = sdkmanBashEnvBuilder
                .withCandidatesCache([])
                .withLegacyService(LEGACY_API)
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute('echo $SDKMAN_CANDIDATES_CSV')

        then:
        candidatesCache.exists()
        candidatesCache.text.contains("groovy,scala")

        and:
        bash.output.contains("groovy,scala")
    }

    void "should fetch candidates and refresh cache if older than a day"() {
        given:
        curlStub.primeWith(CURRENT_CANDIDATES_ENDPOINT, "echo groovy,scala")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withCandidatesCache(['groovy'])
                .build()

        and:
        candidatesCache.setLastModified(currentTimeMillis() - MORE_THAN_A_DAY_IN_MILLIS)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute('echo $SDKMAN_CANDIDATES_CSV')

        then:
        candidatesCache.exists()
        candidatesCache.text.contains('groovy,scala')

        and:
        bash.output.contains("groovy,scala")
    }

    void "should ignore candidates if api is offline"() {
        given:
        def candidates = ['groovy', 'scala']
        curlStub.primeWith(CURRENT_CANDIDATES_ENDPOINT, "echo ''")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withCandidatesCache(candidates)
                .build()

        and:
        candidatesCache.setLastModified(currentTimeMillis() - MORE_THAN_A_DAY_IN_MILLIS)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute('echo $SDKMAN_CANDIDATES_CSV')

        then:
        candidatesCache.text.contains('groovy,scala')

        and:
        bash.output.contains("groovy,scala")
    }

    void "should ignore candidates if api returns garbage"() {
        given:
        def candidates = ['groovy', 'scala']
        curlStub.primeWith(CURRENT_CANDIDATES_ENDPOINT, "echo '<html><title>sorry</title></html>'")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withCandidatesCache(candidates)
                .build()

        and:
        candidatesCache.setLastModified(currentTimeMillis() - MORE_THAN_A_DAY_IN_MILLIS)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute('echo $SDKMAN_CANDIDATES_CSV')

        then:
        candidatesCache.text.contains('groovy,scala')

        and:
        bash.output.contains("groovy,scala")
    }

    void "should query api if not subscribed to beta channel"() {
        given:
        curlStub.primeWith(CURRENT_CANDIDATES_ENDPOINT, "echo groovy,scala")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withCurrentService(CURRENT_API)
                .withConfiguration("sdkman_beta_channel", "false")
                .withCandidatesCache(['groovy'])
                .build()

        and:
        candidatesCache.setLastModified(currentTimeMillis() - MORE_THAN_A_DAY_IN_MILLIS)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute('echo $SDKMAN_CANDIDATES_CSV')

        then:
        candidatesCache.exists()
        candidatesCache.text.contains('groovy,scala')

        and:
        bash.output.contains("groovy,scala")
    }
}
