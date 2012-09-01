import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

Then(~'^the candidate can be found at "([^"]*)"$') { String path ->
	def file = new File(path)
	assert file.exists(), "$path does not exist!"
}