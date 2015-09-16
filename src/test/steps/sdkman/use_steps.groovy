package sdkman

import java.nio.file.*

import static cucumber.api.groovy.EN.*

And(~'^the candidate "([^"]*)" version "([^"]*)" is in use$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$sdkmanDir/$candidate/$version")
	def current = FileSystems.default.getPath("$sdkmanDir/$candidate/current")
	def symlinkFile = current.toFile()
	if(!symlinkFile.exists()){
		assert Files.createSymbolicLink(current, directory)
	}
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not in use$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$sdkmanDir/$candidate/$version")
	def current = FileSystems.default.getPath("$sdkmanDir/$candidate/current")
	def symlinkFile = current.toFile()
	if(symlinkFile.exists()){ 
		assert ! Files.isSameFile(current, directory)
	}
}

And(~'^the candidate "([^"]*)" version "([^"]*)" should be in use$') { String candidate, String version ->
	bash.execute("$candidate --version")
	assert bash.output.contains(version)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" should be the default$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$sdkmanDir/$candidate/$version")
	def current = FileSystems.default.getPath("$sdkmanDir/$candidate/current")
	assert Files.isSameFile(current, directory)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" should not be the default$') { String candidate, String version ->
    def directory = FileSystems.default.getPath("$sdkmanDir/$candidate/$version")
    def current = FileSystems.default.getPath("$sdkmanDir/$candidate/current")
    assert (!Files.isSymbolicLink(current) || (Files.isSymbolicLink(current) && !Files.isSameFile(current, directory)))
}

And(~'^the candidate "([^"]*)" is no longer selected$') { String candidate ->
	def symlink = new File("$sdkmanDir/$candidate/current")
	assert ! symlink.exists()
}
