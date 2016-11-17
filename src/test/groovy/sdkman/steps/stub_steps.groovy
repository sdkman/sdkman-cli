package sdkman.steps

import sdkman.support.UnixUtils

import static cucumber.api.groovy.EN.And
import static sdkman.stubs.WebServiceStub.*
import static sdkman.support.FilesystemUtils.readCurrentFromCandidateFolder
import static sdkman.support.FilesystemUtils.readVersionsCsvFromCandidateFolder

And(~'^the default "([^"]*)" candidate is "([^"]*)"$') { String candidate, String version ->
    primeEndpointWithString("/candidates/${candidate}/default", version)
    primeDownloadFor(SERVICE_UP_URL, candidate, version, PLATFORM)
    primeEndpointWithString("/hooks/post/${candidate}/${version}/${PLATFORM}", 'mv $binary_input $zip_output') //bash command
}

And(~'^an available selfupdate$') { ->
    primeEndpointWithString("/selfupdate?beta=false", 'echo "Successfully upgraded SDKMAN."')
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is available for download$') { String candidate, String version ->
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${PLATFORM}", "valid")
    primeDownloadFor(SERVICE_UP_URL, candidate, version, PLATFORM)
    primeEndpointWithString("/hooks/post/${candidate}/${version}/${PLATFORM}", 'mv $binary_input $zip_output') //bash command
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not available for download$') { String candidate, String version ->
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${PLATFORM}", "invalid")
}

And(~/^the candidate java version "([^"]*)" is available for download on "([^"]*)"$/) { String version, String platform ->
    String lowerCaseUname = UnixUtils.asUname(platform).toLowerCase()
    primeEndpointWithString("/candidates/validate/java/${version}/${lowerCaseUname}", "valid")
}

And(~/^the candidate "(.*?)" version "(.*?)" is available for download on "(.*?)"$/) { String candidate, String version, String platform ->
    String lowerCaseUname = UnixUtils.asUname(platform).toLowerCase()
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${lowerCaseUname}", "valid")
    primeDownloadFor(SERVICE_UP_URL, candidate, version, lowerCaseUname)
    if (candidate == "java")
        primePlatformSpecificHookFor("post", candidate, version, lowerCaseUname)
    else
        primeUniversalHookFor("post", candidate, version, lowerCaseUname)

}

And(~/^a cookie is required for installing "(.*)" "(.*)" on "(.*)"$/) { String candidate, String version, String platform ->
    String lowerCaseUname = UnixUtils.asUname(platform).toLowerCase()
    primePlatformSpecificHookFor("pre", candidate, version, lowerCaseUname)
}

And(~/^a "([^"]*)" install hook is served for "([^"]*)" "([^"]*)" on "([^"]*)" that returns a non-zero code$/) { String phase, String candidate, String version, String platform ->
    primeHookFor(phase, candidate, version, platform, false)
}

And(~/^the candidate "(.*?)" version "(.*?)" is not available for download on "(.*?)"$/) { String candidate, String version, String platform ->
    String lowerCaseUname = UnixUtils.asUname(platform).toLowerCase()
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${lowerCaseUname}", "invalid")
}

And(~'^a "([^"]*)" list view is available for consumption$') { String candidate ->
    primeEndpointWithString("/candidates/${candidate}/list?current=&installed=", "Available ${candidate.capitalize()} Versions")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is a valid candidate version$') { String candidate, String version ->
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${PLATFORM}", "valid")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not a valid candidate version$') { String candidate, String version ->
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${PLATFORM}", "invalid")
}

And(~/^the candidate "(.*?)" has a version list available$/) { String candidate ->
    def current = readCurrentFromCandidateFolder(candidatesDir, candidate)
    def versions = readVersionsCsvFromCandidateFolder(candidatesDir, candidate)
    def url = "/candidates/${candidate}/list?current=${current}&installed=${versions}"
    println("Priming url: $url")
    primeEndpointWithString(url, "Candidate: $candidate; Versions: $versions; Current: $current")
}

And(~/^The candidate list is available$/) { ->
    primeEndpointWithString("/candidates/list", "Candidate List")
}

And(~/^a download request was made for "(.*)" "(.*)" on "(.*)" with cookie "(.*)"$/) { String candidate, String version, String platform, String cookie ->
    String lowerCaseUname = UnixUtils.asUname(platform).toLowerCase()
    def cookieName = cookie.tokenize("=").first()
    def cookieValue = cookie.tokenize("=").last()
    verifyDownloadFor(candidate, version, lowerCaseUname, cookieName, cookieValue)
}