package sdkman.steps

import java.nio.file.Path
import java.nio.file.Paths

import static cucumber.api.groovy.EN.And
import static java.nio.file.Files.createDirectories
import static java.nio.file.Files.createSymbolicLink
import static java.nio.file.Files.exists
import static java.nio.file.Files.isSameFile
import static java.nio.file.Files.isSymbolicLink
import static sdkman.support.FilesystemUtils.prepareCandidateBinFolder
import static sdkman.support.FilesystemUtils.prepareCandidateWithVersionFolder

And(~'^the candidate "([^"]*)" version "([^"]*)" is installed$') { String candidate, String version ->
	Path file = candidatesDir.toPath().resolve("${candidate}/${version}")
	if (!exists(file)) println bash.output
	assert exists(file)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not installed$') { String candidate, String version ->
	Path directory = candidatesDir.toPath().resolve("${candidate}/${version}")
	if (exists(directory)) println bash.output
	assert !exists(directory)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is already installed and default$') { String candidate, String version ->
	Path candidateVersion = prepareCandidateWithVersionFolder("$candidatesDir", candidate, version)
	Path currentLink = candidatesDir.toPath().resolve("${candidate}/current")
	createSymbolicLink currentLink, candidateVersion
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is the default$') { String candidate, String version ->
	Path localVersion = candidatesDir.toPath().resolve("${candidate}/${version}")
	Path currentLink = candidatesDir.toPath().resolve("${candidate}/current")
	createSymbolicLink currentLink, localVersion
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is already installed but not default$') { String candidate, String version ->
	prepareCandidateWithVersionFolder "$candidatesDir", candidate, version
}

And(~'^I do not have a "([^"]*)" candidate installed$') { String candidate ->
	Path candidateDir = candidatesDir.toPath().resolve(candidate)
	assert !candidateDir.toFile().listFiles()
}

And(~'^the candidate "([^"]*)" does not exist locally$') { String candidate ->
	File candidateDir = "${candidatesDir}/${candidate}" as File
	candidateDir.deleteDir()
	assert !candidateDir.exists()
}

And(~'^I have a local candidate "([^"]*)" version "([^"]*)" at "([^"]*)"$') { String candidate, String version, String directory ->
	prepareCandidateBinFolder directory, candidate, version
}

And(~'^I have a local candidate "([^"]*)" version "([^"]*)" at relative path "([^"]*)"$') { String candidate, String version, String relativePath ->
	Path fullPath = sdkmanBaseDir.toPath().toAbsolutePath().resolve(relativePath)
	prepareCandidateBinFolder fullPath.toAbsolutePath().toString(), candidate, version
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is linked to the relative path "([^"]*)"$') { String candidate, String version, String relativePath ->
	assertLinkedCandidate(sdkmanBaseDir.toPath().toAbsolutePath().resolve(relativePath), candidate, version)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is linked to "([^"]*)"$') { String candidate, String version, String directory ->
	assertLinkedCandidate(Paths.get(directory), candidate, version)
}

def assertLinkedCandidate(Path directory, String candidate, String version) {
	Path versionFolder = candidatesDir.toPath().resolve("${candidate}/${version}")

	assert isSymbolicLink(versionFolder)

	assert isSameFile(versionFolder, directory)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is already linked to "([^"]*)"$') { String candidate, String version, String folder ->
	Path candidateFolder = candidatesDir.toPath().resolve(candidate)
	createDirectories(candidateFolder)

	Path link = candidateFolder.resolve("$version")
	Path target = prepareCandidateBinFolder(folder, candidate, version)

	createSymbolicLink(link, target)
}

And(~'^I have configured "([^"]*)" to "([^"]*)"$') { String configName, String flag ->
	File configFile = new File("$sdkmanDir/etc/config")
	configFile.write "${configName}=${flag}"
}

And(~/^the exit code is (\d+)$/) { Integer rc ->
	assert bash.getStatus() == rc
}
