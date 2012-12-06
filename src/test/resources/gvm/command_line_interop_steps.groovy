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
    assert result.contains(output)
}

Then(~'^I do not see "([^"]*)"$') { String output ->
	assert ! result.contains(output)
}

Then(~'^I see only \"([^\"]*)\"$') { String output ->
    assert result?.replaceAll("\\n", "") == output
}

Then(~'^the exit value is \"([^\"]*)\"$') { int exitValue ->
    assert bash.status == exitValue
}
