package gvm


class TestUtils {
    static File prepareBaseDir() {
        def counter = "${(Math.random() * 10000).toInteger()}".padLeft(4, "0")
        def baseDir = "build/base/gvm-$counter" as File
        baseDir.mkdirs()
        baseDir
    }
}
