package sdkman.stubs

class HookResponses {
    static preInstallationHookSuccess() {
        '''
#!/bin/bash
function __sdkman_pre_installation_hook {
    echo "Pre-installation hook success"
    return 0
}'''
    }

    static preInstallationHookFailure() {
        '''
#!/bin/bash
function __sdkman_pre_installation_hook {
    echo "Pre-installation hook failure"
    return 1
}'''
    }

    static postInstallationHookSuccess() {
        '''
#!/bin/bash
function __sdkman_post_installation_hook {
    mv $binary_input $zip_output
    echo "Post-installation hook success"
    return 0
}'''
    }

    static postInstallationHookFailure() {
        '''
#!/bin/bash
function __sdkman_post_installation_hook {
    echo "Post-installation hook failure"
    return 1
}'''
    }

}
