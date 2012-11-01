import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

When(~'^I enter \"([^\"]*)\"$') { String command ->
	command = "$scriptPath/$command"
    proc = command.execute()
	proc.out.close()
    proc.waitFor()
    result = proc.text
}

When(~'^I enter "([^"]*)" and answer "([^"]*)"$') { String command, String answer ->
	command = "$scriptPath/$command"
    proc = command.execute()
	def writer = new PrintWriter(proc.out)
	writer.println answer
	writer.close()
    proc.waitFor()
    result = proc.text
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
