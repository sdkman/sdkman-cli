package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

import java.time.Instant

import static java.time.temporal.ChronoUnit.DAYS

class SelfupdateSpec extends SdkmanEnvSpecification {
	static final String CANDIDATES_API = "http://localhost:8080/2"
	static final String BROADCAST_API_LATEST_ID_ENDPOINT = "$CANDIDATES_API/broadcast/latest/id"
	static final String VERSION_ENDPOINT = "$CANDIDATES_API/broker/download/sdkman/version/stable"
 
	def setup() {
		curlStub.primeWith(BROADCAST_API_LATEST_ID_ENDPOINT, "echo dbfb025be9f97fda2052b5febcca0155")
		curlStub.primeWith(VERSION_ENDPOINT, "echo 5.0.0")
	}

	def "should list selfupdate as a valid command when the selfupdate feature is toggled on"() {
		given:
		bash = sdkmanBashEnvBuilder
			.withConfiguration("sdkman_selfupdate_feature", selfUpdateFeature)
			.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("sdk help")

		then:
		verifyOutput(bash.output)

		where:
		selfUpdateFeature | verifyOutput
		"false"           | { !it.contains("selfupdate") }
		"true"            | { it.contains("selfupdate") }
	}

	def "should source sdkman-selfupdate.sh when the selfupdate feature is toggled on"() {
		given:
		bash = sdkmanBashEnvBuilder
			.withConfiguration("sdkman_selfupdate_feature", selfupdateFeature)
			.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("sdk selfupdate")

		then:
		verifyOutput(bash.output)

		where:
		selfupdateFeature | verifyOutput
		"false"           | { it.contains("Invalid command: selfupdate") }
		"true"            | { it.contains("No update available at this time.") }
	}

	def "should perform an autoupdate when the selfupdate feature is toggled on and autoupdate is enabled"() {
		given:
		new File("$sdkmanDotDirectory/var/delay_upgrade").with {
			parentFile.mkdirs()
			createNewFile()
			lastModified = Instant.now().minus(2, DAYS).toEpochMilli()
		}

		bash = sdkmanBashEnvBuilder
			.withSdkmanVersion("4.0.0")
			.withConfiguration("sdkman_selfupdate_feature", selfupdateFeature)
			.withConfiguration("sdkman_auto_update", autoUpdateEnabled)
			.withConfiguration("sdkman_auto_answer", "true")
			.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute("sdk version")

		then:
		verifyOutput(bash.output)

		where:
		selfupdateFeature | autoUpdateEnabled | verifyOutput
		"true"            | "true"            | { it.contains("ATTENTION: A new version of SDKMAN is available...") }
		"true"            | "false"           | { !it.contains("ATTENTION: A new version of SDKMAN is available...") }
		"false"           | "true"            | { !it.contains("ATTENTION: A new version of SDKMAN is available...") }
	}
}
