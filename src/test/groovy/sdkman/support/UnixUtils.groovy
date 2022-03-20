package sdkman.support

class UnixUtils {

	private static platforms = [
			"Linux"   : [
					"x86_64": "LinuxX64"
			],
			"Mac OS X": [
					"x86_64": "DarwinX64",
			]
	]

	static execute(String command) {
		command.execute().text.trim()
	}

	static osName() { execute("uname -s") }

	static osArch() { execute("uname -m") }

	static inferPlatform(
			String osName = osName(),
			String architecture = osArch()) {
		(platforms[osName][architecture] ?: osName).toLowerCase()
	}
}
