import static cucumber.runtime.groovy.EN.*
import java.nio.file.*

Then(~'^the candidate "([^"]*)" version "([^"]*)" is in use$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	def current = FileSystems.default.getPath("$gvmDir/$candidate/current")
	assert Files.createSymbolicLink(current, directory)
}

Then(~'^the candidate "([^"]*)" version "([^"]*)" should be in use$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	def current = FileSystems.default.getPath("$gvmDir/$candidate/current")
	assert Files.isSameFile(current, directory)
}

Given(~'^the candidate "([^"]*)" version "([^"]*)" is not installed$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	assert ! Files.exists(directory)
}
