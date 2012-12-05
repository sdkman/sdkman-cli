vertxVersion = '1.3.0.final'
gvmVersion = '0.8.4'
environments {
	dev {
		gvmService = 'http://localhost:8080'
	}
	test {
		gvmService = 'http://test.gvmtool.net'
	}
	prod {
		gvmService = 'http://get.gvmtool.net'
	}
}
