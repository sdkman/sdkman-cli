vertxVersion = '1.3.1.final'
gvmVersion = '1.0.5'
environments {
	local {
		gvmService = 'http://localhost:8080'
	}
	master {
		gvmService = 'http://dev.gvmtool.net'
	}
	beta {
		gvmService = 'http://test.gvmtool.net'
	}
	prod {
		gvmService = 'http://api.gvmtool.net'
	}
}
