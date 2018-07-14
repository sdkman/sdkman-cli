package sdkman.steps

import cucumber.api.DataTable
import sdkman.support.UnixUtils

import static cucumber.api.groovy.EN.And
import static sdkman.stubs.HookResponses.*
import static sdkman.stubs.WebServiceStub.*
import static sdkman.support.FilesystemUtils.readCurrentFromCandidateFolder
import static sdkman.support.FilesystemUtils.readVersionsCsvFromCandidateFolder

And(~'^the default "([^"]*)" version is "([^"]*)"$') { String candidate, String version ->
    primeEndpointWithString("/candidates/default/${candidate}", version)
    primeDownloadFor(SERVICE_UP_URL, candidate, version, PLATFORM)
    primeEndpointWithString("/hooks/pre/${candidate}/${version}/${PLATFORM}", preInstallationHookSuccess())
    primeEndpointWithString("/hooks/post/${candidate}/${version}/${PLATFORM}", postInstallationHookSuccess())
}

And(~'^an available selfupdate$') { ->
    primeEndpointWithString("/selfupdate?beta=false", 'echo "Successfully upgraded SDKMAN."')
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is available for download$') { String candidate, String version ->
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${PLATFORM}", "valid")
    primeDownloadFor(SERVICE_UP_URL, candidate, version, PLATFORM)
    primeEndpointWithString("/hooks/pre/${candidate}/${version}/${PLATFORM}", preInstallationHookSuccess())
    primeEndpointWithString("/hooks/post/${candidate}/${version}/${PLATFORM}", postInstallationHookSuccess())
}

And(~/^the appropriate universal hooks are available for "([^"]*)" version "([^"]*)" on "([^"]*)"$/) { String candidate, String version, String platform ->
    String lowerCaseUname = UnixUtils.asSdkmanPlatform(platform).toLowerCase()
    primeUniversalHookFor("pre", candidate, version, lowerCaseUname)
    primeUniversalHookFor("post", candidate, version, lowerCaseUname)
}

And(~/^the appropriate multi-platform hooks are available for "([^"]*)" version "([^"]*)" on "([^"]*)"$/) { String candidate, String version, String platform ->
    String lcPlatform = UnixUtils.asSdkmanPlatform(platform).toLowerCase()
    primePlatformSpecificHookFor("pre", candidate, version, lcPlatform)
    primePlatformSpecificHookFor("post", candidate, version, lcPlatform)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not available for download$') { String candidate, String version ->
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${PLATFORM}", "invalid")
}

And(~/^the candidate java version "([^"]*)" is available for download on "([^"]*)"$/) { String version, String platform ->
    String lowerCaseUname = UnixUtils.asSdkmanPlatform(platform).toLowerCase()
    primeEndpointWithString("/candidates/validate/java/${version}/${lowerCaseUname}", "valid")
}

And(~/^the candidate "(.*)" version "(.*)" is available for download on "(.*)"$/) { String candidate, String version, String platform ->
    String lcPlatform = UnixUtils.asSdkmanPlatform(platform).toLowerCase()
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${lcPlatform}", "valid")
    primeDownloadFor(SERVICE_UP_URL, candidate, version, lcPlatform)
}

And(~/^a "([^"]*)" install hook is served for "([^"]*)" "([^"]*)" on "([^"]*)" that returns successfully$/) { String phase, String candidate, String version, String platform ->
    primeEndpointWithString("/hooks/${phase}/${candidate}/${version}/${PLATFORM}", phase == "pre" ? preInstallationHookSuccess() : postInstallationHookSuccess())
}

And(~/^a "([^"]*)" install hook is served for "([^"]*)" "([^"]*)" on "([^"]*)" that returns a failure$/) { String phase, String candidate, String version, String platform ->
    primeEndpointWithString("/hooks/${phase}/${candidate}/${version}/${PLATFORM}", phase == "pre" ? preInstallationHookFailure() : postInstallationHookFailure())
}

And(~/^the candidate "(.*?)" version "(.*?)" is not available for download on "(.*?)"$/) { String candidate, String version, String platform ->
    String lowerCaseUname = UnixUtils.asSdkmanPlatform(platform).toLowerCase()
    primeEndpointWithString("/candidates/validate/${candidate}/${version}/${lowerCaseUname}", "invalid")
}

And(~'^a "([^"]*)" list view is available for consumption$') { String candidate ->
    primeEndpointWithString("/candidates/${candidate}/${UnixUtils.platform}/versions/list?current=&installed=", "Available ${candidate.capitalize()} Versions")
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
    def url = "/candidates/${candidate}/${UnixUtils.platform}/versions/list?current=${current}&installed=${versions}"
    println("Priming url: $url")
    primeEndpointWithString(url, "Candidate: $candidate; Versions: $versions; Current: $current; Platform: ${UnixUtils.platform}")
}

And(~/^The candidate list is available$/) { ->
    primeEndpointWithString("/candidates/list", "Candidate List")
}

And(~/^a download request was made for "(.*)" "(.*)" on "(.*)" with cookie "(.*)"$/) { String candidate, String version, String platform, String cookie ->
    String lowerCaseUname = UnixUtils.asSdkmanPlatform(platform).toLowerCase()
    def cookieName = cookie.tokenize("=").first()
    def cookieValue = cookie.tokenize("=").last()
    verifyDownloadFor(candidate, version, lowerCaseUname, cookieName, cookieValue)
}

And(~/^a cookie is required for installing "(.*)" "(.*)" on "(.*)"$/) { String candidate, String version, String platform ->
    //handled by the hook in subsequent step
}

And(~/^the following candidates are currently available from remote API:$/) { DataTable dt ->
    primeEndpointWithString("/candidates/all", dt.asList(String).drop(1).join(","))
}