import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

When(~'^I enter \"([^\"]*)\"$') { String command ->
	command = "$scriptPath/$command"
    proc = command.execute()
    proc.waitFor()
    result = "${proc.in.text}"
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
    assert proc.exitValue() == exitValue
}
