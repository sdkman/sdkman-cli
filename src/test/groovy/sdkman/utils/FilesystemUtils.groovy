package sdkman.utils

import java.nio.file.FileSystems
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths


class FilesystemUtils {

    static final DEFAULT_BASE_DIR = "/tmp/sdkman-test"

    static readVersionsCsvFromCandidateFolder(File baseDir, String candidate) {
        def versionFiles = new File(baseDir, candidate).listFiles()
        versionFiles?.findAll { it.name != "current" }?.collect { it.name }?.join(",") ?: ""
    }

    static readCurrentFromCandidateFolder(File baseDir, String candidate) {
        def versionFiles = new File(baseDir, candidate).listFiles()
        def currentSymlinkPath = versionFiles.find { it.name == "current" }?.absolutePath
        currentSymlinkPath ? Files.readSymbolicLink(Paths.get(currentSymlinkPath)).fileName : ""
    }

    static prepareStubInstallDir(String counter) {
        def baseDir = "$DEFAULT_BASE_DIR/stub-install-$counter" as File
        baseDir.mkdirs()
        baseDir
    }

    static prepareSdkmanDir(String counter) {
        def sdkmanDir = defineSdkmanDir(counter) as File
        sdkmanDir.mkdirs()
        sdkmanDir
    }

    static defineSdkmanDir(String counter) {
        "$DEFAULT_BASE_DIR/sdkman-$counter"
    }

    static prepareSdkmanDir() {
        def counter = defineCounterForSdkmanDir()
        prepareSdkmanDir(counter)
    }

    static defineCounterForSdkmanDir() {
        "${(Math.random() * 10000).toInteger()}".padLeft(4, "0")
    }

    static prepareCandidateWithVersionFolder(String baseDir, String candidate, String version) {
        def directory = "$baseDir/$candidate/$version"
        prepareCandidateBinFolder directory, candidate, version
    }

    @Deprecated
    static prepareLocalCandidateWithVersionFolder(String baseDir, String candidate, String version){
        prepareCandidateBinFolder baseDir, candidate, version
    }

    private static prepareCandidateBinFolder(String folder, String candidate, String version) {
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
