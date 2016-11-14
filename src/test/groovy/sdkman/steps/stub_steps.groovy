package sdkman.steps

import cucumber.api.PendingException
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
    if (candidate == "java") {
        primeEndpointWithString("/hooks/post/$candidate/${version}/${lowerCaseUname}", '''
#!/bin/bash
echo "Inside post-install hook..."
mkdir -p "$SDKMAN_DIR/tmp/out"
tar zxvf "$binary_input" -C "${SDKMAN_DIR}/tmp/out"
cd "${SDKMAN_DIR}/tmp/out"
zip -r "$zip_output" .
rm "$SDKMAN_DIR/var/cookie"
echo "Leaving post-install hook..."''')
    } else {
        //bash command
        primeEndpointWithString("/hooks/post/${candidate}/${version}/${lowerCaseUname}", 'mv $binary_input $zip_output')
    }
    primeDownloadFor(SERVICE_UP_URL, candidate, version, lowerCaseUname)
}

And(~/^a cookie is required for installing "(.*)" "(.*)" on "(.*)"$/) { String candidate, String version, String platform ->
    String lowerCaseUname = UnixUtils.asUname(platform).toLowerCase()
    primeEndpointWithString("/hooks/pre/${candidate}/${version}/${lowerCaseUname}", """
#!/bin/bash
echo "Inside pre-install hook..."
cookie="\$SDKMAN_DIR/var/cookie"
if [[ -f "\$cookie" ]]; then rm "\$cookie"; fi
echo "oraclelicense=accept-securebackup-cookie" > "\$cookie"
echo "Dropped cookie..."
""")
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