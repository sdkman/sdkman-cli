package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class EnvCommandSpec extends SdkmanEnvSpecification {

	def setup() {
		bash = sdkmanBashEnvBuilder
				.withVersionCache("x.y.z")
				.withOfflineMode(true)
				.build()
		bash.start()
		bash.execute("source $bootstrapScript")
	}

	def "should generate an .sdkmanrc when called with 'init'"() {
		when:
		bash.execute("sdk env init")
		then:
		new File(bash.workDir,'.sdkmanrc').text == "java=11.0.7.hs-adpt\n"
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

		new File(bash.workDir, '.sdkmanrc').text = sdkrc

		when:
		bash.execute("sdk env")

		then:
		verifyAll(bash.output) {
			contains("Using groovy version 2.4.1 in this shell.")
			contains("Using grails version 2.1.0 in this shell.")
		}

		where:
		sdkrc << [
			"grails=2.1.0\ngroovy=2.4.1",
			"grails=2.1.0\ngroovy=2.4.1\n",
			"  grails=2.1.0\ngroovy=2.4.1\n",
			"grails=2.1.0	\ngroovy=2.4.1\n",
			"grails=2.1.0\ngroovy = 2.4.1\n",
		]
	}

	def "should issue an error if .sdkmanrc contains malformed candidate versions"() {
		given:
		new File(bash.workDir, ".sdkmanrc").text = "groovy 2.4.1"

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

		new File(bash.workDir, ".sdkmanrc").text = sdkrc

		when:
		bash.execute("sdk env")

		then:
		bash.output.contains("Using groovy version 2.4.1 in this shell.")

		where:
		sdkrc << [
			"\ngroovy=2.4.1\n",
			"# this is a comment\ngroovy=2.4.1\n",
			"groovy=2.4.1 # this is a comment too\n"
		]
	}
}