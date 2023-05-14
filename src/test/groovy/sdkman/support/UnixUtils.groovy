package sdkman.support

class UnixUtils {

	private static platforms = [
			"Linux"   : [
					"x86_64": "linuxx64",
					"aarch64": "linuxarm64",
					
			],
			"Darwin": [
					"x86_64": "darwinx64",
					"arm64": "darwinarm64",
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
		platforms[osName][architecture] ?: osName.toLowerCase()
	}
}
