package sdkman.specs

import sdkman.stubs.UnameStub
import sdkman.support.SdkmanEnvSpecification

class PlatformSpec extends SdkmanEnvSpecification {
	UnameStub unameStub

	def setup() {
		unameStub = UnameStub.prepareIn(new File(sdkmanBaseDirectory, "bin"))
		sdkmanBashEnvBuilder.withCandidates(["groovy"])
	}

	def "should set platform based on uname"() {
		given:
		unameStub.forKernel(kernel).forMachine(machine)
		bash = sdkmanBashEnvBuilder.withUnameStub(unameStub).build()
		bash.start()
		bash.execute("source $bootstrapScript")
		bash.execute('echo $SDKMAN_PLATFORM')

		expect:
		bash.output.contains(platform)

		where:
		kernel   | machine   | platform
		"Linux"  | "i686"    | "LinuxX32"
		"Linux"  | "x86_64"  | "LinuxX64"
		"Linux"  | "armv7l"  | "LinuxARM32"
		"Linux"  | "armv8l"  | "LinuxARM64"
		"Linux"  | "aarch64" | "LinuxARM64"
		"Linux"  | ""        | "LinuxX64"
		"Darwin" | "x86_64"  | "DarwinX64"
		"Darwin" | "arm64"   | "DarwinARM64"
		"Darwin" | ""        | "DarwinX64"
		"MSYS64" | "i686"    | "MSYS64"
		"MSYS64" | ""        | "MSYS64"
	}

	def "should enable rosetta 2 compatibility mode with environment variable"() {
		given:
		unameStub.forKernel("Darwin").forMachine("arm64")
		bash = sdkmanBashEnvBuilder
				.withUnameStub(unameStub)
				.withConfiguration("sdkman_rosetta2_compatible", "true")
				.build()
		bash.start()
		bash.execute("source $bootstrapScript")

		when:
		bash.execute('echo $SDKMAN_PLATFORM')

		then:
		!bash.output.contains("DarwinARM64")
		bash.output.contains("DarwinX64")
	}
}
