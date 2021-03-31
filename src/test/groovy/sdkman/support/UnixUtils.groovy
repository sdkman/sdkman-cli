package sdkman.support

class UnixUtils {

	private static platforms = [
	        "Linux": [
					"amd64": "LinuxX64"
	        ],
			"Mac OS X": [
			        "x86_64": "DarwinX64",
			]
	]
	
	static asSdkmanPlatform(
			platform = System.getProperty("os.name"),
			architecture = System.getProperty("os.arch")) {
		(platforms[platform][architecture] ?: platform).toLowerCase()
	}
}
