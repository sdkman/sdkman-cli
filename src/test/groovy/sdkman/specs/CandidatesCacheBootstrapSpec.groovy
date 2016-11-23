package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class CandidatesCacheBootstrapSpec extends SdkmanEnvSpecification {

    static final DAY_AND_MINUTE_IN_MILLIS = 24 * 61 * 60 * 1000

    static final LEGACY_API = "http://localhost:8080/1"
    static final LEGACY_CANDIDATES_ENDPOINT = "$LEGACY_API/candidates"
    static final LEGACY_VERSIONS_STABLE_ENDPOINT = "$LEGACY_API/candidates/app/stable"
    static final LEGACY_VERSIONS_BETA_ENDPOINT = "$LEGACY_API/candidates/app/beta"

    static final CURRENT_API = "http://localhost:8080/2"
    static final CURRENT_CANDIDATES_ENDPOINT = "$CURRENT_API/candidates/all"

    File candidatesFile

    def setup() {
        candidatesFile = new File("${sdkmanDotDirectory}/var", "candidates")
        curlStub.primeWith(LEGACY_VERSIONS_STABLE_ENDPOINT, "echo x.y.y")
                .primeWith(LEGACY_VERSIONS_BETA_ENDPOINT, "echo x.y.z")
        sdkmanBashEnvBuilder.withConfiguration("sdkman_debug_mode", "true")
    }

    void "should not query server if unexpired candidates cache is found"() {
        given: 'a working sdkman installation with candidates file'
        bash = sdkmanBashEnvBuilder
                .withAvailableCandidates(['gradle', 'sbt'])
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.exists()
        candidatesFile.text.contains("gradle,sbt")
    }

    void "legacy should fetch and store candidates in cache if cache is empty"() {
        given: 'a working sdkman installation without candidates'
        curlStub.primeWith(LEGACY_CANDIDATES_ENDPOINT, "echo groovy,scala")
        bash = sdkmanBashEnvBuilder
                .withAvailableCandidates([])
                .withLegacyService(LEGACY_API)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.exists()
        candidatesFile.text.contains("groovy,scala")
    }

    void "legacy should fetch candidates and refresh cache if older than a day"() {
        given: 'a working sdkman installation with expired candidates'
        curlStub.primeWith(LEGACY_CANDIDATES_ENDPOINT, "echo groovy,scala")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withAvailableCandidates(['groovy'])
                .build()

        and:
        def twoDaysAgo = System.currentTimeMillis() - DAY_AND_MINUTE_IN_MILLIS
        candidatesFile.setLastModified(twoDaysAgo)

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.exists()
        candidatesFile.text.contains('groovy,scala')
    }

    void "legacy should ignore candidates if api is offline"() {
        given: 'a working sdkman installation with api down'
        def candidates = ['groovy', 'scala']
        curlStub.primeWith(LEGACY_CANDIDATES_ENDPOINT, "echo ''")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withAvailableCandidates(candidates)
                .build()

        and:
        def twoDaysAgo = System.currentTimeMillis() - DAY_AND_MINUTE_IN_MILLIS
        candidatesFile.setLastModified(twoDaysAgo)

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.text.contains(candidates.join(','))
    }

    void "legacy should ignore candidates if api returns garbage"() {
        given: 'a working sdkman installation with garbled api'
        def candidates = ['groovy', 'scala']
        curlStub.primeWith(LEGACY_CANDIDATES_ENDPOINT, "echo '<html><title>sorry</title></html>'")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withAvailableCandidates(candidates)
                .build()

        and:
        def twoDaysAgo = System.currentTimeMillis() - DAY_AND_MINUTE_IN_MILLIS
        candidatesFile.setLastModified(twoDaysAgo)

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.text.contains(candidates.join(','))
    }

    void "legacy should query legacy api if not subscribed to beta channel"() {
        given: 'a working sdkman installation with expired candidates'
        curlStub.primeWith(LEGACY_CANDIDATES_ENDPOINT, "echo groovy,scala")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withCurrentService(CURRENT_API)
                .withConfiguration("sdkman_beta_channel", "false")
                .withAvailableCandidates(['groovy'])
                .build()

        and:
        def twoDaysAgo = System.currentTimeMillis() - DAY_AND_MINUTE_IN_MILLIS
        candidatesFile.setLastModified(twoDaysAgo)

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.exists()
        candidatesFile.text.contains('groovy,scala')
    }

    void "current should query current api if subscribed to beta channel"() {
        given: 'a working sdkman installation with expired candidates'
        curlStub.primeWith(CURRENT_CANDIDATES_ENDPOINT, "echo groovy,java,scala")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withCurrentService(CURRENT_API)
                .withConfiguration("sdkman_beta_channel", "true")
                .withAvailableCandidates(['groovy'])
                .build()

        and:
        def twoDaysAgo = System.currentTimeMillis() - DAY_AND_MINUTE_IN_MILLIS
        candidatesFile.setLastModified(twoDaysAgo)

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.exists()
        candidatesFile.text.contains('groovy,java,scala')
    }
}
