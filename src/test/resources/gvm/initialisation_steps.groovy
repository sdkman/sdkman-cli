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

Given(~'^isolated mode is active$') { ->
	def etcDir = new File(gvmDir, "etc")
	etcDir.mkdirs()
    new File(etcDir, "config").text = "isolated_mode=1\n"
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
