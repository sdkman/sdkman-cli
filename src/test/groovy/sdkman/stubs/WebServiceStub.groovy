package sdkman.stubs

import static com.github.tomakehurst.wiremock.client.WireMock.*

class WebServiceStub {

	static primeEndpointWithString(String endpoint, String body) {
		stubFor(get(urlEqualTo(endpoint)).willReturn(
				aResponse()
						.withStatus(200)
						.withHeader("Content-Type", "text/plain")
						.withBody(body)))
	}

	static primeUniversalHookFor(String candidate, String version, String platform) {
		primeHookFor(candidate, version, platform, true)
	}

	static primePlatformSpecificHookFor(String candidate, String version, String platform) {
		primeHookFor(candidate, version, platform, false)
	}

	private static primeHookFor(String candidate, String version, String platform, boolean universal = true) {
		def hookFile = "hooks/post_hook_${candidate}_${version}_${universal ? 'universal' : platform}.sh"
		stubFor(get(urlEqualTo("/hooks/post/$candidate/$version/$platform")).willReturn(
				aResponse()
						.withStatus(200)
						.withHeader("Content-Type", "text/plain")
						.withBodyFile(hookFile)))
	}

	static primeDownloadFor(String host, String candidate, String version, String platform) {
		primeDownloadFor(host, candidate, version, platform, [:])
	}
	
	static primeDownloadFor(String host, String candidate, String version, String platform, Map<String, String> headers) {
		def binary = (candidate == "java") ? "jdk-${version}-${platform}.tar.gz" : "${candidate}-${version}.zip"
		def responseBuilder = aResponse()
				.withHeader("Location", "${host}/${binary}")
				.withStatus(302)
		headers.each { responseBuilder.withHeader(it.key, it.value) }

		stubFor(get(urlEqualTo("/broker/download/${candidate}/${version}/${platform}"))
				.willReturn(responseBuilder))

		stubFor(get(urlEqualTo("/$binary")).willReturn(
				aResponse()
						.withStatus(200)
						.withHeader("Content-Type", "application/zip")
						.withBodyFile(binary)))
	}

	static primeSelfupdate() {
		stubFor(get(urlEqualTo("/selfupdate")).willReturn(
				aResponse()
						.withStatus(200)
						.withHeader("Content-Type", "text/plain")
						.withBodyFile("selfupdate.sh")))
	}
}
