package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class CandidatesFileBootstrapSpec extends SdkmanEnvSpecification {

    static final LEGACY_API = "http://localhost:8080"
    static final CANDIDATES_ENDPOINT = "$LEGACY_API/candidates"

    File candidatesFile

    def setup() {
        candidatesFile = new File("${sdkmanDotDirectory}/var", "candidates")
    }

    void "should store candidates if does not exist"() {
        given: 'a working sdkman installation without candidates'
        curlStub.primeWith(CANDIDATES_ENDPOINT, "echo groovy,scala").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withAvailableCandidates([])
                .withLegacyService(LEGACY_API)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.exists()
    }

    void "should not query server if candidates file is found"() {
        given: 'a working sdkman installation with candidates file'
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
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

    void "should query server for candidates and refresh if older than a day"() {
        given: 'a working sdkman installation with expired candidates'
        curlStub.primeWith(CANDIDATES_ENDPOINT, "echo groovy,scala")
                .build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withLegacyService(LEGACY_API)
                .withAvailableCandidates(['groovy'])
                .build()
        def twoDaysAgo = System.currentTimeMillis() - (24 * 61 * 60 * 1000)
        candidatesFile.setLastModified(twoDaysAgo)

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.exists()
        candidatesFile.text.contains('groovy,scala')
    }

    void "should ignore candidates if api is offline"() {
        given: 'a working sdkman installation with api down'
        def candidates = ['groovy', 'scala']
        curlStub.primeWith(CANDIDATES_ENDPOINT, "echo ''").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withLegacyService(LEGACY_API)
                .withAvailableCandidates(candidates)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.text.contains(candidates.join(','))
    }

    void "should not go offline if curl times out"() {
        given: 'a working sdkman installation with api down'
        curlStub.primeWith(CANDIDATES_ENDPOINT, "echo ''").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withLegacyService(LEGACY_API)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        !bash.output.contains("SDKMAN can't reach the internet so going offline.")
    }

    void "should ignore candidates if api returns garbage"() {
        given: 'a working sdkman installation with garbled api'
        def candidates = ['groovy', 'scala']
        curlStub.primeWith(CANDIDATES_ENDPOINT, "echo '<html><title>sorry</title></html>'").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withLegacyService(LEGACY_API)
                .withAvailableCandidates(candidates)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        candidatesFile.text.contains(candidates.join(','))
    }

}
