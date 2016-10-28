package sdkman.support

class UnixUtils {
    static getPlatform() {
        asUname(System.getProperty("os.name"))
    }

    static asUname(platform) {
        def result
        switch (platform) {
            case "Mac OSX":
                result = "Darwin"
                break
            case "Linux":
                result = "Linux"
                break
            case "FreeBSD":
                result = "FreeBSD"
                break
            default:
                result = platform
        }
        result
    }
}
