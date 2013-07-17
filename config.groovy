vertxVersion = '1.3.1.final'
gvmVersion = '1.0.0-SNAPSHOT'
environments {
	local {
		gvmService = 'http://localhost:8080'
	}
	master {
		gvmService = 'http://dev.gvmtool.net'
	}
	beta {
		gvmService = 'http://beta.gvmtool.net'
	}
	production {
		gvmService = 'http://api.gvmtool.net'
	}
}
