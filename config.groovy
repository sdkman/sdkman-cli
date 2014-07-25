vertxVersion = '1.3.1.final'
gvmVersion = '1.0.0-SNAPSHOT'
environments {
	local {
		gvmService = 'http://localhost:8080'
        gvmBroadcastService = 'http://localhost:8080'
	}
	master {
		gvmService = 'http://dev.gvmtool.net'
        gvmBroadcastService = 'http://cast-dev.gvm.io'
	}
	production {
		gvmService = 'http://api.gvmtool.net'
        gvmBroadcastService = 'http://cast.gvm.io'
	}
}
