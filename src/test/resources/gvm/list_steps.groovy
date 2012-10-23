import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

Given(~'^I do not have a "([^"]*)" candidate installed$') { String candidate ->
	def file = new File("${gvmDir}/${candidate}")
	file.delete()
	assert ! file.exists()
}
