import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

Then(~'^the candidate "([^"]*)" is no longer selected$') { String candidate ->
	def symlink = new File("$gvmDir/$candidate/current")
	assert ! symlink.exists()
}
