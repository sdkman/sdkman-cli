import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException
import static gvm.VertxUtils.*

Given(~'^an updated gvm available$') { ->
	serverResponses.gvmVersion = "99.99.99"
}

Then(~'^the gvm scripts are up to date$') { ->
	def gvm = new File("$gvmDir/bin/gvm")
	assert gvm.exists()

	def gvmInit = new File("$gvmDir/bin/gvm-init.sh")
	assert gvmInit.exists()
}
