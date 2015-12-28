package sdkman.specs

import sdkman.env.SdkManBashEnvBuilder
import sdkman.support.SdkmanEnvSpecification

class BootstrapSpec extends SdkmanEnvSpecification {

    File versionFile

    def setup(){
        versionFile = new File("${sdkmanDotDirectory}/var", "version")
    }

    void "should store version token if does not exist"() {

        given: 'a working sdkman installation without version token'
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDirectory)
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
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDirectory)
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
        curlStub.primeWith("http://localhost:8080/app/version", "echo x.y.b").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDirectory)
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
        curlStub.primeWith("http://localhost:8080/app/version", "echo ''").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDirectory)
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
        curlStub.primeWith("http://localhost:8080/app/version", "echo ''").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDirectory)
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
        curlStub.primeWith("http://localhost:8080/app/version", "echo '<html><title>sorry</title></html>'").build()
        bash = SdkManBashEnvBuilder
                .create(sdkmanBaseDirectory)
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
