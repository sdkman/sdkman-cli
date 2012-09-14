import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

scriptPath = 'bin'
gvmDir = new File(System.getenv('GVM_DIR'))

Given(~'^I do not have a "([^"]*)" candidate installed$') { String candidate ->
	def file = new File("${gvmDir}/${candidate}")
	file.delete()
	assert ! file.exists()
}
