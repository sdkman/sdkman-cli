package sdkman.support

import java.nio.file.FileSystems
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths


class FilesystemUtils {

    static final DEFAULT_BASE_DIR = "/tmp/sdkman-test"

    static readVersionsCsvFromCandidateFolder(File baseDir, String candidate) {
        def versionFiles = new File(baseDir, candidate).listFiles()
        versionFiles?.findAll { it.name != "current" }?.sort()?.collect { it.name }?.join(",") ?: ""
    }

    static readCurrentFromCandidateFolder(File baseDir, String candidate) {
        def versionFiles = new File(baseDir, candidate).listFiles()
        def currentSymlinkPath = versionFiles.find { it.name == "current" }?.absolutePath
        currentSymlinkPath ? Files.readSymbolicLink(Paths.get(currentSymlinkPath)).fileName : ""
    }

    static prepareBaseDir() {
        def baseDir = "$DEFAULT_BASE_DIR/${UUID.randomUUID()}" as File
        baseDir.mkdirs()
        baseDir
    }

    static prepareCandidateWithVersionFolder(String baseDir, String candidate, String version) {
        def directory = "$baseDir/$candidate/$version"
        prepareCandidateBinFolder directory, candidate, version
    }

    static prepareCandidateBinFolder(String folder, String candidate, String version) {
        def fileSystem = FileSystems.default

        def binFolderPath = fileSystem.getPath("$folder/bin")
        Files.createDirectories binFolderPath
        prepareCandidateExecutable binFolderPath, candidate, version

        return fileSystem.getPath("$folder")
    }

    private static prepareCandidateExecutable(Path binFolder, String candidate, String version) {
        def candidateFile = new File("$binFolder/$candidate")
        candidateFile.write "echo ${candidate.capitalize()} Version: ${version}"
        candidateFile.executable = true
    }
}
