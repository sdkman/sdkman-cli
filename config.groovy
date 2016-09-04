sdkmanCliVersion = '5.1.1'
environments {
    local {
        sdkmanLegacyApi = 'http://localhost:8080'
        sdkmanCurrentApi = 'http://localhost:8080'
    }
    production {
        sdkmanLegacyApi = 'https://api.sdkman.io/1'
        sdkmanCurrentApi = 'https://api.sdkman.io/2'
    }
}
