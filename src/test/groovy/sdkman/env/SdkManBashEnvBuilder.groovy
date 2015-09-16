package sdkman.env

import sdkman.stubs.CurlStub

class SdkManBashEnvBuilder {

    final TEST_SCRIPT_BUILD_DIR = "build/testScripts" as File

    //mandatory fields
    private final File baseFolder

    //optional fields with sensible defaults
    CurlStub curlStub
    List candidates = ['groovy', 'grails']
    List availableCandidates = candidates
    boolean onlineMode = true
    boolean forcedOfflineMode = false
    String broadcast = "This is a LIVE broadcast!"
    String service = "http://localhost:8080"
    String broadcastService = "http://localhost:8080"
    String brokerService = "http://localhost:8080"
    String jdkHome = "/path/to/my/jdk"
    String httpProxy
    String versionToken

    Map config = [
            sdkman_auto_answer:'false'
    ]

    File sdkmanDir, sdkmanBinDir, sdkmanVarDir, sdkmanSrcDir, sdkmanEtcDir, sdkmanExtDir, sdkmanArchivesDir, sdkmanTmpDir

    static SdkManBashEnvBuilder create(File baseFolder){
        new SdkManBashEnvBuilder(baseFolder)
    }

    private SdkManBashEnvBuilder(File baseFolder){
        this.baseFolder = baseFolder
    }

    SdkManBashEnvBuilder withCurlStub(CurlStub curlStub){
        this.curlStub = curlStub
        this
    }

    SdkManBashEnvBuilder withCandidates(List candidates){
        this.candidates = candidates
        this
    }

    SdkManBashEnvBuilder withAvailableCandidates(List candidates){
        this.availableCandidates = candidates
        this
    }

    SdkManBashEnvBuilder withBroadcast(String broadcast){
        this.broadcast = broadcast
        this
    }

    SdkManBashEnvBuilder withConfiguration(String key, String value){
        config.put key, value
        this
    }

    SdkManBashEnvBuilder withOnlineMode(boolean onlineMode){
        this.onlineMode = onlineMode
        this
    }

    SdkManBashEnvBuilder withForcedOfflineMode(boolean forcedOfflineMode){
        this.forcedOfflineMode = forcedOfflineMode
        this
    }

    SdkManBashEnvBuilder withService(String service){
        this.service = service
        this
    }

    SdkManBashEnvBuilder withBroadcastService(String broadcastService){
        this.broadcastService = broadcastService
        this
    }

    SdkManBashEnvBuilder withBrokerService(String brokerService){
        this.brokerService = brokerService
        this
    }

    SdkManBashEnvBuilder withJdkHome(String jdkHome){
        this.jdkHome = jdkHome
        this
    }

    SdkManBashEnvBuilder withHttpProxy(String httpProxy){
        this.httpProxy = httpProxy
        this
    }

    SdkManBashEnvBuilder withVersionToken(String version){
        this.versionToken = version
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

        initializeCandidates(sdkmanDir, candidates)
        initializeAvailableCandidates(sdkmanVarDir, availableCandidates)
        initializeBroadcast(sdkmanVarDir, broadcast)
        initializeConfiguration(sdkmanEtcDir, config)
        initializeVersionToken(sdkmanVarDir, versionToken)

        primeInitScript(sdkmanBinDir)
        primeModuleScripts(sdkmanSrcDir)

        def env = [
                SDKMAN_DIR: sdkmanDir.absolutePath,
                SDKMAN_ONLINE: "$onlineMode",
                SDKMAN_FORCE_OFFLINE: "$forcedOfflineMode",
                SDKMAN_SERVICE: service,
                SDKMAN_BROADCAST_SERVICE: broadcastService,
                SDKMAN_BROKER_SERVICE: brokerService,
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
