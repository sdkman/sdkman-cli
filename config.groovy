vertxVersion = '1.3.1.final'
sdkmanVersion = '1.0.0-SNAPSHOT'
environments {
	local {
		sdkmanService = 'http://localhost:8080'
        sdkmanBroadcastService = 'http://localhost:8080'
        sdkmanBrokerService = 'http://localhost:8080'
	}
	master {
		sdkmanService = 'http://dev.gvmtool.net'
        sdkmanBroadcastService = 'http://cast-dev.gvm.io'
        sdkmanBrokerService = 'http://release-dev.gvm.io'
	}
	production {
		sdkmanService = 'http://api.gvmtool.net'
        sdkmanBroadcastService = 'http://cast.gvm.io'
        sdkmanBrokerService = 'http://release.gvm.io'
	}
}
