package sdkman.env

class CleanBashEnvBuilder {

	private final File baseFolder
	String httpProxy

	static CleanBashEnvBuilder create(File baseFolder) {
		new CleanBashEnvBuilder(baseFolder)
	}

	private CleanBashEnvBuilder(File baseFolder) {
		this.baseFolder = baseFolder
	}

	CleanBashEnvBuilder withHttpProxy(String httpProxy) {
		this.httpProxy = httpProxy
		this
	}

	BashEnv build() {
		def env = [HOME: baseFolder.absolutePath]
		if (httpProxy) {
			env.put("http_proxy", httpProxy)
		}
		new BashEnv(baseFolder.absolutePath, env)
	}
}
