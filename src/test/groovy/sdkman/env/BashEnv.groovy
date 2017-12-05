package sdkman.env

import groovy.transform.ToString

/**
 * <p>As part of the sdkman test suite we need to launch a bash shell and execute
 * multiple commands in it. This is tricky to do using Java's support for
 * working with external processes as the API can't tell you when a command
 * has finished executing.</p>
 * <p>This class provides some hacks that allow you to serially execute commands
 * in an external bash process in a fairly reliable manner and to retrieve the
 * output of those commands.</p>
 */
@ToString(includeNames = true)
class BashEnv {

    static final PROMPT = ""
    static final EXIT_CODE_CMD = 'echo "Exit code is: $?"'
    static final EXIT_CODE_PATTERN = ~/Exit code is: (\d+)\s*${PROMPT}?$/

    private final Object outputLock = new Object()
    
    def exitCode
    def process
    def processOutput = new StringBuilder()
    def commandOutput

    // Command timeout in milliseconds
    def timeout = 5000
    def workDir
    def env

    BashEnv(workDir, Map env) {
        this.workDir = workDir as File

        def basicPath = "/usr/sbin:/usr/bin:/sbin:/bin"
        def localBinDir = "${workDir}/bin"

        def modifiedPath = "$localBinDir:$basicPath"

        env = env + [PS1: PROMPT, PATH: modifiedPath]
        this.env = env.collect { k, v -> k + '=' + v }
    }
    
    /**
     * Starts the external bash process.
     */
    void start() {
        process = ["bash", "--noprofile", "--norc", "-i"].execute(env, workDir)

        consumeProcessStream(process.inputStream)
        consumeProcessStream(process.errorStream)
    }
    
    /**
     * Stops the external bash process and waits for it to finish.
     */
    void stop() {
        execute("exit")
        process.waitFor()
    }
    
    /**
     * Sends a command line to the external bash process and returns once the
     * command has finished executing. If the command is interactive and requires
     * input during it's execution (for example a y/n answer to a question) you
     * can provide that input as a list of strings.
     */
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
            Thread.sleep 100
            
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
                    commandOutput = m.replaceAll('')
                    break
                }

                // If the command times out, we should break out of the loop and
                // display whatever output has already been produced.
                if (System.currentTimeMillis() - start > timeout) {
                    commandOutput = "ALERT! Command timed out. Last output was:\n\n${processOutput}"
                    break
                }
            }
        }
    }
    
    /**
     * Returns the exit code of the last command that was executed.
     */
    int getStatus() {
        if (!exitCode) throw new IllegalStateException("Did you run execute() before getting the status?")
        return exitCode.toInteger()
    }
    
    /**
     * Returns the text output (both stdout and stderr) of the last command
     * that was executed.
     */
    String getOutput() {
        return commandOutput
    }
    
    /**
     * Clears the saved command output.
     */
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
        synchronized (outputLock) {
            def pos = processOutput.indexOf(line)
            if (pos != -1) {
                processOutput.delete(pos, pos + line.size() - 1)
            }
        }
    }
}
