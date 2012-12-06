import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException
import java.nio.file.*
import java.util.zip.*

Given(~'^the default "([^"]*)" candidate is "([^"]*)"$') { String candidate, String version ->
	def candidateVersion = new URL("${serviceUrlEnv}/candidates/${candidate}/default").text
	assert candidateVersion == version
}

Then(~'^the candidate "([^"]*)" version "([^"]*)" is installed$') { String candidate, String version ->
	def file = new File("${gvmDir}/${candidate}/${version}")		
	if (!file.exists()) println bash.output
	assert file.exists()
}

Given(~'^the candidate "([^"]*)" version "([^"]*)" is not installed$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	if (Files.exists(directory)) println bash.output
	assert ! Files.exists(directory)
}

When(~'^the candidate "([^"]*)" version "([^"]*)" is already installed and in use$') { String candidate, String version ->
	bash.execute("gvm install $candidate $version", ["y"])
    def result = bash.output
    assert result.contains("Done installing!")
}

When(~'^the candidate "([^"]*)" version "([^"]*)" is already installed but not in use$') { String candidate, String version ->
	bash.execute("gvm install $candidate $version", ["n"])
    def result = bash.output
    assert result.contains("Done installing!")
}

Given(~'^I do not have a "([^"]*)" candidate installed$') { String candidate ->
	def file = new File("${gvmDir}/${candidate}")
	file.delete()
	assert ! file.exists()
}
