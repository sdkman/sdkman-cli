package sdkman.support

class UnixUtils {

	static getPlatform() {
		asSdkmanPlatform(System.getProperty("os.name"), System.getProperty("os.arch"))
	}

	static asSdkmanPlatform(platform, architecture = "") {

		def platformArch = architecture in ["aarch64", "arm"] ? "$platform $architecture" : platform

		def result
		switch (platformArch) {
			case "Mac OS X":
				result = "Darwin"
				break
			case "Linux":
				result = "Linux64"
				break
			case "Linux 64":
				result = "Linux64"
				break
			case "Linux 32":
				result = "Linux32"
				break
			case "Linux arm":
				result = "LinuxARM"
				break
			case "Linux aarch64":
				result = "LinuxARM64"
				break
			case "FreeBSD":
				result = "FreeBSD"
				break
			default:
				result = platform
		}
		result
	}
}
