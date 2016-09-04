package sdkman.env

import sdkman.stubs.CurlStub

class SdkmanBashEnvBuilder {

    final TEST_SCRIPT_BUILD_DIR = "build/scripts" as File

    //mandatory fields
    private final File baseFolder

    //optional fields with sensible defaults
    CurlStub curlStub
    List candidates = ['groovy', 'grails']
    List availableCandidates = candidates
    boolean offlineMode = false
    String broadcast = "This is a LIVE broadcast!"
    String legacyService = "http://localhost:8080"
    String currentService = "http://localhost:8080"
    String sdkmanVersion = "5.0.0"
    String jdkHome = "/path/to/my/jdk"
    String httpProxy
    String versionToken

    Map config = [
            sdkman_auto_answer:'false'
    ]

    File sdkmanDir, sdkmanBinDir, sdkmanVarDir, sdkmanSrcDir, sdkmanEtcDir, sdkmanExtDir, sdkmanArchivesDir, sdkmanTmpDir, sdkmanCandidatesDir

    static SdkmanBashEnvBuilder create(File baseFolder){
        new SdkmanBashEnvBuilder(baseFolder)
    }

    private SdkmanBashEnvBuilder(File baseFolder){
        this.baseFolder = baseFolder
    }

    SdkmanBashEnvBuilder withCurlStub(CurlStub curlStub){
        this.curlStub = curlStub
        this
    }

    SdkmanBashEnvBuilder withCandidates(List candidates){
        this.candidates = candidates
        this
    }

    SdkmanBashEnvBuilder withAvailableCandidates(List candidates){
        this.availableCandidates = candidates
        this
    }

    SdkmanBashEnvBuilder withBroadcast(String broadcast){
        this.broadcast = broadcast
        this
    }

    SdkmanBashEnvBuilder withConfiguration(String key, String value){
        config.put key, value
        this
    }

    SdkmanBashEnvBuilder withOfflineMode(boolean offlineMode){
        this.offlineMode = offlineMode
        this
    }

    SdkmanBashEnvBuilder withLegacyService(String service){
        this.legacyService = service
        this
    }

    SdkmanBashEnvBuilder withCurrentService(String service){
        this.currentService = service
        this
    }

    SdkmanBashEnvBuilder withJdkHome(String jdkHome){
        this.jdkHome = jdkHome
        this
    }

    SdkmanBashEnvBuilder withHttpProxy(String httpProxy){
        this.httpProxy = httpProxy
        this
    }

    SdkmanBashEnvBuilder withVersionToken(String version){
        this.versionToken = version
        this
    }

    SdkmanBashEnvBuilder withSdkmanVersion(String version){
        this.sdkmanVersion = version
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

        initializeCandidates(sdkmanCandidatesDir, candidates)
        initializeAvailableCandidates(sdkmanVarDir, availableCandidates)
        initializeBroadcast(sdkmanVarDir, broadcast)
        initializeConfiguration(sdkmanEtcDir, config)
        initializeVersionToken(sdkmanVarDir, versionToken)

        primeInitScript(sdkmanBinDir)
        primeModuleScripts(sdkmanSrcDir)

        def env = [
                SDKMAN_DIR: sdkmanDir.absolutePath,
                SDKMAN_CANDIDATES_DIR: sdkmanCandidatesDir.absolutePath,
                SDKMAN_OFFLINE_MODE: "$offlineMode",
                SDKMAN_SERVICE: legacyService,
                SDKMAN_CURRENT_SERVICE: currentService,
                SDKMAN_VERSION: sdkmanVersion,
                JAVA_HOME: jdkHome
        ]

        if(httpProxy) {
            env.put("http_proxy", httpProxy)
        }

        new BashEnv(baseFolder.absolutePath, env)
    }

    private prepareDirectory(File target, String directoryName) {
        def directory = new File(target, directoryName)
        directory.mkdirs()
        directory
    }

    private initializeVersionToken(File folder, String version) {
        if(version) {
            new File(folder, "version") << version
        }
    }


    private initializeCandidates(File folder, List candidates) {
        candidates.each { candidate ->
            new File(folder, candidate).mkdirs()
        }
    }

    private initializeAvailableCandidates(File folder, List candidates){
        new File(folder, "candidates") << candidates.join(",")
    }

    private initializeBroadcast(File targetFolder, String broadcast) {
        new File(targetFolder, "broadcast") << broadcast
    }

    private initializeConfiguration(File targetFolder, Map config){
        def configFile = new File(targetFolder, "config")
        config.each { key, value ->
            configFile << "$key=$value\n"
        }
    }

    private primeInitScript(File targetFolder) {
        def sourceInitScript = new File(TEST_SCRIPT_BUILD_DIR, 'sdkman-init.sh')

        if (!sourceInitScript.exists())
            throw new IllegalStateException("sdkman-init.sh has not been prepared for consumption.")

        def destInitScript = new File(targetFolder, "sdkman-init.sh")
        destInitScript << sourceInitScript.text
        destInitScript
    }

    private primeModuleScripts(File targetFolder){
        for (f in TEST_SCRIPT_BUILD_DIR.listFiles()){
            if(!(f.name in ['selfupdate.sh', 'install.sh', 'sdkman-init.sh'])){
                new File(targetFolder, f.name) << f.text
            }
        }
    }

}
