Feature: Java Multi Platform Binary Distribution

	Three versions of Java are used to test various installation scenarios.
	This feature uses real hooks found in the resources folder under /hooks.

	The following hooks are available:
	8.0.111: post-hook prepared for successful installation
	8.0.101: post-hook aborts with non-zero return code

	Background:
		Given the internet is reachable
		And an initialised environment

	# still failing - not sure why as it fails on the "Done installing!" step, which should still print
	# last printed message is "Binary archive type determined to be tar" and then "skipped step"
	Scenario: Platform is supported and a specific version of compatible binary is installed
		Given an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "java" version "8.0.111" is available for download on "Linux" with architecture "x86_64"
		And the appropriate multi-platform hook is available for "java" version "8.0.111" on "Linux" with architecture "x86_64"
		When I enter "sdk install java 8.0.111"
		And I see "Done installing!"
		And the candidate "java" version "8.0.111" is installed

	# same as above
	Scenario: Platform is supported and a default version of compatible binary is installed
		Given an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the default "java" version is "8.0.111"
		And the candidate "java" version "8.0.111" is available for download on "Linux" with architecture "x86_64"
		And the appropriate multi-platform hook is available for "java" version "8.0.111" on "Linux" with architecture "x86_64"
		When I enter "sdk install java"
		And I see "Done installing!"
		And the candidate "java" version "8.0.111" is installed

	# This test does not seem to be forwards compatible with the removal of post hooks
	# it fails on the "Download has failed, aborting!" step (post hooks are part of the installation step)
	Scenario: Platform is supported but download fails
		Given an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "java" version "8.0.101" is available for download on "Linux" with architecture "x86_64"
		And the appropriate multi-platform hook is available for "java" version "8.0.101" on "Linux" with architecture "x86_64"
		When I enter "sdk install java 8.0.101"
		And I see "Download has failed, aborting!"
		And the candidate "java" version "8.0.101" is not installed
		And I see "Cannot install java 8.0.101 at this time..."

	Scenario: Platform is not supported for specific version and user is notified
		And an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "java" version "8.0.111" is not available for download on "Linux"
		When I enter "sdk install java 8.0.111"
		Then I see "Stop! java 8.0.111 is not available. Possible causes:"
		And I see " * 8.0.111 is an invalid version"
		And I see " * java binaries are incompatible with your platform"
		And I see " * java has not been released yet"
		And I see "Tip: see all available versions for your platform:"
		And I see "$ sdk list java"
		And the candidate "java" version "8.0.111" is not installed

	Scenario: Platform is not supported for default version and user is notified
		And an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the default "java" version is "8.0.111"
		And the candidate "java" version "8.0.111" is not available for download on "Linux"
		When I enter "sdk install java"
		Then I see "Stop! java 8.0.111 is not available. Possible causes:"
		And I see " * 8.0.111 is an invalid version"
		And I see " * java binaries are incompatible with your platform"
		And I see " * java has not been released yet"
		And I see "Tip: see all available versions for your platform:"
		And I see "$ sdk list java"
		And the candidate "java" version "8.0.111" is not installed
