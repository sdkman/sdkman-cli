package sdkman.steps

import static cucumber.api.groovy.EN.And

And(~'^the native "([^"]*)" command is installed$') { String command ->
	def libexecDir = new File(sdkmanDir, "libexec")
	libexecDir.mkdirs()
	def nativeCommand = new File(libexecDir, command)
	nativeCommand.text = "#!/usr/bin/env bash\necho \"native ${command}: \$*\"\n"
	nativeCommand.setExecutable(true)
}
