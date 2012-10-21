import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException
import java.util.zip.*

scriptPath = 'srv/scripts'
gvmDir = new File(System.getenv('GVM_DIR'))
serviceUrl = System.getenv('GVM_SERVICE')

Given(~'^the default "([^"]*)" candidate is "([^"]*)"$') { String candidate, String version ->
	def candidateVersion = new URL("${serviceUrl}/candidates/${candidate}/default").text
	assert candidateVersion == version
}

Then(~'^the candidate "([^"]*)" version "([^"]*)" is installed$') { String candidate, String version ->
	def file = new File("${gvmDir}/${candidate}/${version}")		
	assert file.exists()
}

When(~'^the candidate "([^"]*)" version "([^"]*)" is already installed$') { String candidate, String version ->
	def command = "gvm install $candidate $version"
	command = "$scriptPath/$command"
    def proc = command.execute()
    proc.waitFor()
    def result = "${proc.in.text}"
    assert result.contains("Done installing!")
}

When(~'^the archive for candidate "([^"]*)" version "([^"]*)" is corrupt$') { String candidate, String version ->
	try {
		new ZipFile(new File("src/test/resources/${candidate}-${version}.zip"))
		assert false, "Archive was not corrupt!"

	} catch (ZipException ze){
		//expected behaviour
	}
}

Then(~'^the archive for candidate "([^"]*)" version "([^"]*)" is removed$') { String candidate, String version ->
	def archive = new File("${gvmDir}/archives/${candidate}-${version}.zip")
	assert ! archive.exists()
}
