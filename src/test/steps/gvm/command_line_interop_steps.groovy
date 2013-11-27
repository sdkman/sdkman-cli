package gvm

import static cucumber.api.groovy.EN.*

And(~'^I enter \"([^\"]*)\"$') { String command ->
	bash.execute(command)
    result = bash.output
}

And(~'^I enter "([^"]*)" and answer "([^"]*)"$') { String command, String answer ->
	bash.execute(command, [answer])
    result = bash.output
}

And(~'^I see \"([^\"]*)\"$') { String output ->
    assert result.contains(output)
}

And(~'^I do not see "([^"]*)"$') { String output ->
	assert ! result.contains(output)
}

And(~'^I see only \"([^\"]*)\"$') { String output ->
    assert result?.replaceAll("\\n", "") == output
}

And(~'^the exit status is zero$') {->
    assert bash.status == 0
}

And(~'^the exit status is non-zero$') {->
    assert bash.status != 0
}

And(~'^I see the current gvm version$') {->
    assert result.contains("Groovy enVironment Manager")
}

And(~'^I see a single occurrence of \"([^\"]*)\"$') { String occurrence ->
    assert result.count(occurrence) == 1
}