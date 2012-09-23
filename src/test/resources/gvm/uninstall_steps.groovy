import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

scriptPath = 'bin'
gvmDir = new File(System.getenv('GVM_DIR'))
serviceUrl = System.getenv('GVM_SERVICE')

Then(~'^the candidate "([^"]*)" is no longer selected$') { String candidate ->
	def symlink = new File("$gvmDir/$candidate/current")
	assert ! symlink.exists()
}