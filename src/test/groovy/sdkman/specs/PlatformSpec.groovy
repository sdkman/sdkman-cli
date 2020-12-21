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
		kernel 		| machine	| platform
		"Linux"		| "i686"	| "LinuxX32"
		"Linux" 	| "X86_64"	| "LinuxX64"
		"Linux"		| "armv7l"	| "LinuxARM32"
		"Linux"		| "armv8l"	| "LinuxARM64"
		"Linux"		| "aarch64"	| "LinuxARM64"
		"Linux"     | ""	    | "LinuxX64"
		"Darwin"	| "X86_64"	| "DarwinX64"
		"Darwin"	| "arm64"	| "DarwinARM64"
		"Darwin"    | ""        | "DarwinX64"
		"MSYS64"	| "i686"	| "MSYS64"
		"MSYS64"    | ""  		| "MSYS64"
	}
}
