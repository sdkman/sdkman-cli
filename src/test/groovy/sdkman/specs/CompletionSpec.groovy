package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class CompletionSpec extends SdkmanEnvSpecification {
	static final String CANDIDATES_API = "http://localhost:8080/2"

	def "should complete the list of commands"() {
		given:
		bash = sdkmanBashEnvBuilder
				.withConfiguration("sdkman_auto_complete", "true")
				.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("COMP_CWORD=1; COMP_WORDS=(sdk); _sdk")
		bash.execute('echo "\${COMPREPLY[@]}"')

		then:
		bash.output.contains("install uninstall list use config default home env current upgrade version help offline selfupdate update flush")
	}

	def "should complete the list of candidates"() {
		given:
		bash = sdkmanBashEnvBuilder
				.withCandidates(["java", "groovy"])
				.withConfiguration("sdkman_auto_complete", "true")
				.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("COMP_CWORD=2; COMP_WORDS=(sdk install); _sdk")
		bash.execute('echo "\${COMPREPLY[@]}"')

		then:
		bash.output.contains("java groovy")
	}

	def "should complete the list of Java versions"() {
		given:
		curlStub.primeWith("$CANDIDATES_API/candidates/java/darwinx64/versions/all", "echo 16.0.1.hs-adpt,17.0.0-tem")

		unameStub.forKernel("Darwin").forMachine("x86_64")

		bash = sdkmanBashEnvBuilder
				.withConfiguration("sdkman_auto_complete", "true")
				.withUnameStub(unameStub)
				.withPlatform("darwinx64")
				.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("COMP_CWORD=3; COMP_WORDS=(sdk install java); _sdk")
		bash.execute('echo "\${COMPREPLY[@]}"')

		then:
		bash.output.contains("16.0.1.hs-adpt 17.0.0-tem")
	}
}
