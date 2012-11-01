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
	assert file.exists()
}

Given(~'^the candidate "([^"]*)" version "([^"]*)" is not installed$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	assert ! Files.exists(directory)
}

When(~'^the candidate "([^"]*)" version "([^"]*)" is already installed and in use$') { String candidate, String version ->
	def command = "gvm install $candidate $version"
	command = "$scriptPath/$command"
    def proc = command.execute()
	proc.out.close()
    proc.waitFor()
    def result = proc.text
    assert result.contains("Done installing!")
}

When(~'^the candidate "([^"]*)" version "([^"]*)" is already installed but not in use$') { String candidate, String version ->
	def command = "gvm install $candidate $version"
	command = "$scriptPath/$command"
    def proc = command.execute()
	def writer = new PrintWriter(proc.out)
	writer.println "n"
	writer.close()
    proc.waitFor()
    def result = proc.text
    assert result.contains("Done installing!")
}

Given(~'^I do not have a "([^"]*)" candidate installed$') { String candidate ->
	def file = new File("${gvmDir}/${candidate}")
	file.delete()
	assert ! file.exists()
}
