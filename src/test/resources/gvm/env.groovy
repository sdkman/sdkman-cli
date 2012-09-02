import static cucumber.runtime.groovy.Hooks.*
import static gvm.VertxUtils.*

home = System.getProperty('user.home')
gvmDir = new File("${home}/.gvm")    
testMarker = new File("${home}/.gvmtest")

server = null

Before(){
	cleanUp()
	testMarker.write('')
}

After(){
	cleanUp()
	assert testMarker.delete()
}

private cleanUp(){
	if(gvmDir.directory) assert gvmDir.deleteDir()
}

Before("@webservice"){
	def server = startServer()
}

//After("@webservice"){
//	stopServer(server)
//}