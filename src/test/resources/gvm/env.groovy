import static cucumber.runtime.groovy.Hooks.*
import static gvm.VertxUtils.*

if (! System.getenv('GVM_DIR')) {
	throw new RuntimeException("You must have the GVM_DIR environment variable set to run the tests!")
}

gvmDir = new File(System.getenv('GVM_DIR'))
scriptPath = 'srv/scripts'
serviceUrl = System.getenv('GVM_SERVICE')

server = null

Before(){
	server = startServer()
	cleanUp()
}

After(){
	cleanUp()
}

private cleanUp(){
	if(gvmDir.directory) assert gvmDir.deleteDir()
}

