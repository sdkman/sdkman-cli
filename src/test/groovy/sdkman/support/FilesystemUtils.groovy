package sdkman.support

import java.nio.file.Path
import java.nio.file.Paths

import static java.nio.file.Files.createDirectories
import static java.nio.file.Files.readSymbolicLink

class FilesystemUtils {

	static final Path DEFAULT_BASE_DIR = Paths.get('/tmp/sdkman-test')

	static readVersionsCsvFromCandidateFolder(File baseDir, String candidate) {
		File[] versionFiles = new File(baseDir, candidate).listFiles()
		versionFiles?.findAll { it.name != "current" }?.sort()?.collect { it.name }?.join(",") ?: ""
	}

	static readCurrentFromCandidateFolder(File baseDir, String candidate) {
		File[] versionFiles = new File(baseDir, candidate).listFiles()
		Path currentSymlinkPath = versionFiles.find { it.name == "current" }?.absoluteFile?.toPath()
		currentSymlinkPath ? readSymbolicLink(currentSymlinkPath).fileName : ''
	}

	static File prepareBaseDir() {
		createDirectories(DEFAULT_BASE_DIR.resolve(UUID.randomUUID().toString())).toFile()
	}

	static Path prepareCandidateWithVersionFolder(String baseDir, String candidate, String version) {
		String directory = "$baseDir/$candidate/$version"
		prepareCandidateBinFolder directory, candidate, version
	}

	static Path prepareCandidateBinFolder(String folder, String candidate, String version) {
		Path binFolderPath = Paths.get(folder, 'bin')
		createDirectories(binFolderPath)
		prepareCandidateExecutable(binFolderPath, candidate, version)
		return binFolderPath.parent
	}

	private static prepareCandidateExecutable(Path binFolder, String candidate, String version) {
		File candidateFile = new File("$binFolder/$candidate")
		candidateFile.write "echo ${candidate.capitalize()} Version: ${version}"
		candidateFile.executable = true
	}
}
