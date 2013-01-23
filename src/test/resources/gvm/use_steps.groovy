package gvm

import java.nio.file.*

import static cucumber.runtime.groovy.EN.*

Then(~'^the candidate "([^"]*)" version "([^"]*)" is in use$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	def current = FileSystems.default.getPath("$gvmDir/$candidate/current")
	def symlinkFile = current.toFile()
	if(!symlinkFile.exists()){
		assert Files.createSymbolicLink(current, directory)
	}
}

Then(~'^the candidate "([^"]*)" version "([^"]*)" is not in use$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	def current = FileSystems.default.getPath("$gvmDir/$candidate/current")
	def symlinkFile = current.toFile()
	if(symlinkFile.exists()){ 
		assert ! Files.isSameFile(current, directory)
	}
}

Then(~'^the candidate "([^"]*)" version "([^"]*)" should be in use$') { String candidate, String version ->
	bash.execute("$candidate --version")
	assert bash.output.contains(version)
}

Then(~'^the candidate "([^"]*)" version "([^"]*)" should be the default$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	def current = FileSystems.default.getPath("$gvmDir/$candidate/current")
	assert Files.isSameFile(current, directory)
}

Then(~'^the candidate "([^"]*)" version "([^"]*)" should not be the default$') { String candidate, String version ->
    def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
    def current = FileSystems.default.getPath("$gvmDir/$candidate/current")
    assert (!Files.isSymbolicLink(current) || (Files.isSymbolicLink(current) && !Files.isSameFile(current, directory)))
}

Then(~'^the candidate "([^"]*)" is no longer selected$') { String candidate ->
	def symlink = new File("$gvmDir/$candidate/current")
	assert ! symlink.exists()
}

And(~'^I have configured autoinstall="([^"]*)" and autouse="([^"]*)"$') { String install,use ->
    def configFile = new File("$gvmDir/etc/config")
    configFile.write "gvm_auto_install=${install}\ngvm_auto_use=${use}"
}
