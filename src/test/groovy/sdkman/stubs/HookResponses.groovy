package sdkman.stubs

class HookResponses {
    static preInstallationHookSuccess() {
        '''
#!/usr/bin/env bash
function __sdkman_pre_installation_hook {
    echo "Pre-installation hook success"
    return 0
}'''
    }

    static preInstallationHookFailure() {
        '''
#!/usr/bin/env bash
function __sdkman_pre_installation_hook {
    echo "Pre-installation hook failure"
    return 1
}'''
    }

    static postInstallationHookSuccess() {
        '''
#!/usr/bin/env bash
function __sdkman_post_installation_hook {
    mv $binary_input $zip_output
    echo "Post-installation hook success"
    return 0
}'''
    }

    static postInstallationHookFailure() {
        '''
#!/usr/bin/env bash
function __sdkman_post_installation_hook {
    echo "Post-installation hook failure"
    return 1
}'''
    }

}
