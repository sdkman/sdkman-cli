package sdkman.steps

import io.cucumber.datatable.DataTable
import sdkman.support.UnixUtils

import static cucumber.api.groovy.EN.And
import static sdkman.stubs.HookResponses.*
import static sdkman.stubs.WebServiceStub.*
import static sdkman.support.FilesystemUtils.readCurrentFromCandidateFolder
import static sdkman.support.FilesystemUtils.readVersionsCsvFromCandidateFolder

And(~'^the default "([^"]*)" version is "([^"]*)"$') { String candidate, String version ->
	primeEndpointWithString("/candidates/default/${candidate}", version)
	primeDownloadFor(SERVICE_UP_URL, candidate, version, UnixUtils.asSdkmanPlatform())
	primeEndpointWithString("/hooks/pre/${candidate}/${version}/${UnixUtils.asSdkmanPlatform()}", preInstallationHookSuccess())
	primeEndpointWithString("/hooks/post/${candidate}/${version}/${UnixUtils.asSdkmanPlatform()}", postInstallationHookSuccess())
}

And(~'^an available selfupdate$') { ->
	primeEndpointWithString("/selfupdate?beta=false", 'echo "Successfully upgraded SDKMAN."')
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is available for download$') { String candidate, String version ->
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${UnixUtils.asSdkmanPlatform()}", "valid")
	primeDownloadFor(SERVICE_UP_URL, candidate, version, UnixUtils.asSdkmanPlatform())
	primeEndpointWithString("/hooks/pre/${candidate}/${version}/${UnixUtils.asSdkmanPlatform()}", preInstallationHookSuccess())
	primeEndpointWithString("/hooks/post/${candidate}/${version}/${UnixUtils.asSdkmanPlatform()}", postInstallationHookSuccess())
}

And(~/^the appropriate universal hooks are available for "([^"]*)" version "([^"]*)" on "([^"]*)"$/) { String candidate, String version, String platform ->
	String lcPlatform = UnixUtils.asSdkmanPlatform(platform)
	primeUniversalHookFor("pre", candidate, version, lcPlatform)
	primeUniversalHookFor("post", candidate, version, lcPlatform)
}

And(~/^the appropriate multi-platform hooks are available for "([^"]*)" version "([^"]*)" on "([^"]*)" with architecture "(.*)"$/) { String candidate, String version, String platform, String architecture ->
	String lcPlatform = UnixUtils.asSdkmanPlatform(platform, architecture)
	primePlatformSpecificHookFor("pre", candidate, version, lcPlatform)
	primePlatformSpecificHookFor("post", candidate, version, lcPlatform)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not available for download$') { String candidate, String version ->
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${UnixUtils.asSdkmanPlatform()}", "invalid")
}

And(~/^the candidate "(.*)" version "(.*)" is available for download on "(.*)" with architecture "(.*)"$/) { String candidate, String version, String platform, String architecture ->
	String lcPlatform = UnixUtils.asSdkmanPlatform(platform, architecture)
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${lcPlatform}", "valid")
	primeDownloadFor(SERVICE_UP_URL, candidate, version, lcPlatform)
}

And(~/^a "([^"]*)" install hook is served for "([^"]*)" "([^"]*)" on "([^"]*)" with architecture "([^"]*)" that returns successfully$/) { String phase, String candidate, String version, String platform, String architecture ->
	String lcPlatform = UnixUtils.asSdkmanPlatform(platform, architecture)
	primeEndpointWithString("/hooks/${phase}/${candidate}/${version}/${lcPlatform}", phase == "pre" ? preInstallationHookSuccess() : postInstallationHookSuccess())
}

And(~/^a "([^"]*)" install hook is served for "([^"]*)" "([^"]*)" on "([^"]*)" with architecture "([^"]*)" that returns a failure$/) { String phase, String candidate, String version, String platform, String architecture ->
	String lcPlatform = UnixUtils.asSdkmanPlatform(platform, architecture)
	primeEndpointWithString("/hooks/${phase}/${candidate}/${version}/${lcPlatform}", phase == "pre" ? preInstallationHookFailure() : postInstallationHookFailure())
}

And(~/^the candidate "(.*?)" version "(.*?)" is not available for download on "(.*?)"$/) { String candidate, String version, String platform ->
	String lcPlatform = UnixUtils.asSdkmanPlatform(platform)
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${lcPlatform}", "invalid")
}

And(~'^a "([^"]*)" list view is available for consumption$') { String candidate ->
	primeEndpointWithString("/candidates/${candidate}/${UnixUtils.asSdkmanPlatform()}/versions/list?current=&installed=", "Available ${candidate.capitalize()} Versions")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is a valid candidate version$') { String candidate, String version ->
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${UnixUtils.asSdkmanPlatform()}", "valid")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not a valid candidate version$') { String candidate, String version ->
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${UnixUtils.asSdkmanPlatform()}", "invalid")
}

And(~/^the candidate "(.*?)" has a version list available$/) { String candidate ->
	def current = readCurrentFromCandidateFolder(candidatesDir, candidate)
	def versions = readVersionsCsvFromCandidateFolder(candidatesDir, candidate)
	def url = "/candidates/${candidate}/${UnixUtils.asSdkmanPlatform()}/versions/list?current=${current}&installed=${versions}"
	println("Priming url: $url")
	primeEndpointWithString(url, "Candidate: $candidate; Versions: $versions; Current: $current; Platform: ${UnixUtils.asSdkmanPlatform()}")
}

And(~/^The candidate list is available$/) { ->
	primeEndpointWithString("/candidates/list", "Candidate List")
}

And(~/^the following candidates are currently available from remote API:$/) { DataTable dt ->
	primeEndpointWithString("/candidates/all", dt.asList(String).drop(1).join(","))
}
