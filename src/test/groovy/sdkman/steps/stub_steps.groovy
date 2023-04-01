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
	primeDownloadFor(SERVICE_UP_URL, candidate, version, UnixUtils.inferPlatform())
	primeEndpointWithString("/hooks/post/${candidate}/${version}/${UnixUtils.inferPlatform()}", postInstallationHookSuccess())
}

And(~'^an available selfupdate endpoint$') { ->
	primeEndpointWithString("/selfupdate/stable/${UnixUtils.inferPlatform()}", 'echo "Successfully upgraded SDKMAN."')
	primeEndpointWithString("/selfupdate/beta/${UnixUtils.inferPlatform()}", 'echo "Successfully upgraded SDKMAN."')
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is available for download$') { String candidate, String version ->
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${UnixUtils.inferPlatform()}", "valid")
	primeDownloadFor(SERVICE_UP_URL, candidate, version, UnixUtils.inferPlatform())
	primeEndpointWithString("/hooks/post/${candidate}/${version}/${UnixUtils.inferPlatform()}", postInstallationHookSuccess())
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is available for download with checksum "([^"]*)" using algorithm "([^"]*)"$') { 
	String candidate, String version, String checksum, String algorithm ->
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${UnixUtils.inferPlatform()}", "valid")
	primeDownloadFor(SERVICE_UP_URL, candidate, version, UnixUtils.inferPlatform(), ["X-Sdkman-Checksum-${algorithm}": "${checksum}"])
	primeEndpointWithString("/hooks/post/${candidate}/${version}/${UnixUtils.inferPlatform()}", postInstallationHookSuccess())
}

And(~/^the appropriate universal hook is available for "([^"]*)" version "([^"]*)" on "([^"]*)"$/) { String candidate, String version, String os ->
	String lcPlatform = UnixUtils.inferPlatform(os)
	primeUniversalHookFor(candidate, version, lcPlatform)
}

And(~/^the appropriate multi-platform hook is available for "([^"]*)" version "([^"]*)" on "([^"]*)" with architecture "(.*)"$/) { String candidate, String version, String os, String architecture ->
	String lcPlatform = UnixUtils.inferPlatform(os, architecture)
	primePlatformSpecificHookFor(candidate, version, lcPlatform)
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not available for download$') { String candidate, String version ->
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${UnixUtils.inferPlatform()}", "invalid")
}

And(~/^the candidate "(.*)" version "(.*)" is available for download on "(.*)" with architecture "(.*)"$/) { String candidate, String version, String os, String architecture ->
	String lcPlatform = UnixUtils.inferPlatform(os, architecture)
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${lcPlatform}", "valid")
	primeDownloadFor(SERVICE_UP_URL, candidate, version, lcPlatform)
}

And(~/^a post-installation hook is served for "([^"]*)" "([^"]*)" on "([^"]*)" with architecture "([^"]*)" that returns successfully$/) { String candidate, String version, String os, String architecture ->
	String lcPlatform = UnixUtils.inferPlatform(os, architecture)
	primeEndpointWithString("/hooks/post/${candidate}/${version}/${lcPlatform}", postInstallationHookSuccess())
}

And(~/^a post-installation hook is served for "([^"]*)" "([^"]*)" on "([^"]*)" with architecture "([^"]*)" that returns a failure$/) { String candidate, String version, String os, String architecture ->
	String lcPlatform = UnixUtils.inferPlatform(os, architecture)
	primeEndpointWithString("/hooks/post/${candidate}/${version}/${lcPlatform}", postInstallationHookFailure())
}

And(~/^the candidate "(.*?)" version "(.*?)" is not available for download on "(.*?)"$/) { String candidate, String version, String os ->
	String lcPlatform = UnixUtils.inferPlatform(os)
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${lcPlatform}", "invalid")
}

And(~'^a "([^"]*)" list view is available for consumption$') { String candidate ->
	primeEndpointWithString("/candidates/${candidate}/${UnixUtils.inferPlatform()}/versions/list?current=&installed=", "Available ${candidate.capitalize()} Versions")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is a valid candidate version$') { String candidate, String version ->
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${UnixUtils.inferPlatform()}", "valid")
}

And(~'^the candidate "([^"]*)" version "([^"]*)" is not a valid candidate version$') { String candidate, String version ->
	primeEndpointWithString("/candidates/validate/${candidate}/${version}/${UnixUtils.inferPlatform()}", "invalid")
}

And(~/^the candidate "(.*?)" has a version list available$/) { String candidate ->
	def current = readCurrentFromCandidateFolder(candidatesDir, candidate)
	def versions = readVersionsCsvFromCandidateFolder(candidatesDir, candidate)
	def url = "/candidates/${candidate}/${UnixUtils.inferPlatform()}/versions/list?current=${current}&installed=${versions}"
	println("Priming url: $url")
	primeEndpointWithString(url, "Candidate: $candidate; Versions: $versions; Current: $current; Platform: ${UnixUtils.inferPlatform()}")
}

And(~/^The candidate list is available$/) { ->
	primeEndpointWithString("/candidates/list", "Candidate List")
}

And(~/^the following candidates are currently available from remote API:$/) { DataTable dt ->
	primeEndpointWithString("/candidates/all", dt.asList(String).drop(1).join(","))
}
