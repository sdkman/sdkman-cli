sdkmanCliVersion = '5.9.1'
environments {
	local {
		candidatesApi = 'http://localhost:8080/2'
	}
	production {
		candidatesApi = 'https://api.sdkman.io/2'
	}
}
