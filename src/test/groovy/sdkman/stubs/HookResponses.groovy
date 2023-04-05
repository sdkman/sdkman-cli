package sdkman.stubs

class HookResponses {

	static preInstallationHookSuccess() {
		'''\
#!/usr/bin/env bash
function __sdkman_pre_installation_hook {
	echo "Pre-installation hook success"
	return 0
}
'''
	}

	static preInstallationHookFailure() {
		'''\
#!/usr/bin/env bash
function __sdkman_pre_installation_hook {
	echo "Pre-installation hook failure"
	return 1
}
'''
	}

	static relocationHookSuccess() {
		'''\
#!/usr/bin/env bash
function __sdkman_relocate_installation_hook {
	echo "Relocation hook success"
	return 0
}
'''
	}

	static relocationHookFailure() {
		'''\
#!/usr/bin/env bash
function __sdkman_relocate_installation_hook {
	echo "Relocation hook failure"
	return 1
}
'''
	}
}
