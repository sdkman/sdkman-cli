package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class VersionFileBootstrapSpec extends SdkmanEnvSpecification {

    static final LEGACY_API = "http://localhost:8080"
    static final CLI_VERSION_ENDPOINT = "$LEGACY_API/candidates/app/version"

    File versionFile
    File candidatesFile

    def setup() {
        versionFile = new File("${sdkmanDotDirectory}/var", "version")
        candidatesFile = new File("${sdkmanDotDirectory}/var", "candidates")
    }

    void "should store version file if does not exist"() {

        given: 'a working sdkman installation without version file'
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo x.y.b").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withLegacyService(LEGACY_API)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
    }

    void "should not query server if version file is found"() {
        given: 'a working sdkman installation with version file'
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withVersionFile("x.y.z")
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
        versionFile.text.contains("x.y.z")
    }

    void "should query server for version and refresh if file is older than a day"() {
        given: 'a working sdkman installation with expired version file'
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo x.y.b").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withLegacyService(LEGACY_API)
                .withVersionFile("x.y.a")
                .build()
        def twoDaysAgo = System.currentTimeMillis() - (24 * 61 * 60 * 1000)
        versionFile.setLastModified(twoDaysAgo)

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
        versionFile.text.contains("x.y.b")
    }

    void "should ignore version if api is offline"() {
        given: 'a working sdkman installation with api down'
        def sdkmanVersion = "x.y.z"
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo ''").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withLegacyService(LEGACY_API)
                .withVersionFile(sdkmanVersion)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.text.contains(sdkmanVersion)
    }

    void "should not go offline if curl times out"() {
        given: 'a working sdkman installation with api down'
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo ''").build()
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

    void "should ignore version if api returns garbage"() {
        given: 'a working sdkman installation with garbled api'
        def sdkmanVersion = "x.y.z"
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo '<html><title>sorry</title></html>'").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withLegacyService(LEGACY_API)
                .withVersionFile(sdkmanVersion)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.text.contains(sdkmanVersion)
    }
}
