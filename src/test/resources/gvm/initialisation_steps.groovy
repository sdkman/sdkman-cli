package gvm

import java.util.zip.ZipException
import java.util.zip.ZipFile

import static cucumber.runtime.groovy.EN.*

Then(~'^the gvm work folder is created$') { ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

Then(~'^the "([^"]*)" folder exists in user home$') { String arg1 ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

Given(~'^an initialised system$') { ->
    gvmDir.mkdirs()
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
