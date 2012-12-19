package gvm

import static cucumber.runtime.groovy.EN.*

Then(~'^the gvm scripts are up to date$') { ->
    assert new File("$gvmDir/bin/gvm-init.sh").exists()
    assert new File("$gvmDir/bin/gvm-common.sh").exists()
    assert new File("$gvmDir/bin/gvm-main.sh").exists()
    assert new File("$gvmDir/bin/gvm-broadcast.sh").exists()
    assert new File("$gvmDir/bin/gvm-current.sh").exists()
    assert new File("$gvmDir/bin/gvm-default.sh").exists()
    assert new File("$gvmDir/bin/gvm-install.sh").exists()
    assert new File("$gvmDir/bin/gvm-list.sh").exists()
    assert new File("$gvmDir/bin/gvm-selfupdate.sh").exists()
    assert new File("$gvmDir/bin/gvm-uninstall.sh").exists()
    assert new File("$gvmDir/bin/gvm-use.sh").exists()
    assert new File("$gvmDir/bin/gvm-version.sh").exists()
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
