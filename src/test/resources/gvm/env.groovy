this.metaClass.mixin(cucumber.runtime.groovy.Hooks)

home = System.getProperty('user.home')
gvmDir = new File("${home}/.gvm")    
testMarker = new File("${home}/.gvmtest")

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