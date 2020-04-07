package sdkman.support

import com.github.tomakehurst.wiremock.WireMockServer
import com.github.tomakehurst.wiremock.client.WireMock

import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig

class WireMockServerProvider {

	static SERVICE_UP_HOST = "localhost"
	static SERVICE_UP_PORT = 8080
	static WireMockServer wireMockServer

	static def wireMockServer() {
		wireMockServer ?: createWireMockServer()
	}

	private static def createWireMockServer() {
		wireMockServer = new WireMockServer(wireMockConfig().port(SERVICE_UP_PORT))
		wireMockServer.start()
		WireMock.configureFor(SERVICE_UP_HOST, SERVICE_UP_PORT)
		wireMockServer
	}
}
