sdkmanCliVersion = '5.11.2'
environments {
	local {
		candidatesApi = 'http://localhost:8080/2'
	}
	production {
		candidatesApi = 'https://api.sdkman.io/2'
	}
}
