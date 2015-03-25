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

And(~'^I see the current gvm version$') {->
    assert result.contains("Groovy enVironment Manager")
}

And(~'^I see a single occurrence of \"([^\"]*)\"$') { String occurrence ->
    assert result.count(occurrence) == 1
}

And(~'^I see a sorted table of versions$') { ->
    def versions = result.readLines().findAll {
        it.startsWith(' ')
    }.collect {
        it.trim().tokenize(' ')
    }.flatten().findAll { it }

    def sorted = versions.sort(false) { b, a ->
        [a, b].collect { v ->
            //["2.3.5", "2.3.11"] => [[2,3,5],[2,3,11]]
            v.tokenize('.').collect { toInt(it) }
        }.transpose().findResult { ta, tb ->
            // [[2,3,5],[2,3,11]].transpose() => [[2, 2], [3, 3], [5, 11]]
            // compare versions major,minor,micro return first non-zero
            ta <=> tb ?: null
        }
    }
    assert versions == sorted
}
