package sdkman.support

class UnixUtils {

	private static platforms = [
	        "Linux": [
	                "i686": "Linux32",
					"amd64": "Linux64",
					"armv7l": "LinuxARM32",
					"armv8l": "LinuxARM64",
					"aarch64": "LinuxARM64"
	        ],
			"Darwin": [
			        "X86_64": "DarwinX64",
					"arm64": "DarwinARM64"
			],
			"FreeBSD": [
			        "amd64": "FreeBSD64"
			]
	]

	static getPlatform() {
		def sdkmanPlatform = asSdkmanPlatform(System.getProperty("os.name"), System.getProperty("os.arch"))
		println("Setting platform for test: $sdkmanPlatform")
		sdkmanPlatform
	}
	
	static asSdkmanPlatform(
			platform = System.getProperty("os.name"),
			architecture = System.getProperty("os.arch")) {
		platforms[platform][architecture] ?: platform
	}
}
