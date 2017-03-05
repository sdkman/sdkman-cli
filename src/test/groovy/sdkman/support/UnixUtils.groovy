package sdkman.support

class UnixUtils {
    static getPlatform() {
        asUname(System.getProperty("os.name")+arch())
    }

    static asUname(platform) {
        def result
        switch (platform) {
            case "Mac OSX":
                result = "Darwin"
                break
            case "Linux":
                result = "Linux${arch()}"
                break
            case "FreeBSD":
                result = "FreeBSD"
                break
            default:
                result = platform
        }
        result
    }

    private static arch = {
        System.getProperty("os.arch")?.endsWith("86") ? "32" : "64"
    }
}
