package gvm

import static cucumber.api.groovy.Hooks.After
import static cucumber.api.groovy.Hooks.Before
import static gvm.MongoHelper.loadDbCollectionFromFile
import static gvm.MongoHelper.prepareDB

SERVICE_DOWN_URL = "http://localhost:0"
SERVICE_UP_URL = "http://localhost:8080"
FAKE_JDK_PATH = "/path/to/my/openjdk"

counter = "${(Math.random() * 10000).toInteger()}".padLeft(4, "0")

localGroovyCandidate = "/tmp/groovy-core" as File

gvmVersion = "x.y.z"
gvmVersionOutdated = "x.y.y"

gvmBaseEnv = "/tmp/gvm-$counter"
gvmBaseDir = gvmBaseEnv as File

gvmDirEnv = "$gvmBaseEnv/.gvm"
gvmDir = gvmDirEnv as File
binDir = "${gvmDirEnv}/bin" as File
srcDir = "${gvmDirEnv}/src" as File
varDir = "${gvmDirEnv}/var" as File
etcDir = "${gvmDirEnv}/etc" as File
extDir = "${gvmDirEnv}/ext" as File
archiveDir = "${gvmDirEnv}/archives" as File
tmpDir = "${gvmDir}/tmp" as File

broadcastFile = new File(varDir, "broadcast")
candidatesFile = new File(varDir, "candidates")
versionTokenFile = new File(varDir, "version")
initScript = new File(binDir, "gvm-init.sh")

bash = null

if(!binding.hasVariable("db")) {
    db = setupDb()
}

private setupDb(){
    db = prepareDB()
    loadDbCollectionFromFile(db, "candidates", "gvm_candidates.js")
    loadDbCollectionFromFile(db, "broadcast", "gvm_broadcast.js")
    loadDbCollectionFromFile(db, "application", "gvm_application.js")
    db
}

Before(){
    cleanUp()
}

After(){ scenario ->
    def output = bash?.output
    if (output) {
        scenario.write("\nOutput: \n${output}")
    }
	bash?.stop()
    //cleanUp()
}

private cleanUp(){
    gvmBaseDir.deleteDir()
    localGroovyCandidate.deleteDir()
}