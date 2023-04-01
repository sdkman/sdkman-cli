package sdkman.stubs

class HookResponses {
	
	static postInstallationHookSuccess() {
		'''\
#!/usr/bin/env bash
function __sdkman_post_installation_hook {
	mv -f $binary_input $zip_output
	echo "Post-installation hook success"
	return 0
}
'''
	}

	static postInstallationHookFailure() {
		'''\
#!/usr/bin/env bash
function __sdkman_post_installation_hook {
	echo "Post-installation hook failure"
	return 1
}
'''
	}
}
