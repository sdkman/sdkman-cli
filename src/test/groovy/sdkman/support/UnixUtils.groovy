package sdkman.support

class UnixUtils {

	private static platforms = [
	        "Linux": [
					"amd64": "LinuxX64"
	        ],
			"Mac OS X": [
			        "x86_64": "DarwinX64",
			],
			"FreeBSD": [
			        "amd64": "FreeBSD_X64"
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
