package gvm

import static cucumber.runtime.groovy.EN.*
import java.nio.file.*

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
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	def current = FileSystems.default.getPath("$gvmDir/$candidate/current")
	assert Files.isSameFile(current, directory)
}

Then(~'^the candidate "([^"]*)" is no longer selected$') { String candidate ->
	def symlink = new File("$gvmDir/$candidate/current")
	assert ! symlink.exists()
}
