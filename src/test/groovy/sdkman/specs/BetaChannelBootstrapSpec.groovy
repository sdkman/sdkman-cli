package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class BetaChannelBootstrapSpec extends SdkmanEnvSpecification {

    static final TWO_DAYS_AGO = System.currentTimeMillis() - (48 * 60 * 60 * 1000)
    static final LEGACY_API = "http://localhost:8080/1"
    static final CLI_STABLE_ENDPOINT = "$LEGACY_API/candidates/app/stable"
    static final CLI_BETA_ENDPOINT = "$LEGACY_API/candidates/app/beta"

    File versionFile

    def setup() {
        versionFile = new File("${sdkmanDotDirectory}/var", "version")
    }

    void "should attempt immediate upgrade of stable to beta version if beta channel is first enabled"() {
        given:
        def betaVersion = "x.y.c"
        curlStub.primeWith(CLI_BETA_ENDPOINT, "echo $betaVersion")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withConfiguration("sdkman_beta_channel", "true")
                .withVersionFile("x.y.b")
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
        versionFile.text.contains(betaVersion)
    }

    void "should attempt downgrade of beta to stable version if beta channel is first disabled"() {
        given:
        def stableVersion = "x.y.b"
        curlStub.primeWith(CLI_STABLE_ENDPOINT, "echo $stableVersion")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withConfiguration("sdkman_beta_channel", "false")
                .withVersionFile("x.y.c")
                .build()
        versionFile.setLastModified(TWO_DAYS_AGO)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
        versionFile.text.contains(stableVersion)
    }

    void "should attempt immediate upgrade to new version of beta channel if available"() {
        given:
        def newerBetaVersion = "x.y.d"
        curlStub.primeWith(CLI_BETA_ENDPOINT, "echo $newerBetaVersion")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withConfiguration("sdkman_beta_channel", "true")
                .withVersionFile("x.y.c")
                .build()

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
        versionFile.text.contains(newerBetaVersion)
    }

    void "should attempt upgrade to new version of stable channel if available"() {
        given:
        def newerStableVersion = "x.y.d"
        curlStub.primeWith(CLI_STABLE_ENDPOINT, "echo $newerStableVersion")
        bash = sdkmanBashEnvBuilder
                .withLegacyService(LEGACY_API)
                .withConfiguration("sdkman_beta_channel", "false")
                .withVersionFile("x.y.c")
                .build()
        versionFile.setLastModified(TWO_DAYS_AGO)

        and:
        bash.start()

        when:
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
        versionFile.text.contains(newerStableVersion)
    }
}
