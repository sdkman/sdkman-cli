package sdkman.env

import groovy.transform.ToString
import java.util.regex.Matcher
import java.util.regex.Pattern

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

	static final String  PROMPT            = ""
	static final String  EXIT_CODE_CMD     = 'echo "Exit code is: $?"'
	static final Pattern EXIT_CODE_PATTERN = ~/Exit code is: (\d+)\s*${PROMPT}?$/


	private final Object outputLock = new Object()


	String        exitCode
	Process       process
	StringBuilder processOutput = new StringBuilder()
	String        commandOutput

	// Command timeout in milliseconds
	long     timeout = 60_000
	File     workDir
	String[] env


	BashEnv(final workDir, final Map env) {
		this.workDir = workDir as File

		final String basicPath = "/usr/sbin:/usr/bin:/sbin:/bin"
		final String localBinDir = "${workDir}/bin"

		final String modifiedPath = "$localBinDir:$basicPath"

		this.env = (env + [PS1: PROMPT, PATH: modifiedPath]).collect {final k, final v -> k + '=' + v}
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
	void execute(final String cmdline, final List inputs = []) {
		resetOutput()

		if (cmdline == "exit") {
			process.outputStream << cmdline << "\n"
			process.outputStream.flush()
			return
		}

		exitCode = null

		process.outputStream << cmdline << "\n"
		process.outputStream.flush()

		for (final input in inputs) {
			process.outputStream << input << "\n"
		}

		process.outputStream << EXIT_CODE_CMD << "\n"
		process.outputStream.flush()

		final long start = System.currentTimeMillis()
		while (timeout >= System.currentTimeMillis() - start) {
			Thread.sleep 100

			synchronized (outputLock) {
				// Remove all the extraneous text that's not related to the
				// command's output. This includes the command string itself,
				// the 'echo' command to display the command's exit code, and
				// the exit code line.
				removeFromOutput(cmdline + "\n")
				removeFromOutput(PROMPT + EXIT_CODE_CMD + "\n")

				final Matcher m = EXIT_CODE_PATTERN.matcher(processOutput.toString())
				if (m) {
					exitCode = m[0][1]

					// Remove this exit code line from the output.
					commandOutput = m.replaceAll('')
					return
				}
			}
		}

		// If the command timed out, display whatever output has already been produced.
		commandOutput = "ALERT! Command timed out. Last output was:\n\n${processOutput}"
	}

	/**
	 * Returns the exit code of the last command that was executed.
	 */
	int getStatus() {
		if (!exitCode) {
			throw new IllegalStateException("Did you run execute() before getting the status?")
		}
		return exitCode.toInteger()
	}

	/**
	 * Returns the text output (both stdout and stderr) of the last command
	 * that was executed.
	 */
	String getOutput() {
		commandOutput
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
		final char[] buffer = new char[256]
		Thread.start {
			final InputStreamReader reader = new InputStreamReader(stream)
			int charsRead = 0
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

	private void removeFromOutput(final String line) {
		synchronized (outputLock) {
			final int pos = processOutput.indexOf(line)
			if (pos != -1) {
				processOutput.delete(pos, pos + line.size() - 1)
			}
		}
	}
}
