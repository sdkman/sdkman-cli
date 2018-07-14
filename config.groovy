sdkmanCliVersion = 'master'
environments {
    local {
        sdkmanCurrentApi = 'http://localhost:8080/2'
    }
    production {
        sdkmanCurrentApi = 'https://api.sdkman.io/2'
    }
}
