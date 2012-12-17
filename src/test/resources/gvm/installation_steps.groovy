package gvm

import java.nio.file.FileSystems
import java.nio.file.Files

import static cucumber.runtime.groovy.EN.*

Given(~'^the default "([^"]*)" candidate is "([^"]*)"$') { String candidate, String version ->
	def candidateVersion = new URL("${serviceUrlEnv}/candidates/${candidate}/default").text
	assert candidateVersion == version
}

Then(~'^the candidate "([^"]*)" version "([^"]*)" is installed$') { String candidate, String version ->
	def file = new File("${gvmDir}/${candidate}/${version}")		
	if (!file.exists()) println bash.output
	assert file.exists()
}

Given(~'^the candidate "([^"]*)" version "([^"]*)" is not installed$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$gvmDir/$candidate/$version")
	if (Files.exists(directory)) println bash.output
	assert ! Files.exists(directory)
}

When(~'^the candidate "([^"]*)" version "([^"]*)" is already installed and default$') { String candidate, String version ->
    def candidateVersion = setupCandidateVersion(candidate, version)

    def currentLink = FileSystems.default.getPath("$gvmDir/$candidate/current")
    Files.createSymbolicLink currentLink, candidateVersion
}

When(~'^the candidate "([^"]*)" version "([^"]*)" is already installed but not default$') { String candidate, String version ->
    setupCandidateVersion candidate, version
}

private setupCandidateVersion(String candidate, String version) {
    def fileSystem = FileSystems.default

    def versionLocation = "$gvmDir/$candidate/$version"
    def versionFolder = fileSystem.getPath(versionLocation)
    Files.createDirectories versionFolder

    def binFolder = fileSystem.getPath("$versionLocation/bin")
    Files.createDirectories binFolder

    def candidateFile = new File("$versionLocation/bin/$candidate")
    candidateFile.write "echo ${candidate.capitalize()} Version: ${version}"
    candidateFile.executable = true
    versionFolder
}


Given(~'^I do not have a "([^"]*)" candidate installed$') { String candidate ->
	def file = new File("${gvmDir}/${candidate}")
	file.delete()
	assert ! file.exists()
}
