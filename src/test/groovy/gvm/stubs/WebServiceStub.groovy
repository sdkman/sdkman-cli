package gvm.stubs

import static com.github.tomakehurst.wiremock.client.WireMock.*

class WebServiceStub {

    static primeEndpoint(String endpoint, String body) {
        stubFor(get(urlEqualTo(endpoint))
            .willReturn(aResponse()
                .withStatus(200)
                .withHeader("Content-Type", "text/plain")
                .withBody(body)
            )
        )
    }

    static primeDownloadFor(String candidate, String version) {
        stubFor(get(urlEqualTo("/download/${candidate}/${version}?platform=Linux"))
                .willReturn(aResponse()
                .withHeader("Location", "http://localhost:8081/${candidate}-${version}.zip")
                .withStatus(302)))

        def binary = "${candidate}-${version}.zip"
        stubFor(get(urlEqualTo("/$binary"))
                .willReturn(aResponse()
                .withStatus(200)
                .withHeader("Content-Type", "application/zip")
                .withBodyFile(binary)))
    }

}
