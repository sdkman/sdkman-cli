package sdkman.support

class UnixUtils {
    static getPlatform() {
        def osName = System.getProperty("os.name")
        switch (osName) {
            case "Mac OS X":
                "Darwin"
                break
            default:
                osName
                break
        }
    }
}
