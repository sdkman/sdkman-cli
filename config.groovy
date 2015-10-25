vertxVersion = '1.3.1.final'
sdkmanVersion = '3.2.1'
environments {
	local {
		sdkmanService = 'http://localhost:8080'
        sdkmanBroadcastService = 'http://localhost:8080'
        sdkmanBrokerService = 'http://localhost:8080'
	}
	master {
		sdkmanService = 'http://dev.sdkman.io'
        sdkmanBroadcastService = 'http://cast-dev.sdkman.io'
        sdkmanBrokerService = 'http://broker-dev.sdkman.io'
	}
	production {
		sdkmanService = 'http://api.sdkman.io'
        sdkmanBroadcastService = 'http://cast.sdkman.io'
        sdkmanBrokerService = 'http://broker.sdkman.io'
	}
}
