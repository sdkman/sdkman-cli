package gvm

import cucumber.runtime.PendingException

import static cucumber.api.groovy.EN.*

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

And(~'^the configuration file does not contain "([^"]*)"$') { String content ->
    def configFile = "$gvmDir/etc/config" as File
    assert ! configFile.text.contains(content)
}

Given(~'^a configuration file in the extensions folder$') {->
    def configFile = "$gvmDir/ext/config" as File
    configFile.text = ""
}

And(~'^the configuration is not present in the extensions folder$') {->
    def configFile = "$gvmDir/ext/config" as File
    assert ! configFile.exists()
}

And(~'^the configuration file is present in the etc folder$') {->
    def configFile = "$gvmDir/etc/config" as File
    assert configFile.exists()
}

And(~'^the gvm init script is placed in the bin folder$') {->
    assert new File("$gvmDir/bin", "gvm-init.sh").exists()
}

And(~'^the gvm module scripts are placed in the src folder$') {->
    assert new File("$gvmDir/src", "gvm-common.sh").exists()
    assert new File("$gvmDir/src", "gvm-main.sh").exists()
    assert new File("$gvmDir/src", "gvm-broadcast.sh").exists()
    assert new File("$gvmDir/src", "gvm-current.sh").exists()
    assert new File("$gvmDir/src", "gvm-default.sh").exists()
    assert new File("$gvmDir/src", "gvm-install.sh").exists()
    assert new File("$gvmDir/src", "gvm-list.sh").exists()
    assert new File("$gvmDir/src", "gvm-selfupdate.sh").exists()
    assert new File("$gvmDir/src", "gvm-uninstall.sh").exists()
    assert new File("$gvmDir/src", "gvm-use.sh").exists()
    assert new File("$gvmDir/src", "gvm-version.sh").exists()
    assert new File("$gvmDir/src", "gvm-help.sh").exists()
}

And(~'^the staging folder is cleaned up$') {->
    assert ! new File("$gvmDir/tmp/stage").exists()
}
Given(~'^an empty configuration file$') {->
    def configFile = "$gvmDir/ext/config" as File
    configFile.text = ""
}

