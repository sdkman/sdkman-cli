package gvm

import static cucumber.runtime.groovy.EN.*

When(~'^I enter \"([^\"]*)\"$') { String command ->
	bash.execute(command)
    result = bash.output
}

When(~'^I enter "([^"]*)" and answer "([^"]*)"$') { String command, String answer ->
	bash.execute(command, [answer])
    result = bash.output
}

Then(~'^I see \"([^\"]*)\"$') { String output ->
    display output
    assert result.contains(output)
}

Then(~'^I do not see "([^"]*)"$') { String output ->
    display output
	assert ! result.contains(output)
}

Then(~'^I see only \"([^\"]*)\"$') { String output ->
    display output
    assert result?.replaceAll("\\n", "") == output
}

Then(~'^the exit value is \"([^\"]*)\"$') { int exitValue ->
    assert bash.status == exitValue
}

Then(~'^I see the current gvm version$') { ->
    assert result.contains("Groovy enVironment Manager")
}

private display(String output) {
    println "Specify: $output"
    println "Actual: $result"
}
