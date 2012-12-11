package gvm

import static cucumber.runtime.groovy.EN.*

Then(~'^the gvm scripts are up to date$') { ->
	def gvm = new File("$gvmDir/bin/gvm")
	assert gvm.exists()

	def gvmInit = new File("$gvmDir/bin/gvm-init.sh")
	assert gvmInit.exists()
}

And(~'^the configuration file has been primed with "([^"]*)"$') { String content ->
    def configFile = "$gvmDir/etc/config" as File
    configFile << content
}

And(~'^the configuration file has not been primed$') { ->
    def configFile = "$gvmDir/etc/config" as File
    if (configFile.exists()) {
        configFile.delete()
    }
}

Then(~'^the configuration file is present$') { ->
    def configFile = "$gvmDir/etc/config" as File
    assert configFile.exists()
}

And(~'^the configuration file contains "([^"]*)"$') { String content ->
    def configFile = "$gvmDir/etc/config" as File
    assert configFile.text.contains(content)
}
