package sdkman.stubs

import sdkman.support.UnixUtils

import static com.github.tomakehurst.wiremock.client.WireMock.*

class WebServiceStub {

    static primeEndpointWithString(String endpoint, String body) {
        stubFor(get(urlEqualTo(endpoint)).willReturn(
                aResponse()
                        .withStatus(200)
                        .withHeader("Content-Type", "text/plain")
                        .withBody(body)))
    }

    static primeUniversalHookFor(String phase, String candidate, String version, String platform) {
        primeHookFor(phase, candidate, version, platform, true)
    }

    static primePlatformSpecificHookFor(String phase, String candidate, String version, String platform) {
        primeHookFor(phase, candidate, version, platform, false)
    }

    private static primeHookFor(String phase, String candidate, String version, String platform, boolean universal = true) {
        String lowerCaseUname = UnixUtils.asUname(platform).toLowerCase()
        stubFor(get(urlEqualTo("/hooks/$phase/$candidate/$version/$lowerCaseUname")).willReturn(
                aResponse()
                        .withStatus(200)
                        .withHeader("Content-Type", "text/plain")
                        .withBodyFile("hooks/${phase}_hook_${candidate}_${version}_${universal ? 'universal' : lowerCaseUname}.sh")))
    }

    static primeDownloadFor(String host, String candidate, String version, String platform) {
        def binary = (candidate == "java") ? "jdk-${version}-linux-x64.tar.gz" : "${candidate}-${version}.zip"
        stubFor(get(urlEqualTo("/broker/download/${candidate}/${version}/${platform}")).willReturn(
                aResponse()
                        .withHeader("Location", "${host}/${binary}")
                        .withStatus(302)))

        stubFor(get(urlEqualTo("/$binary")).willReturn(
                aResponse()
                        .withStatus(200)
                        .withHeader("Content-Type", "application/zip")
                        .withBodyFile(binary)))
    }

    static verifyDownloadFor(String candidate, String version, String platform, String cookieName, String cookieValue) {
        verify(getRequestedFor(urlEqualTo("/broker/download/${candidate}/${version}/${platform}"))
                .withCookie(cookieName, matching(cookieValue)))
    }

    static primeSelfupdate() {
        stubFor(get(urlEqualTo("/selfupdate?beta=false")).willReturn(
                aResponse()
                        .withStatus(200)
                        .withHeader("Content-Type", "text/plain")
                        .withBodyFile("selfupdate.sh")))
    }

}
