vertxVersion = '1.3.1.final'
gvmVersion = '2.3.0'
environments {
	local {
		gvmService = 'http://localhost:8080'
        gvmBroadcastService = 'http://localhost:8080'
        gvmBrokerService = 'http://localhost:8080'
	}
	master {
		gvmService = 'http://dev.gvmtool.net'
        gvmBroadcastService = 'http://cast-dev.gvm.io'
        gvmBrokerService = 'http://release-dev.gvm.io'
	}
	production {
		gvmService = 'http://api.gvmtool.net'
        gvmBroadcastService = 'http://cast.gvm.io'
        gvmBrokerService = 'http://release.gvm.io'
	}
}
