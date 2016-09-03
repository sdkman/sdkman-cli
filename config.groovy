sdkmanCliVersion = '5.0.0-SNAPSHOT'
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
