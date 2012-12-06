package gvm

class BashEnv {

    static final PROMPT = ">"
    static final EXIT_CODE_CMD = 'echo "Exit code is: $?"'
    static final EXIT_CODE_PATTERN = ~/Exit code is: (\d+)\s*${PROMPT}?$/

    private final Object outputLock = new Object()
    
    def exitCode
    def process
    def processOutput = new StringBuilder()

    // Command timeout in milliseconds
    def timeout = 5000
    def workDir
    def env

    BashEnv(workDir, Map env) {
        this.workDir = workDir as File

        env = env + [PS1: PROMPT]
        this.env = env.collect { k, v -> k + '=' + v }
    }
    
    void start() {
        process = ["bash", "--noprofile", "--norc", "-i"].execute(env, workDir)

        consumeProcessStream(process.inputStream)
        consumeProcessStream(process.errorStream)
    }
    
    void stop() {
        execute("exit")
        process.waitFor()
    }
    
    void execute(String cmdline, List inputs = []) {
        resetOutput()

        if (cmdline != "exit") {
            exitCode = null
        }

        process.outputStream << cmdline << "\n"
        process.outputStream.flush()

        if (cmdline != "exit") {
            for (input in inputs) {
                process.outputStream << input << "\n"
            }
            process.outputStream << EXIT_CODE_CMD << "\n"
            process.outputStream.flush()
        }
        
        def start = System.currentTimeMillis()
        while (cmdline != "exit") {
            
            synchronized (outputLock) {
                // Remove all the extraneous text that's not related to the
                // command's output. This includes the command string itself,
                // the 'echo' command to display the command's exit code, and
                // the exit code line.
                removeFromOutput(cmdline + "\n")
                removeFromOutput(PROMPT + EXIT_CODE_CMD + "\n")

                def str = processOutput.toString()
                def m = EXIT_CODE_PATTERN.matcher(str)
                if (m) {
                    exitCode = m[0][1]

                    // Remove this exit code line from the output.
                    processOutput = new StringBuilder(m.replaceAll(''))
                    break
                }

                // If the command times out, we should break out of the loop and
                // display whatever output has already been produced.
                if (System.currentTimeMillis() - start > timeout) {
                    processOutput = new StringBuilder("ALERT! Command timed out. " +
                            "Last output was:\n\n${processOutput}")
                    break
                }
            }

            Thread.sleep 500
        }
    }
    
    int getStatus() {
        if (!exitCode) throw new IllegalStateException("Did you run execute() before getting the status?")
        return exitCode.toInteger()
    }
    
    String getOutput() {
        synchronized (outputLock) {
            return processOutput.toString()
        }
    }
    
    void resetOutput() {
        synchronized (outputLock) {
            processOutput = new StringBuilder()
        }
    }

    private void consumeProcessStream(final InputStream stream) {
        char[] buffer = new char[256]
        Thread.start {
            def reader = new InputStreamReader(stream)
            def charsRead = 0
            while (charsRead != -1) {
                charsRead = reader.read(buffer, 0, 256)
                if (charsRead > 0) {
                    synchronized (outputLock) {
                        processOutput.append(buffer, 0, charsRead)
                    }
                }
            }
        }
    }

    private void removeFromOutput(String line) {
        def pos = processOutput.indexOf(line)
        if (pos != -1) {
            processOutput.delete(pos, pos + line.size() - 1)
        }
    }
}
