package sdkman.steps

import io.cucumber.datatable.DataTable

import static cucumber.api.groovy.EN.And

And(~/^the following candidates are available for installation in local cache:$/) { DataTable dt ->
	localCandidates = dt.asList(String).drop(1)
}

And(~/^the Candidates cache should contain "(.*)"$/) { String candidates ->
	assert candidatesFile.text.trim() == candidates
}
