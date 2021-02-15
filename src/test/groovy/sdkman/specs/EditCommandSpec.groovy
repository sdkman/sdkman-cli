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
		// stub vi to test if it was called with the correct argument
		bash.execute('vi() { echo "vi was called with $1";}')
		bash.execute("export EDITOR=vi")
		bash.execute("sdk edit")

		then:
		bash.output.contains("""vi was called with .sdkman/etc/config""")
	}
}
