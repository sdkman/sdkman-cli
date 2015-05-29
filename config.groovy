vertxVersion = '1.3.1.final'
sdkManVersion = '1.0.0-SNAPSHOT'
environments {
	local {
		sdkManService = 'http://localhost:8080'
        sdkManBroadcastService = 'http://localhost:8080'
        sdkManBrokerService = 'http://localhost:8080'
	}
	master {
		sdkManService = 'http://dev.gvmtool.net'
        sdkManBroadcastService = 'http://cast-dev.gvm.io'
        sdkManBrokerService = 'http://release-dev.gvm.io'
	}
	production {
		sdkManService = 'http://api.gvmtool.net'
        sdkManBroadcastService = 'http://cast.gvm.io'
        sdkManBrokerService = 'http://release.gvm.io'
	}
}
