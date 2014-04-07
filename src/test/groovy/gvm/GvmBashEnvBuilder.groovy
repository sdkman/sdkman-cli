package gvm

class GvmBashEnvBuilder {

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
    String jdkHome = "/path/to/my/jdk"
    String versionToken

    Map config = [
            gvm_auto_answer:'false'
    ]

    File gvmDir, gvmBinDir, gvmVarDir, gvmSrcDir, gvmEtcDir, gvmExtDir, gvmArchivesDir, gvmTmpDir

    static GvmBashEnvBuilder create(File baseFolder){
        new GvmBashEnvBuilder(baseFolder)
    }

    private GvmBashEnvBuilder(File baseFolder){
        this.baseFolder = baseFolder
    }

    GvmBashEnvBuilder withCurlStub(CurlStub curlStub){
        this.curlStub = curlStub
        this
    }

    GvmBashEnvBuilder withCandidates(List candidates){
        this.candidates = candidates
        this
    }

    GvmBashEnvBuilder withAvailableCandidates(List candidates){
        this.availableCandidates = candidates
        this
    }

    GvmBashEnvBuilder withBroadcast(String broadcast){
        this.broadcast = broadcast
        this
    }

    GvmBashEnvBuilder withConfiguration(String key, String value){
        config.put key, value
        this
    }

    GvmBashEnvBuilder withOnlineMode(boolean onlineMode){
        this.onlineMode = onlineMode
        this
    }

    GvmBashEnvBuilder withForcedOfflineMode(boolean forcedOfflineMode){
        this.forcedOfflineMode = forcedOfflineMode
        this
    }

    GvmBashEnvBuilder withService(String service){
        this.service = service
        this
    }

    GvmBashEnvBuilder withJdkHome(String jdkHome){
        this.jdkHome = jdkHome
        this
    }

    GvmBashEnvBuilder withVersionToken(String version){
        this.versionToken = version
        this
    }

    BashEnv build() {
        gvmDir = prepareDirectory(baseFolder, ".gvm")
        gvmBinDir = prepareDirectory(gvmDir, "bin")
        gvmVarDir = prepareDirectory(gvmDir, "var")
        gvmSrcDir = prepareDirectory(gvmDir, "src")
        gvmEtcDir = prepareDirectory(gvmDir, "etc")
        gvmExtDir = prepareDirectory(gvmDir, "ext")
        gvmArchivesDir = prepareDirectory(gvmDir, "archives")
        gvmTmpDir = prepareDirectory(gvmDir, "tmp")

        initializeCandidates(gvmDir, candidates)
        initializeAvailableCandidates(gvmVarDir, availableCandidates)
        initializeBroadcast(gvmVarDir, broadcast)
        initializeConfiguration(gvmEtcDir, config)
        initializeVersionToken(gvmVarDir, versionToken)

        primeInitScript(gvmBinDir)
        primeModuleScripts(gvmSrcDir)

        new BashEnv(baseFolder.absolutePath, [
            GVM_DIR: gvmDir.absolutePath,
            GVM_ONLINE: "$onlineMode",
            GVM_FORCE_OFFLINE: "$forcedOfflineMode",
            GVM_SERVICE: service,
            JAVA_HOME: jdkHome
        ])
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
        def sourceInitScript = new File(TEST_SCRIPT_BUILD_DIR, 'gvm-init.sh')

        if (!sourceInitScript.exists())
            throw new IllegalStateException("gvm-init.sh has not been prepared for consumption.")

        def destInitScript = new File(targetFolder, "gvm-init.sh")
        destInitScript << sourceInitScript.text
        destInitScript
    }

    private primeModuleScripts(File targetFolder){
        for (f in TEST_SCRIPT_BUILD_DIR.listFiles()){
            if(!(f.name in ['selfupdate.sh', 'install.sh', 'gvm-init.sh'])){
                new File(targetFolder, f.name) << f.text
            }
        }
    }

}
