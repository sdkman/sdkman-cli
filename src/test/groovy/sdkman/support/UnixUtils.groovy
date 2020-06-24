package sdkman.support

class UnixUtils {

	static getPlatform() {
		def os = System.getProperty("os.name")
		def arch = System.getProperty("os.arch")

		if("aarch64".equals(arch)) {
			asSdkmanPlatform("LinuxARM64")
		} else {
			asSdkmanPlatform(os)
		}
	}

	static asSdkmanPlatform(platform) {
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
			case "FreeBSD":
				result = "FreeBSD"
				break
			default:
				result = platform
		}
		result
	}
}
