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
	
	static inferPlatform(
			osName = System.getProperty("os.name"),
			architecture = System.getProperty("os.arch")) {
		(platforms[osName][architecture] ?: osName).toLowerCase()
	}
}
