package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class ConfigCommandSpec extends SdkmanEnvSpecification {
	def "it should open the config in the system's default editor"() {
		given:
		bash = sdkmanBashEnvBuilder
				.withOfflineMode(true)
				.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		setupEnv(bash)
		bash.execute("sdk config")

		then:
		verifyOutput(bash.output, sdkmanBaseDirectory)

		where:
		setupEnv << [
			{
				it.execute('nano() { echo "nano was called with $*"; }')
				it.execute("EDITOR=nano")
			},
			{
				it.execute('code() { echo "code was called with $*"; }')
				it.execute("EDITOR='code --wait'")
			},
			{
				it.execute('vi() { echo "vi was called with $*"; }')
				it.execute("unset EDITOR")
			},
			{
				it.execute("EDITOR=/does/not/exist")
			}
		]
		verifyOutput << [
			{ output, baseDirectory -> output.contains("nano was called with ${baseDirectory}/.sdkman/etc/config") },
			{ output, baseDirectory -> output.contains("code was called with --wait ${baseDirectory}/.sdkman/etc/config") },
			{ output, baseDirectory -> output.contains("vi was called with ${baseDirectory}/.sdkman/etc/config") },
			{ output, _ -> output.contains("No default editor configured.") }
		]
	}
}
