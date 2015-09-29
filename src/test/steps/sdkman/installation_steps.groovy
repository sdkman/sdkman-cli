package sdkman

import java.nio.file.FileSystems
import java.nio.file.Files

import static cucumber.api.groovy.EN.And
import static sdkman.utils.FilesystemUtils.prepareCandidateWithVersionFolder
import static sdkman.utils.FilesystemUtils.prepareLocalCandidateWithVersionFolder

And(~'^the candidate "([^"]*)" version "([^"]*)" is installed$') { String candidate, String version ->
	def file = "${sdkmanDir}/${candidate}/${version}" as File
	if (!file.exists()) println bash.output
	assert file.exists()
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not installed$') { String candidate, String version ->
	def directory = FileSystems.default.getPath("$sdkmanDir/$candidate/$version")
	if (Files.exists(directory)) println bash.output
	assert ! Files.exists(directory)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is already installed and default$') { String candidate, String version ->
    def candidateVersion = prepareCandidateWithVersionFolder("$sdkmanDir", candidate, version)
    def currentLink = FileSystems.default.getPath("$sdkmanDir/$candidate/current")
    Files.createSymbolicLink currentLink, candidateVersion
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is the default$') { String candidate, String version ->
    def localVersion = FileSystems.default.getPath("$sdkmanDir/$candidate/$version")
    def currentLink = FileSystems.default.getPath("$sdkmanDir/$candidate/current")
    Files.createSymbolicLink currentLink, localVersion
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is already installed but not default$') { String candidate, String version ->
    prepareCandidateWithVersionFolder "$sdkmanDir", candidate, version
}

And(~'^I do not have a "([^"]*)" candidate installed$') { String candidate ->
    def candidateDir = FileSystems.default.getPath("${sdkmanDir}/${candidate}")
    assert ! candidateDir.toFile().listFiles()
}

And(~'^the candidate "([^"]*)" does not exist locally$') { String candidate ->
    def candidateDir = "${sdkmanDir}/${candidate}" as File
    candidateDir.deleteDir()
    assert ! candidateDir.exists()
}

And(~'^I have a local candidate "([^"]*)" version "([^"]*)" at "([^"]*)"$') { String candidate, String version, String directory ->
    prepareLocalCandidateWithVersionFolder directory, candidate, version
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is linked to "([^"]*)"$') { String candidate, String version, String directory ->
    def fileSystem = FileSystems.default

    def versionLocation = "$sdkmanDir/$candidate/$version"
    def versionFolder = fileSystem.getPath(versionLocation)

    assert Files.isSymbolicLink(versionFolder)

    def link = Files.readSymbolicLink(versionFolder).toString()
    assert link == directory
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is already linked to "([^"]*)"$') { String candidate, String version, String folder ->
    def fileSystem = FileSystems.default

    def candidateFolder = "$sdkmanDir/$candidate" as File
    candidateFolder.mkdirs()

    def link = fileSystem.getPath("$sdkmanDir/$candidate/$version")
    def target = prepareLocalCandidateWithVersionFolder(folder, candidate, version)

    Files.createSymbolicLink(link, target)
}

And(~'^I have configured "([^"]*)" to "([^"]*)"$') { String configName, String flag ->
    def configFile = new File("$sdkmanDir/etc/config")
    configFile.write "${configName}=${flag}"
}
