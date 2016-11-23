package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

import static java.lang.System.currentTimeMillis

class VersionCacheBootstrapSpec extends SdkmanEnvSpecification {

    static final MORE_THAN_A_DAY_IN_MILLIS = 24 * 61 * 60 * 1000

    static final LEGACY_API = "http://localhost:8080/1"
    static final CLI_VERSION_STABLE_ENDPOINT = "$LEGACY_API/candidates/app/stable"
    static final CLI_VERSION_BETA_ENDPOINT = "$LEGACY_API/candidates/app/beta"
    static final CANDIDATES_ENDPOINT = "$LEGACY_API/candidates"

    File versionCache

    def setup() {
        versionCache = new File("${sdkmanDotDirectory}/var", "version")
        curlStub.primeWith(CANDIDATES_ENDPOINT, "echo 'groovy,scala'")
    }

    void "should store version cache if does not exist"() {
        given:
        curlStub.primeWith(CLI_VERSION_STABLE_ENDPOINT, "echo x.y.b")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionCache.exists()
        versionCache.text.contains("x.y.b")
    }

    void "should not query server if unexpired version cache is found"() {
        given:
        curlStub.primeWith(CLI_VERSION_STABLE_ENDPOINT, "sleep 50") //will timeout and fail if called
        bash = sdkmanBashEnvBuilder
                .withVersionCache("x.y.z")
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionCache.exists()
        versionCache.text.contains("x.y.z")
    }

    void "should refresh version cache if older than a day"() {
        given:
        curlStub.primeWith(CLI_VERSION_STABLE_ENDPOINT, "echo x.y.b")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withVersionCache("x.y.a")
                .build()

        and:
        versionCache.setLastModified(currentTimeMillis() - MORE_THAN_A_DAY_IN_MILLIS)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionCache.exists()
        versionCache.text.contains("x.y.b")
    }

    void "should fallback and ignore version if version cache expired and api is offline"() {
        given:
        curlStub.primeWith(CLI_VERSION_STABLE_ENDPOINT, "echo ''")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withVersionCache("x.y.z")
                .build()

        and:
        versionCache.setLastModified(currentTimeMillis() - MORE_THAN_A_DAY_IN_MILLIS)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionCache.text.contains("x.y.z")
    }

    void "should not go offline if curl times out"() {
        given:
        curlStub.primeWith(CLI_VERSION_STABLE_ENDPOINT, "echo ''")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withVersionCache("x.y.z")
                .build()

        and:
        versionCache.setLastModified(currentTimeMillis() - MORE_THAN_A_DAY_IN_MILLIS)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        !bash.output.contains("SDKMAN can't reach the internet so going offline.")
    }

    void "should ignore version if api returns garbage"() {
        given:
        def sdkmanVersion = "x.y.z"
        curlStub.primeWith(CLI_VERSION_STABLE_ENDPOINT, "echo '<html><title>sorry</title></html>'")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withVersionCache(sdkmanVersion)
                .build()

        and:
        versionCache.setLastModified(currentTimeMillis() - MORE_THAN_A_DAY_IN_MILLIS)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionCache.text.contains(sdkmanVersion)
    }

    void "should always refresh version cache if on beta_channel"() {
        given:
        curlStub.primeWith(CLI_VERSION_BETA_ENDPOINT, "echo x.y.z")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withVersionCache("x.y.w")
                .withConfiguration("sdkman_beta_channel", "true")
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionCache.exists()
        versionCache.text.contains("x.y.z")
    }
}
