import static cucumber.api.groovy.EN.And
import static gvm.stubs.WebServiceStub.*

And(~'^the default "([^"]*)" candidate is "([^"]*)"$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/default", version)
    primeDownloadFor(SERVICE_UP_URL, candidate, version)
}

And(~'^an available selfupdate$') { ->
    primeEndpoint("/selfupdate", 'echo "Successfully upgraded SDKman."')
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is available for download$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/${version}", "valid")
    primeDownloadFor(SERVICE_UP_URL, candidate, version)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not available for download$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/${version}", "invalid")
}

And(~'^a "([^"]*)" list view is available for consumption$') { String candidate ->
    primeEndpoint("/candidates/${candidate}/list?platform=Linux&current=&installed=", "Available ${candidate.capitalize()} Versions")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is a valid candidate version$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/${version}", "valid")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not a valid candidate version$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/${version}", "invalid")
}