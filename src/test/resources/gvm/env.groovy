import static cucumber.runtime.groovy.Hooks.*
import static gvm.VertxUtils.*

gvmDirEnv = System.getenv('GVM_DIR')
if (! gvmDirEnv) {
	throw new RuntimeException("You must have the GVM_DIR environment variable set to run the tests!")
}

serviceUrlEnv = System.getenv('GVM_SERVICE')
if (! serviceUrlEnv) {
	throw new RuntimeException("You must have the GVM_SERVICE environment variable set to run the tests!")
}

gvmDir = new File("${gvmDirEnv}")
varDir = new File("${gvmDirEnv}/var")
broadcastFile = new File("${gvmDirEnv}/var/broadcast")

scriptPath = 'srv/scripts'

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

