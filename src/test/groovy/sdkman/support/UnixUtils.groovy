package sdkman.support

class UnixUtils {

	static getPlatform() {
		asSdkmanPlatform(System.getProperty("os.name"), System.getProperty("os.arch"))
	}

	static asSdkmanPlatform(platform, architecture = null) {
		if("aarch64" == architecture) {
			platform += architecture
		}

		def result
		switch (platform) {
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
			case "Linuxaarch64":
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
