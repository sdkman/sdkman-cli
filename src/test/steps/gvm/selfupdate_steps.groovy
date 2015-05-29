package gvm

import static cucumber.api.groovy.EN.And

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

And(~'^the configuration file is present$') { ->
    def configFile = "$gvmDir/etc/config" as File
    assert configFile.exists()
}

And(~'^the configuration file contains "([^"]*)"$') { String content ->
    def configFile = "$gvmDir/etc/config" as File
    assert configFile.text.contains(content)
}

And(~'^the configuration file does not contain "([^"]*)"$') { String content ->
    def configFile = "$gvmDir/etc/config" as File
    assert !configFile.text.contains(content)
}

And(~'^a configuration file in the extensions folder$') { ->
    def configFile = "$gvmDir/ext/config" as File
    configFile.text = ""
}

And(~'^the configuration is not present in the extensions folder$') { ->
    def configFile = "$gvmDir/ext/config" as File
    assert !configFile.exists()
}

And(~'^the configuration file is present in the etc folder$') { ->
    def configFile = "$gvmDir/etc/config" as File
    assert configFile.exists()
}

And(~'^the sdkman init script is placed in the bin folder$') { ->
    assert new File("$gvmDir/bin", "sdkman-init.sh").exists()
}

And(~'^the sdkman module scripts are placed in the src folder$') { ->
    assert new File("$gvmDir/src", "sdkman-common.sh").exists()
    assert new File("$gvmDir/src", "sdkman-main.sh").exists()
    assert new File("$gvmDir/src", "sdkman-broadcast.sh").exists()
    assert new File("$gvmDir/src", "sdkman-current.sh").exists()
    assert new File("$gvmDir/src", "sdkman-default.sh").exists()
    assert new File("$gvmDir/src", "sdkman-install.sh").exists()
    assert new File("$gvmDir/src", "sdkman-list.sh").exists()
    assert new File("$gvmDir/src", "sdkman-selfupdate.sh").exists()
    assert new File("$gvmDir/src", "sdkman-uninstall.sh").exists()
    assert new File("$gvmDir/src", "sdkman-use.sh").exists()
    assert new File("$gvmDir/src", "sdkman-version.sh").exists()
    assert new File("$gvmDir/src", "sdkman-help.sh").exists()
}

And(~'^the staging folder is cleaned up$') { ->
    assert !new File("$gvmDir/tmp/stage").exists()
}

And(~'^an empty configuration file$') { ->
    def configFile = "$gvmDir/ext/config" as File
    configFile.text = ""
}