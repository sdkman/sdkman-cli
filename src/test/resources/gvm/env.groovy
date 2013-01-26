package gvm

import static cucumber.api.groovy.Hooks.*
import static gvm.VertxUtils.*

serviceUrlEnv = "http://localhost:8080"
baseDir = new File("build/scripts")

counter = "${(Math.random() * 10000).toInteger()}".padLeft(4, "0")

localGroovyCandidate = "/tmp/groovy-core" as File

gvmBaseEnv = "/tmp/gvm-$counter"
gvmBaseDir = gvmBaseEnv as File

gvmDirEnv = "$gvmBaseEnv/.gvm"
gvmDir = gvmDirEnv as File
binDir = "${gvmDirEnv}/bin" as File
srcDir = "${gvmDirEnv}/src" as File
varDir = "${gvmDirEnv}/var" as File
etcDir = "${gvmDirEnv}/etc" as File
extDir = "${gvmDirEnv}/ext" as File

broadcastFile = new File("${gvmDirEnv}/var/broadcast")

server = null
bash = null

Before(){
	cleanUp()
	server = startServer()

	binDir.mkdirs()
    srcDir.mkdirs()
	varDir.mkdirs()
    etcDir.mkdirs()
    extDir.mkdirs()

    // Copy the init script into the gvm bin folder
    def initScript = new File(binDir, 'gvm-init.sh') << new File(baseDir, 'gvm-init.sh').text
    initScript.executable = true

	// Copy all modular scripts into the gvm bin folder
    for (f in baseDir.listFiles()){
        if(!(f.name in ['selfupdate.sh', 'install.sh', 'gvm-init.sh'])){
            new File(srcDir, f.name) << f.text
        }
    }
}

After(){
	bash?.stop()
    cleanUp()
}

private cleanUp(){
    gvmBaseDir.deleteDir()
    localGroovyCandidate.deleteDir()
}
