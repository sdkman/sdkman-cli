import static cucumber.runtime.groovy.Hooks.*
import gvm.ServerResponses
import org.vertx.groovy.core.Vertx

baseDir = new File("srv/scripts")

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
serverResponses = null

gvmVersion = '0.8.2'
vertxVersion = '1.2.3.final'

Before(){
	cleanUp()
	serverResponses = new ServerResponses(gvmVersion: gvmVersion, vertxVersion: vertxVersion)
	startServer()
	gvmDir.mkdirs()
	varDir.mkdirs()
}

After(){
	cleanUp()
	stopServer()
}

private startServer() {
	def vertx = Vertx.newVertx()
	server = vertx.createHttpServer()
	serverResponses.createRouteMatcherFor(server)
	server.listen(8080, "localhost")
}

private cleanUp(){
	if(gvmDir.directory) assert gvmDir.deleteDir()
}

private stopServer(){
	server.close()
}

