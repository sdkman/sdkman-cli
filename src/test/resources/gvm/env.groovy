package gvm

import static cucumber.runtime.groovy.Hooks.*
import static gvm.VertxUtils.*

baseDir = new File("build/scripts")

gvmDirEnv = "/tmp/gvm"
serviceUrlEnv = "http://localhost:8080"

gvmDir = new File("${gvmDirEnv}")
binDir = new File("${gvmDirEnv}/bin")
srcDir = new File("${gvmDirEnv}/src")
varDir = new File("${gvmDirEnv}/var")
envDir = new File("${gvmDirEnv}/etc")

broadcastFile = new File("${gvmDirEnv}/var/broadcast")

server = null
bash = null

Before(){
	cleanUp()
	server = startServer()
	binDir.mkdirs()
    srcDir.mkdirs()
	varDir.mkdirs()
    envDir.mkdirs()

    ['groovy', 'gradle', 'grails', 'griffon', 'vertx'].each {
        new File("$gvmDir/$it").mkdirs()
    }

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
	if(gvmDir.directory) assert gvmDir.deleteDir()
}

