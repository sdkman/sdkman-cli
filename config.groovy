vertxVersion = '1.3.1.final'
gvmVersion = '1.0.6'
environments {
	local {
		gvmService = 'http://localhost:8080'
	}
	dev {
		gvmService = 'http://dev.gvmtool.net'
	}
	test {
		gvmService = 'http://test.gvmtool.net'
	}
	prod {
		gvmService = 'http://api.gvmtool.net'
	}
}
