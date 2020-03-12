package sdkman.stubs

class HookResponses {

	static String preInstallationHookSuccess() {
		'''\
#!/usr/bin/env bash
function __sdkman_pre_installation_hook {
	echo 'Pre-installation hook success'
	return 0
}
'''
	}

	static String preInstallationHookFailure() {
		'''\
#!/usr/bin/env bash
function __sdkman_pre_installation_hook {
	echo 'Pre-installation hook failure'
	return 1
}
'''
	}

	static String postInstallationHookSuccess() {
		'''\
#!/usr/bin/env bash
function __sdkman_post_installation_hook {
	mv $binary_input $zip_output
	echo 'Post-installation hook success'
	return 0
}
'''
	}

	static String postInstallationHookFailure() {
		'''\
#!/usr/bin/env bash
function __sdkman_post_installation_hook {
	echo 'Post-installation hook failure'
	return 1
}
'''
	}
}
