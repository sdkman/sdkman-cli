package sdkman.steps

import java.nio.file.Path

import static cucumber.api.groovy.EN.And
import static java.nio.file.Files.createSymbolicLink
import static java.nio.file.Files.exists
import static java.nio.file.Files.isSameFile
import static java.nio.file.Files.isSymbolicLink

And(~'^the candidate "([^"]*)" version "([^"]*)" is in use$') { String candidate, String version ->
	Path current = candidatesDir.toPath().resolve("${candidate}/current")
	if (!exists(current)) {
		assert createSymbolicLink(current, current.parent.resolve(version))
	}
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not in use$') { String candidate, String version ->
	Path current = candidatesDir.toPath().resolve("${candidate}/current")
	if (exists(current)) {
		assert ! isSameFile(current, current.parent.resolve(version))
	}
}

And(~'^the candidate "([^"]*)" version "([^"]*)" should be in use$') { String candidate, String version ->
	bash.execute("$candidate --version")
	assert bash.output.contains(version)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" should be the default$') { String candidate, String version ->
	Path current = candidatesDir.toPath().resolve("${candidate}/current")
	assert isSameFile(current, current.parent.resolve(version))
}

And(~'^the candidate "([^"]*)" version "([^"]*)" should not be the default$') { String candidate, String version ->
	Path current = candidatesDir.toPath().resolve("${candidate}/current")
	Path directory = current.parent.resolve(version)
	assert (!isSymbolicLink(current) || (isSymbolicLink(current) && !isSameFile(current, directory)))
}

And(~'^the candidate "([^"]*)" is no longer selected$') { String candidate ->
	assert ! exists(candidatesDir.toPath().resolve("${candidate}/current"))
}
