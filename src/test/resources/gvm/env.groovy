import static cucumber.runtime.groovy.Hooks.*
import static gvm.VertxUtils.*

gvmDir = new File(System.getenv('GVM_DIR'))

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

