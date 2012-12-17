package gvm

import static cucumber.runtime.groovy.Hooks.*
import static gvm.VertxUtils.*

baseDir = new File("build/scripts")

gvmDirEnv = "/tmp/gvm"
serviceUrlEnv = "http://localhost:8080"

gvmDir = new File("${gvmDirEnv}")
binDir = new File("${gvmDirEnv}/bin")
varDir = new File("${gvmDirEnv}/var")
envDir = new File("${gvmDirEnv}/etc")
broadcastFile = new File("${gvmDirEnv}/var/broadcast")

server = null
bash = null

Before(){
	cleanUp()
	server = startServer()
	binDir.mkdirs()
	varDir.mkdirs()
    envDir.mkdirs()

	// Copy the scripts into the gvm bin directory.
	for (f in baseDir.listFiles()) {
		if (!f.directory) {
			new File(binDir, f.name) << f.text
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

