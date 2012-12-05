package gvm

import static cucumber.runtime.groovy.Hooks.*
import static gvm.VertxUtils.*

baseDir = new File("build/scripts")

gvmDirEnv = "/tmp/gvm"
serviceUrlEnv = "http://localhost:8080"

gvmDir = new File("${gvmDirEnv}")
varDir = new File("${gvmDirEnv}/var")
broadcastFile = new File("${gvmDirEnv}/var/broadcast")

server = null

Before(){
	cleanUp()
	server = startServer()
	gvmDir.mkdirs()
	varDir.mkdirs()
}

After(){
	cleanUp()
}

private cleanUp(){
	if(gvmDir.directory) assert gvmDir.deleteDir()
}

