package sdkman.support

class UnixUtils {

	static String getPlatform() {
		asSdkmanPlatform(System.getProperty('os.name'))
	}

	static String asSdkmanPlatform(final String platform) {
		switch (platform) {
			case 'Mac OS X':
			case 'Mac OSX':
				return 'Darwin'
			case 'Linux':
			case 'Linux 64':
				return 'Linux64'
			case 'Linux 32':
				return 'Linux32'
			default:
				return platform
		}
	}
}
