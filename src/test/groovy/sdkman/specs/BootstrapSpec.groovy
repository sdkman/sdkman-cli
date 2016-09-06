package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class BootstrapSpec extends SdkmanEnvSpecification {

    static final CLI_VERSION_ENDPOINT = "http://localhost:8080/candidates/app/cliversion"

    File versionFile

    def setup(){
        versionFile = new File("${sdkmanDotDirectory}/var", "version")
    }

    void "should store version token if does not exist"() {

        given: 'a working sdkman installation without version token'
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo x.y.b").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
    }

    void "should not query server if token is found"() {
        given: 'a working sdkman installation with version token'
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withVersionToken("x.y.z")
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
        versionFile.text.contains("x.y.z")
    }

    void "should query server for version and refresh if token is older than a day"() {
        given: 'a working sdkman installation with expired version token'
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo x.y.b").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withVersionToken("x.y.a")
                .build()
        def twoDaysAgo = System.currentTimeMillis() - 172800000
        versionFile.setLastModified(twoDaysAgo)

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.exists()
        versionFile.text.contains("x.y.b")
    }

    void "should ignore version if api is offline"(){
        given: 'a working sdkman installation with api down'
        def sdkmanVersion = "x.y.z"
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo ''").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withVersionToken(sdkmanVersion)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.text.contains(sdkmanVersion)
    }

    void "should not go offline if curl times out"(){
        given: 'a working sdkman installation with api down'
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo ''").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        ! bash.output.contains("SDKMAN can't reach the internet so going offline.")
    }

    void "should ignore version if api returns garbage"(){
        given: 'a working sdkman installation with garbled api'
        def sdkmanVersion = "x.y.z"
        curlStub.primeWith(CLI_VERSION_ENDPOINT, "echo '<html><title>sorry</title></html>'").build()
        bash = sdkmanBashEnvBuilder
                .withCurlStub(curlStub)
                .withVersionToken(sdkmanVersion)
                .build()

        and:
        bash.start()

        when: 'bootstrap the system'
        bash.execute("source $bootstrapScript")

        then:
        versionFile.text.contains sdkmanVersion
    }
}
