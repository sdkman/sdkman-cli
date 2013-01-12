package gvm

import java.nio.file.FileSystems
import java.nio.file.Files
import java.nio.file.Path

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
    def candidateVersion = prepareCandidateFolder("$gvmDir", candidate, version)
    def currentLink = FileSystems.default.getPath("$gvmDir/$candidate/current")
    Files.createSymbolicLink currentLink, candidateVersion
}

When(~'^the candidate "([^"]*)" version "([^"]*)" is already installed but not default$') { String candidate, String version ->
    prepareCandidateFolder "$gvmDir", candidate, version
}

Given(~'^I do not have a "([^"]*)" candidate installed$') { String candidate ->
	def file = new File("${gvmDir}/${candidate}")
	file.delete()
	assert ! file.exists()
}

Given(~'^the candidate "([^"]*)" version "([^"]*)" does not exist$') { String candidate, String version ->
    def versions = new URL("${serviceUrlEnv}/candidates/${candidate}").text
    assert ! versions.contains(version)
}

And(~'^I have a local candidate "([^"]*)" version "([^"]*)" at "([^"]*)"$') { String candidate, String version, String directory ->
    prepareLocalCandidateFolder directory, candidate, version
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is linked to "([^"]*)"$') { String candidate, String version, String directory ->
    def fileSystem = FileSystems.default

    def versionLocation = "$gvmDir/$candidate/$version"
    def versionFolder = fileSystem.getPath(versionLocation)

    assert Files.isSymbolicLink(versionFolder)
    assert Files.readSymbolicLink(versionFolder).toString() == directory
}

private prepareCandidateFolder(String baseDir, String candidate, String version) {
    def directory = "$baseDir/$candidate/$version"
    prepareCandidateBinFolder directory, candidate, version
}

private prepareLocalCandidateFolder(String baseDir, String candidate, String version){
    prepareCandidateBinFolder baseDir, candidate, version
}

private prepareCandidateBinFolder(String folder, String candidate, String version) {
    def fileSystem = FileSystems.default
    def folderPath = fileSystem.getPath("$folder")

    def binFolder = fileSystem.getPath("$folder/bin")
    Files.createDirectories binFolder
    prepareCandidateExecutable binFolder, candidate, version

    folderPath
}

private prepareCandidateExecutable(Path binFolder, String candidate, String version) {
    def candidateFile = new File("$binFolder/$candidate")
    candidateFile.write "echo ${candidate.capitalize()} Version: ${version}"
    candidateFile.executable = true
}
