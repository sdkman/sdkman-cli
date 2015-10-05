package sdkman.utils

class UnixUtils {
    def static platform
    static {
        def uname = 'def proc = "uname".execute();' +
                ' proc.waitFor(); ' +
                'proc.in.text';
        platform = new GroovyShell().evaluate(uname).trim()
    }

    static getPlatform() {
        return platform
    }
}
