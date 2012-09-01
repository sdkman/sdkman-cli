this.metaClass.mixin(cucumber.runtime.groovy.Hooks)

home = System.getProperty('user.home')
gvmDir = new File("${home}/.gvm")    

Before(){
	cleanUp()
}

After(){
	cleanUp()
}

private cleanUp(){
	if(gvmDir.directory) assert gvmDir.deleteDir()
}