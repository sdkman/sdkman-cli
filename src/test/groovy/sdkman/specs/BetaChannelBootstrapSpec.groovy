package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class BetaChannelBootstrapSpec extends SdkmanEnvSpecification {

    static final TWO_DAYS_AGO = System.currentTimeMillis() - (48 * 60 * 60 * 1000)
    static final CURRENT_API = "http://localhost:8080/2"
    static final CLI_STABLE_ENDPOINT = "$CURRENT_API/broker/download/sdkman/version/stable"
    static final CLI_BETA_ENDPOINT = "$CURRENT_API/broker/download/sdkman/version/beta"

    File versionCache

    def setup() {
        versionCache = new File("${sdkmanDotDirectory}/var", "version")
        sdkmanBashEnvBuilder.withCandidates(["groovy"])
    }

    void "should attempt immediate upgrade of stable to beta version if beta channel is first enabled"() {
        given:
        def betaVersion = "x.y.c"
        curlStub.primeWith(CLI_BETA_ENDPOINT, "echo $betaVersion")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(CURRENT_API)
                .withConfiguration("sdkman_beta_channel", "true")
                .withVersionCache("x.y.b")
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute("sdk version")

        then:
        versionCache.exists()
        versionCache.text.contains(betaVersion)
    }

    void "should attempt downgrade of beta to stable version if beta channel is first disabled"() {
        given:
        def stableVersion = "x.y.b"
        curlStub.primeWith(CLI_STABLE_ENDPOINT, "echo $stableVersion")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(CURRENT_API)
                .withConfiguration("sdkman_beta_channel", "false")
                .withVersionCache("x.y.c")
                .build()
        versionCache.setLastModified(TWO_DAYS_AGO)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute("sdk version")


        then:
        versionCache.exists()
        versionCache.text.contains(stableVersion)
    }

    void "should attempt immediate upgrade to new version of beta channel if available"() {
        given:
        def newerBetaVersion = "x.y.d"
        curlStub.primeWith(CLI_BETA_ENDPOINT, "echo $newerBetaVersion")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(CURRENT_API)
                .withConfiguration("sdkman_beta_channel", "true")
                .withVersionCache("x.y.c")
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute("sdk version")

        then:
        versionCache.exists()
        versionCache.text.contains(newerBetaVersion)
    }

    void "should attempt upgrade to new version of stable channel if available"() {
        given:
        def newerStableVersion = "x.y.d"
        curlStub.primeWith(CLI_STABLE_ENDPOINT, "echo $newerStableVersion")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(CURRENT_API)
                .withConfiguration("sdkman_beta_channel", "false")
                .withVersionCache("x.y.c")
                .build()
        versionCache.setLastModified(TWO_DAYS_AGO)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")
        bash.execute("sdk version")

        then:
        versionCache.exists()
        versionCache.text.contains(newerStableVersion)
    }
}
