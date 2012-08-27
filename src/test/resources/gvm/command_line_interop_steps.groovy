import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

scriptPath = 'bin'

When(~'^I enter \"([^\"]*)\"$') { String command ->
	command = "$scriptPath/$command"
    proc = command.execute()
    proc.waitFor()
    result = "${proc.in.text}"
}

Then(~'^I see \"([^\"]*)\"$') { String output ->
    assert result.contains(output)
}

Then(~'^the exit value is \"([^\"]*)\"$') { int exitValue ->
    assert proc.exitValue() == exitValue
}
