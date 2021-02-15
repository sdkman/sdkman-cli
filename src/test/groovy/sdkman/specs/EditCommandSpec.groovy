package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class EditCommandSpec extends SdkmanEnvSpecification {
	def "it should open the config in the system's default editor"() {
		given:
		bash = sdkmanBashEnvBuilder
				.withVersionCache("x.y.z")
				.withOfflineMode(true)
				.build()

		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		setupEnv(bash)
		bash.execute("sdk edit")

		then:
		verifyOutput(bash.output, sdkmanBaseDirectory)

		where:
		setupEnv << [
			{
				it.execute('nano() { echo "nano was called with $1"; }')
				it.execute("EDITOR=nano")
			},
			{
				it.execute('vi() { echo "vi was called with $1"; }')
				it.execute("unset EDITOR")
			}
		]
		verifyOutput << [
			{ output, baseDirectory -> output.contains("nano was called with ${baseDirectory}/.sdkman/etc/config") },
			{ output, baseDirectory -> output.contains("vi was called with ${baseDirectory}/.sdkman/etc/config") }
		]
	}
}
