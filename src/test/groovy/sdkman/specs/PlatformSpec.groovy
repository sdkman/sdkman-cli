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
		"Linux"  | "armv6l"  | "linuxarm32hf"
		"Linux"  | "armv7l"  | "linuxarm32hf"
		"Linux"  | "armv8l"  | "linuxarm32hf"
		"Linux"  | "aarch64" | "linuxarm64"
		"Linux"  | "alpha"   | "exotic"
		"Linux"  | "i64"     | "exotic"
		"Linux"  | "ppc"     | "exotic"
		"Linux"  | "ppc64le" | "exotic"
		"Linux"  | "ppc64el" | "exotic"
		"Linux"  | "s390"    | "exotic"
		"Linux"  | "s390x"   | "exotic"
		"Linux"  | ""        | "exotic"
		"Darwin" | "x86_64"  | "darwinx64"
		"Darwin" | "arm64"   | "darwinarm64"
		"MSYS64" | "x86_64"    | "msys64"
		"MSYS64" | ""        | "msys64"
		"CYGWIN" | ""        | "exotic"
	}
}
