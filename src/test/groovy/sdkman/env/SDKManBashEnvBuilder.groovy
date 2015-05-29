package sdkman.env

import sdkman.stubs.CurlStub

class SDKManBashEnvBuilder {

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

    File sdkManDir, sdkManBinDir, sdkManVarDir, sdkManSrcDir, sdkManEtcDir, sdkManExtDir, sdkManArchivesDir, sdkManTmpDir

    static SDKManBashEnvBuilder create(File baseFolder){
        new SDKManBashEnvBuilder(baseFolder)
    }

    private SDKManBashEnvBuilder(File baseFolder){
        this.baseFolder = baseFolder
    }

    SDKManBashEnvBuilder withCurlStub(CurlStub curlStub){
        this.curlStub = curlStub
        this
    }

    SDKManBashEnvBuilder withCandidates(List candidates){
        this.candidates = candidates
        this
    }

    SDKManBashEnvBuilder withAvailableCandidates(List candidates){
        this.availableCandidates = candidates
        this
    }

    SDKManBashEnvBuilder withBroadcast(String broadcast){
        this.broadcast = broadcast
        this
    }

    SDKManBashEnvBuilder withConfiguration(String key, String value){
        config.put key, value
        this
    }

    SDKManBashEnvBuilder withOnlineMode(boolean onlineMode){
        this.onlineMode = onlineMode
        this
    }

    SDKManBashEnvBuilder withForcedOfflineMode(boolean forcedOfflineMode){
        this.forcedOfflineMode = forcedOfflineMode
        this
    }

    SDKManBashEnvBuilder withService(String service){
        this.service = service
        this
    }

    SDKManBashEnvBuilder withBroadcastService(String broadcastService){
        this.broadcastService = broadcastService
        this
    }

    SDKManBashEnvBuilder withBrokerService(String brokerService){
        this.brokerService = brokerService
        this
    }

    SDKManBashEnvBuilder withJdkHome(String jdkHome){
        this.jdkHome = jdkHome
        this
    }

    SDKManBashEnvBuilder withHttpProxy(String httpProxy){
        this.httpProxy = httpProxy
        this
    }

    SDKManBashEnvBuilder withVersionToken(String version){
        this.versionToken = version
        this
    }

    BashEnv build() {
        sdkManDir = prepareDirectory(baseFolder, ".sdkman")
        sdkManBinDir = prepareDirectory(sdkManDir, "bin")
        sdkManVarDir = prepareDirectory(sdkManDir, "var")
        sdkManSrcDir = prepareDirectory(sdkManDir, "src")
        sdkManEtcDir = prepareDirectory(sdkManDir, "etc")
        sdkManExtDir = prepareDirectory(sdkManDir, "ext")
        sdkManArchivesDir = prepareDirectory(sdkManDir, "archives")
        sdkManTmpDir = prepareDirectory(sdkManDir, "tmp")

        initializeCandidates(sdkManDir, candidates)
        initializeAvailableCandidates(sdkManVarDir, availableCandidates)
        initializeBroadcast(sdkManVarDir, broadcast)
        initializeConfiguration(sdkManEtcDir, config)
        initializeVersionToken(sdkManVarDir, versionToken)

        primeInitScript(sdkManBinDir)
        primeModuleScripts(sdkManSrcDir)

        def env = [
                GVM_DIR: sdkManDir.absolutePath,
                GVM_ONLINE: "$onlineMode",
                GVM_FORCE_OFFLINE: "$forcedOfflineMode",
                GVM_SERVICE: service,
                GVM_BROADCAST_SERVICE: broadcastService,
                GVM_BROKER_SERVICE: brokerService,
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
