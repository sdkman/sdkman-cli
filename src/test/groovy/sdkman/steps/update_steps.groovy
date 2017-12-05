package sdkman.steps

import cucumber.api.DataTable

import static cucumber.api.groovy.EN.*

And(~/^the following candidates are available for installation in local cache:$/) { DataTable dt ->
    localCandidates = dt.asList(String).drop(1)
}

And(~/^the Candidates cache should contain "(.*)"$/) { String candidates ->
    assert candidatesFile.text.trim() == candidates
}