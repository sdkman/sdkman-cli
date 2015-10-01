import static cucumber.api.groovy.EN.And
import static sdkman.stubs.WebServiceStub.*
import static sdkman.utils.FilesystemUtils.readCurrentFromCandidateFolder
import static sdkman.utils.FilesystemUtils.readVersionsCsvFromCandidateFolder
import static sdkman.utils.UnixUtils.platform

And(~'^the default "([^"]*)" candidate is "([^"]*)"$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/default", version)
    primeDownloadFor(SERVICE_UP_URL, candidate, version, platform)
}

And(~'^an available selfupdate$') { ->
    primeEndpoint("/selfupdate", 'echo "Successfully upgraded SDKMAN."')
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is available for download$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/${version}", "valid")
    primeDownloadFor(SERVICE_UP_URL, candidate, version, platform)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not available for download$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/${version}", "invalid")
}

And(~'^a "([^"]*)" list view is available for consumption$') { String candidate ->
    primeEndpoint("/candidates/${candidate}/list?platform=$platform&current=&installed=", "Available ${candidate.capitalize()} Versions")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is a valid candidate version$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/${version}", "valid")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not a valid candidate version$') { String candidate, String version ->
    primeEndpoint("/candidates/${candidate}/${version}", "invalid")
}

And(~/^the candidate "(.*?)" has a version list available$/) { String candidate ->
    def current = readCurrentFromCandidateFolder(sdkmanDir, candidate)
    def versions = readVersionsCsvFromCandidateFolder(sdkmanDir, candidate)
    def url = "/candidates/${candidate}/list?platform=$platform&current=${current}&installed=${versions}"

    primeEndpoint(url, "Candidate: $candidate; Versions: $versions; Current: $current")
}
