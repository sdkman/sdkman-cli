package sdkman.stubs

import static com.github.tomakehurst.wiremock.client.WireMock.*

class WebServiceStub {

    static primeEndpoint(String endpoint, String body) {
        stubFor(get(urlEqualTo(endpoint)).willReturn(
            aResponse()
                .withStatus(200)
                .withHeader("Content-Type", "text/plain")
                .withBody(body)))
    }

    static primeDownloadFor(String host, String candidate, String version, String platform) {
        stubFor(get(urlEqualTo("/download/${candidate}/${version}?platform=${platform}")).willReturn(
            aResponse()
                .withHeader("Location", "${host}/${candidate}-${version}.zip")
                .withStatus(302)))

        def binary = "${candidate}-${version}.zip"
        primeZipEndpoint("/$binary", binary)
    }

    static primeSelfupdate() {
        primePlainFileEndpoint("/selfupdate", "selfupdate.sh")
    }

    static primeFileEndpoint(String endpoint, String filePath, String contentType) {
        stubFor(get(urlEqualTo(endpoint)).willReturn(
                aResponse()
                        .withStatus(200)
                        .withHeader("Content-Type", contentType)
                        .withBodyFile(filePath)))
    }

    static primeZipEndpoint(String endpoint, String filePath) {
        primeFileEndpoint(endpoint, filePath, "application/zip")
    }

    static primePlainFileEndpoint(String endpoint, String filePath) {
        primeFileEndpoint(endpoint, filePath, "text/plain")
    }

}
