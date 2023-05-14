package sdkman.env

import groovy.transform.ToString
import sdkman.stubs.CurlStub
import sdkman.stubs.UnameStub
import sdkman.support.UnixUtils

@ToString(includeNames = true)
class SdkmanBashEnvBuilder {

	final BUILD_STAGE_DIR = "build/stage/sdkman-latest+hashme"
	final BUILD_BIN_DIR = "$BUILD_STAGE_DIR/bin"
	final BUILD_SRC_DIR = "$BUILD_STAGE_DIR/src"
	final BUILD_COMPLETION_DIR = "$BUILD_STAGE_DIR/contrib/completion/bash"

	//mandatory fields
	private final File baseFolder

	//optional fields with sensible defaults
	private Optional<CurlStub> curlStub = Optional.empty()
	private Optional<UnameStub> unameStub = Optional.empty()
	private List candidates = ['groovy', 'grails', 'java']
	private String platform = UnixUtils.inferPlatform()
	private boolean offlineMode = false
	private String candidatesApi = "http://localhost:8080/2"
	private String jdkHome = "/path/to/my/jdk"
	private String httpProxy
	private String scriptVersion
	private String nativeVersion
	private boolean debugMode = true

	Map config = [
			sdkman_auto_answer : 'false',
			sdkman_beta_channel: 'false',
			sdkman_selfupdate_feature: 'true'
	]

	File sdkmanDir, sdkmanBinDir, sdkmanVarDir, sdkmanSrcDir, sdkmanEtcDir, sdkmanExtDir,
		 sdkmanTmpDir, sdkmanCandidatesDir, sdkmanMetadataDir, sdkmanContribDir
	
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
	
	SdkmanBashEnvBuilder withPlatform(String platform) {
		this.platform = platform
		this
	}

	SdkmanBashEnvBuilder withCandidates(List candidates) {
		this.candidates = candidates
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

	SdkmanBashEnvBuilder withScriptVersion(String version) {
		this.scriptVersion = version
		this
	}

	SdkmanBashEnvBuilder withNativeVersion(String version) {
		this.nativeVersion = version
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
		sdkmanTmpDir = prepareDirectory(sdkmanDir, "tmp")
		sdkmanCandidatesDir = prepareDirectory(sdkmanDir, "candidates")
		sdkmanMetadataDir = prepareDirectory(sdkmanVarDir, "metadata")
		sdkmanContribDir = prepareDirectory(sdkmanDir, "contrib")

		curlStub.map { it.build() }
		unameStub.map { it.build() }

		initializeConfiguration(sdkmanEtcDir, config)
		initializeCandidates(sdkmanCandidatesDir, candidates)
		initializeCandidatesCache(sdkmanVarDir, candidates)
		initializePlatformDescriptor(sdkmanVarDir, platform)
		initializeScriptVersionFile(sdkmanVarDir, scriptVersion)
		initializeNativeVersionFile(sdkmanVarDir, nativeVersion)

		primeInitScript(sdkmanBinDir)
		primeModuleScripts(sdkmanSrcDir)
		primeBashCompletionScript(sdkmanContribDir)

		def env = [
				SDKMAN_DIR           : sdkmanDir.absolutePath,
				SDKMAN_CANDIDATES_DIR: sdkmanCandidatesDir.absolutePath,
				SDKMAN_OFFLINE_MODE  : "$offlineMode",
				SDKMAN_CANDIDATES_API: candidatesApi,
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

	private initializeScriptVersionFile(File folder, String version) {
		if (version) {
			new File(folder, "version") << version
		}
	}

	private initializeNativeVersionFile(File folder, String version) {
		if (version) {
			new File(folder, "version_native") << version
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
	
	private initializePlatformDescriptor(File folder, String platform) {
		def platformDescriptor = new File(folder, "platform")
		platformDescriptor << platform
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

	private primeBashCompletionScript(File targetFolder) {
		def sourceCompletionScript = new File(BUILD_COMPLETION_DIR, 'sdk')

		if (!sourceCompletionScript.exists())
			throw new IllegalStateException("sdk has not been prepared for consumption.")

		new FileTreeBuilder(targetFolder).with {
			completion {
				bash {
					sdk(sourceCompletionScript.text)
				}
			}			
		}
	}

	private primeModuleScripts(File targetFolder) {
		for (f in new File(BUILD_SRC_DIR).listFiles()) {
			if (!(f.name in ['selfupdate.sh', 'install.sh', 'sdkman-init.sh'])) {
				new File(targetFolder, f.name) << f.text
			}
		}
	}
}
