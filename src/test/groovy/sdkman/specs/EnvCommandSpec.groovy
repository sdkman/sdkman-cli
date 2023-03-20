package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

import java.nio.file.Paths

import static java.nio.file.Files.createSymbolicLink

class EnvCommandSpec extends SdkmanEnvSpecification {
	static final String CANDIDATES_API = "http://localhost:8080/2"

	static final String CANDIDATES_DEFAULT_JAVA = "$CANDIDATES_API/candidates/default/java"

	def "should generate .sdkmanrc when called with 'init'"() {
		given:
		curlStub.primeWith(CANDIDATES_DEFAULT_JAVA, "echo 11.0.6.hs-adpt")

		setupCandidates(candidatesDirectory)

		bash = sdkmanBashEnvBuilder
			.withOfflineMode(true)
			.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("sdk env init")

		then:
		new File(bash.workDir, '.sdkmanrc').text.contains(expected)

		where:
		setupCandidates << [
			{ directory ->
				new FileTreeBuilder(directory).with {
					"java" {
						"8.0.252.hs" {
							"bin" {}
						}
					}
				}

				createSymbolicLink(Paths.get("$directory/java/current"), Paths.get("$directory/java/8.0.252.hs"))
			},
			{} // NOOP
		]
		expected << ["java=8.0.252.hs\n", "java=11.0.6.hs-adpt\n"]
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

	def "should execute 'sdk env' when entering a directory with an .sdkmanrc"() {
		given:
		new FileTreeBuilder(candidatesDirectory).with {
			"groovy" {
				"2.4.1" {}
			}
		}

		bash = sdkmanBashEnvBuilder
			.withOfflineMode(true)
			.withConfiguration("sdkman_auto_env", sdkmanAutoEnv)
			.build()

		new FileTreeBuilder(bash.workDir).with {
			"project" {
				".sdkmanrc"("groovy=2.4.1\n")	
			}
		}

		bash.start()
		bash.execute("source $bootstrapScript")		

		when:
		bash.execute("cd project")

		then:
		verifyOutput(bash.output)

		where:
		sdkmanAutoEnv | verifyOutput
		'true'		  | { it.contains("Using groovy version 2.4.1 in this shell") }
		'false'       | { !it.contains("Using groovy version 2.4.1 in this shell") }
	}
	
	def "should not execute 'sdk env' when already being in a directory with an .sdkmanrc"() {
		given:
		new FileTreeBuilder(candidatesDirectory).with {
			"groovy" {
				"2.4.1" {}
			}
		}

		bash = sdkmanBashEnvBuilder
			.withOfflineMode(true)
			.withConfiguration("sdkman_auto_env", "true")
			.build()

		new FileTreeBuilder(bash.workDir).with {
			"project" {
				".sdkmanrc"("groovy=2.4.1\n")
			}
		}

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("cd project")
		bash.execute("ls")

		then:
		!bash.output.contains("Using groovy version 2.4.1 in this shell")
	}

	def "should execute 'sdk env' when opening a new terminal in a directory with an .sdkmanrc"() {
		given:
		new FileTreeBuilder(candidatesDirectory).with {
			"groovy" {
				"2.4.1" {}
			}
		}

		bash = sdkmanBashEnvBuilder
			.withOfflineMode(true)
			.withConfiguration("sdkman_auto_env", "true")
			.build()

		new FileTreeBuilder(bash.workDir).with {
			".sdkmanrc"("groovy=2.4.1\n")
		}

		bash.start()

		when:
		bash.execute("source $bootstrapScript")

		then:
		bash.output.contains("Using groovy version 2.4.1 in this shell")
	}

	def "should execute 'sdk env' after executing 'sdk env clear'"() {
		given:
		new FileTreeBuilder(candidatesDirectory).with {
			"groovy" {
				"2.4.1" {}
			}
		}

		bash = sdkmanBashEnvBuilder
			.withOfflineMode(true)
			.withConfiguration("sdkman_auto_env", "true")
			.build()

		new FileTreeBuilder(bash.workDir).with {
			"project" {
				".sdkmanrc"("groovy=2.4.1\n")
			}
		}

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("cd project")
		bash.execute("cd ..")
		bash.execute("cd project")

		then:
		bash.output.contains('Using groovy version 2.4.1 in this shell')
	}

	def "should execute 'sdk env clear' when exiting from a directory with an .sdkmanrc"() {
		given:
		new FileTreeBuilder(candidatesDirectory).with {
			"groovy" {
				"2.4.1" {}
				"2.4.6" {}
			}
		}
		createSymbolicLink(Paths.get("$candidatesDirectory/groovy/current"), Paths.get("$candidatesDirectory/groovy/2.4.6"))

		bash = sdkmanBashEnvBuilder
				.withOfflineMode(true)
				.withConfiguration("sdkman_auto_env", "true")
				.build()

		new FileTreeBuilder(bash.workDir).with {
			"project" {
				".sdkmanrc"("groovy=2.4.1\n")
			}
		}

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("cd project")
		bash.execute("cd ..")

		then:
		bash.output.contains("Restored groovy version to 2.4.6")
	}

	def "should execute 'sdk env clear; sdk env' when switching to another directory with an .sdkmanrc"() {
		given:
		new FileTreeBuilder(candidatesDirectory).with {
			"groovy" {
				"2.4.1" {}
				"2.4.6" {}
				"2.5.14" {}
			}
			"ant" {
				"1.9.15" {}
				"1.10.8" {}
			}
		}
		createSymbolicLink(Paths.get("$candidatesDirectory/groovy/current"), Paths.get("$candidatesDirectory/groovy/2.5.14"))
		createSymbolicLink(Paths.get("$candidatesDirectory/ant/current"), Paths.get("$candidatesDirectory/ant/1.10.8"))

		bash = sdkmanBashEnvBuilder
				.withOfflineMode(true)
				.withConfiguration("sdkman_auto_env", "true")
				.build()

		new FileTreeBuilder(bash.workDir).with {
			"projectA" {
				".sdkmanrc"("groovy=2.4.1\nant=1.9.15\n")
			}
			"projectB" {
				".sdkmanrc"("groovy=2.4.6\n")
			}
		}

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("cd projectA")
		
		then:
		bash.output.contains('Using groovy version 2.4.1 in this shell')
		bash.output.contains('Using ant version 1.9.15 in this shell')
		
		when:
		bash.execute("cd ../projectB")

		then:
		bash.output.contains("Restored ant version to 1.10.8")
		bash.output.contains('Using groovy version 2.4.6 in this shell')
		
		when:
		bash.execute("cd ..")

		then:
		bash.output.contains('Restored groovy version to 2.5.14')
		!bash.output.contains('ant')
	}

	def "should not execute 'sdk env clear' when entering a subdirectory within the current active configuration"() {
		given:
		new FileTreeBuilder(candidatesDirectory).with {
			"groovy" {
				"2.4.1" {}
			}
		}

		bash = sdkmanBashEnvBuilder
				.withOfflineMode(true)
				.withConfiguration("sdkman_auto_env", "true")
				.build()

		new FileTreeBuilder(bash.workDir).with {
			"project" {
				".sdkmanrc"("groovy=2.4.1\n")
			}
			"src" {}
		}

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("cd project")
		bash.execute("cd src")

		then:
		!bash.output.contains("Restored groovy version to 2.4.6")
	}

	def "should issue an error if .sdkmanrc contains a malformed candidate version"() {
		given:
		bash = sdkmanBashEnvBuilder
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

	def "should issue an error when .sdkmanrc contains a candidate version which is not installed"() {
		given:
		bash = sdkmanBashEnvBuilder
				.withOfflineMode(true)
				.build()

		new File(bash.workDir, ".sdkmanrc").text = "groovy=2.4.1"

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("sdk env")

		then:
		verifyAll(bash) {
			status == 1
			output.contains("Stop! groovy 2.4.1 is not installed.")
			output.contains("Run 'sdk env install' to install it.")
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
