package sdkman.specs

import sdkman.support.SdkmanEnvSpecification

class PlatformSpec extends SdkmanEnvSpecification {
	def setup() {
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
		"Linux"  | "i686"    | "linuxx32"
		"Linux"  | "x86_64"  | "linuxx64"
		"Linux"  | "armv6l"  | "linuxarm32sf"
		"Linux"  | "armv7l"  | "linuxarm32hf"
		"Linux"  | "armv8l"  | "linuxarm32hf"
		"Linux"  | "aarch64" | "linuxarm64"
		"Linux"  | ""        | "linuxx64"
		"Darwin" | "x86_64"  | "darwinx64"
		"Darwin" | "arm64"   | "darwinarm64"
		"Darwin" | ""        | "darwinx64"
		"MSYS64" | "i686"    | "msys64"
		"MSYS64" | ""        | "msys64"
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
		!bash.output.contains("darwinarm64")
		bash.output.contains("darwinx64")
	}
}
