package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class EnvCommandSpec extends SdkmanEnvSpecification {
	static final String CANDIDATES_API = "http://localhost:8080/2"

	static final String BROADCAST_API_LATEST_ID_ENDPOINT = "$CANDIDATES_API/broadcast/latest/id"
	static final String CANDIDATES_DEFAULT_JAVA = "$CANDIDATES_API/candidates/default/java"

	def "should generate an .sdkmanrc when called with 'init'"() {
		given:
		curlStub.primeWith(BROADCAST_API_LATEST_ID_ENDPOINT, "echo dbfb025be9f97fda2052b5febcca0155")
				.primeWith(CANDIDATES_DEFAULT_JAVA, "echo 11.0.6.hs-adpt")

		bash = sdkmanBashEnvBuilder
			.withVersionCache("x.y.z")
			.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("sdk env init")

		then:
		new File(bash.workDir, '.sdkmanrc').text == "java=11.0.6.hs-adpt\n"
	}

	def "should use the candidates contained in .sdkmanrc"() {
		given:
		new FileTreeBuilder(candidatesDirectory).with {
			"grails" {
				"2.1.0" {}
			}
			"groovy" {
				"2.4.1" {}
			}
		}

		bash = sdkmanBashEnvBuilder
			.withVersionCache("x.y.z")
			.withOfflineMode(true)
			.build()

		new File(bash.workDir, '.sdkmanrc').text = sdkmanrc

		bash.start()
		bash.execute("source $bootstrapScript")
		
		when:
		bash.execute("sdk env")

		then:
		verifyAll(bash.output) {
			contains("Using groovy version 2.4.1 in this shell.")
			contains("Using grails version 2.1.0 in this shell.")
		}

		where:
		sdkmanrc << [
			"grails=2.1.0\ngroovy=2.4.1",
			"grails=2.1.0\ngroovy=2.4.1\n",
			"  grails=2.1.0\ngroovy=2.4.1\n",
			"grails=2.1.0	\ngroovy=2.4.1\n",
			"grails=2.1.0\ngroovy = 2.4.1\n",
		]
	}

	def "should issue an error if .sdkmanrc contains a malformed candidate version"() {
		given:
		bash = sdkmanBashEnvBuilder
			.withVersionCache("x.y.z")
			.withOfflineMode(true)
			.build()

		new File(bash.workDir, ".sdkmanrc").text = "groovy 2.4.1"

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("sdk env")

		then:
		verifyAll(bash) {
			status == 1
			output.contains("Invalid candidate format!")
		}
	}

	def "should support blank lines, comments and inline comments"() {
		given:
		new FileTreeBuilder(candidatesDirectory).with {
			"groovy" {
				"2.4.1" {}
			}
		}

		bash = sdkmanBashEnvBuilder
			.withVersionCache("x.y.z")
			.withOfflineMode(true)
			.build()

		new File(bash.workDir, ".sdkmanrc").text = sdkmanrc

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("sdk env")

		then:
		bash.output.contains("Using groovy version 2.4.1 in this shell.")

		where:
		sdkmanrc << [
			"\ngroovy=2.4.1\n",
			"# this is a comment\ngroovy=2.4.1\n",
			"groovy=2.4.1 # this is a comment too\n"
		]
	}
}