package sdkman.env

import groovy.transform.ToString
import sdkman.stubs.CurlStub
import sdkman.stubs.UnameStub

@ToString(includeNames = true)
class SdkmanBashEnvBuilder {

	final BUILD_STAGE_DIR = "build/stage/sdkman-latest+hashme"
	final BUILD_BIN_DIR = "$BUILD_STAGE_DIR/bin"
	final BUILD_SRC_DIR = "$BUILD_STAGE_DIR/src"

	//mandatory fields
	private final File baseFolder

	//optional fields with sensible defaults
	private Optional<CurlStub> curlStub = Optional.empty()
	private Optional<UnameStub> unameStub = Optional.empty()
	private List candidates = ['groovy', 'grails', 'java']
	private boolean offlineMode = false
	private String broadcast = "This is a LIVE broadcast!"
	private String candidatesApi = "http://localhost:8080/2"
	private String sdkmanVersion = "5.0.0"
	private String jdkHome = "/path/to/my/jdk"
	private String httpProxy
	private String versionCache
	private boolean debugMode = true

	Map config = [
			sdkman_auto_answer : 'false',
			sdkman_beta_channel: 'false'
	]

	File sdkmanDir, sdkmanBinDir, sdkmanVarDir, sdkmanSrcDir, sdkmanEtcDir, sdkmanExtDir, sdkmanArchivesDir,
		 sdkmanTmpDir, sdkmanCandidatesDir, sdkmanMetadataDir
	
	static SdkmanBashEnvBuilder create(File baseFolder) {
		new SdkmanBashEnvBuilder(baseFolder)
	}

	private SdkmanBashEnvBuilder(File baseFolder) {
		this.baseFolder = baseFolder
	}

	SdkmanBashEnvBuilder withCurlStub(CurlStub curlStub) {
		this.curlStub = Optional.of(curlStub)
		this
	}

	SdkmanBashEnvBuilder withUnameStub(UnameStub unameStub) {
		this.unameStub = Optional.of(unameStub)
		this
	}

	SdkmanBashEnvBuilder withCandidates(List candidates) {
		this.candidates = candidates
		this
	}

	SdkmanBashEnvBuilder withBroadcast(String broadcast) {
		this.broadcast = broadcast
		this
	}

	SdkmanBashEnvBuilder withConfiguration(String key, String value) {
		config.put key, value
		this
	}

	SdkmanBashEnvBuilder withOfflineMode(boolean offlineMode) {
		this.offlineMode = offlineMode
		this
	}

	SdkmanBashEnvBuilder withCandidatesApi(String service) {
		this.candidatesApi = service
		this
	}

	SdkmanBashEnvBuilder withJdkHome(String jdkHome) {
		this.jdkHome = jdkHome
		this
	}

	SdkmanBashEnvBuilder withHttpProxy(String httpProxy) {
		this.httpProxy = httpProxy
		this
	}

	SdkmanBashEnvBuilder withVersionCache(String version) {
		this.versionCache = version
		this
	}

	SdkmanBashEnvBuilder withSdkmanVersion(String version) {
		this.sdkmanVersion = version
		this
	}

	SdkmanBashEnvBuilder withDebugMode(boolean debugMode) {
		this.debugMode = debugMode
		this
	}

	BashEnv build() {
		sdkmanDir = prepareDirectory(baseFolder, ".sdkman")
		sdkmanBinDir = prepareDirectory(sdkmanDir, "bin")
		sdkmanVarDir = prepareDirectory(sdkmanDir, "var")
		sdkmanSrcDir = prepareDirectory(sdkmanDir, "src")
		sdkmanEtcDir = prepareDirectory(sdkmanDir, "etc")
		sdkmanExtDir = prepareDirectory(sdkmanDir, "ext")
		sdkmanArchivesDir = prepareDirectory(sdkmanDir, "archives")
		sdkmanTmpDir = prepareDirectory(sdkmanDir, "tmp")
		sdkmanCandidatesDir = prepareDirectory(sdkmanDir, "candidates")
		sdkmanMetadataDir = prepareDirectory(sdkmanVarDir, "metadata")

		curlStub.map { it.build() }
		unameStub.map { it.build() }

		initializeCandidates(sdkmanCandidatesDir, candidates)
		initializeCandidatesCache(sdkmanVarDir, candidates)
		initializeBroadcast(sdkmanVarDir, broadcast)
		initializeConfiguration(sdkmanEtcDir, config)
		initializeVersionCache(sdkmanVarDir, versionCache)

		primeInitScript(sdkmanBinDir)
		primeModuleScripts(sdkmanSrcDir)

		def env = [
				SDKMAN_DIR           : sdkmanDir.absolutePath,
				SDKMAN_CANDIDATES_DIR: sdkmanCandidatesDir.absolutePath,
				SDKMAN_OFFLINE_MODE  : "$offlineMode",
				SDKMAN_CANDIDATES_API: candidatesApi,
				SDKMAN_VERSION       : sdkmanVersion,
				sdkman_debug_mode    : Boolean.toString(debugMode),
				JAVA_HOME            : jdkHome
		]

		if (httpProxy) {
			env.put("http_proxy", httpProxy)
		}

		new BashEnv(baseFolder.absolutePath, env)
	}

	private prepareDirectory(File target, String directoryName) {
		def directory = new File(target, directoryName)
		directory.mkdirs()
		directory
	}

	private initializeVersionCache(File folder, String version) {
		if (version) {
			new File(folder, "version") << version
		}
	}


	private initializeCandidates(File folder, List candidates) {
		candidates.each { candidate ->
			new File(folder, candidate).mkdirs()
		}
	}

	private initializeCandidatesCache(File folder, List candidates) {
		def candidatesCache = new File(folder, "candidates")
		if (candidates) {
			candidatesCache << candidates.join(",")
		} else {
			candidatesCache << ""
		}
	}

	private initializeBroadcast(File targetFolder, String broadcast) {
		new File(targetFolder, "broadcast") << broadcast
	}

	private initializeConfiguration(File targetFolder, Map config) {
		def configFile = new File(targetFolder, "config")
		config.each { key, value ->
			configFile << "$key=$value\n"
		}
	}

	private primeInitScript(File targetFolder) {
		def sourceInitScript = new File(BUILD_BIN_DIR, 'sdkman-init.sh')

		if (!sourceInitScript.exists())
			throw new IllegalStateException("sdkman-init.sh has not been prepared for consumption.")

		def destInitScript = new File(targetFolder, "sdkman-init.sh")
		destInitScript << sourceInitScript.text
		destInitScript
	}

	private primeModuleScripts(File targetFolder) {
		for (f in new File(BUILD_SRC_DIR).listFiles()) {
			if (!(f.name in ['selfupdate.sh', 'install.sh', 'sdkman-init.sh'])) {
				new File(targetFolder, f.name) << f.text
			}
		}
	}
}
