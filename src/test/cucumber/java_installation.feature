Feature: Java Multi Platform Binary Distribution

	Three versions of Java are used to test various installation scenarios.
	This feature uses real hooks found in the resources folder under /hooks.

	The following hooks are available:
	8.0.111: pre- and post-hooks prepared for successful installation
	8.0.101: pre-hook succeeds but post-hook aborts with non-zero return code

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: Platform is supported and a specific version of compatible binary is installed
		Given a machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "java" version "8.0.111" is available for download on "Linux"
		And the appropriate multi-platform hooks are available for "java" version "8.0.111" on "Linux"
		When I enter "sdk install java 8.0.111"
		And I see "Done installing!"
		And the candidate "java" version "8.0.111" is installed

	Scenario: Platform is supported and a default version of compatible binary is installed
		Given a machine with "Linux" installed
		And the system is bootstrapped
		And the default "java" version is "8.0.111"
		And the candidate "java" version "8.0.111" is available for download on "Linux"
		And the appropriate multi-platform hooks are available for "java" version "8.0.111" on "Linux"
		When I enter "sdk install java"
		And I see "Done installing!"
		And the candidate "java" version "8.0.111" is installed

	Scenario: Platform is supported but download fails
		Given a machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "java" version "8.0.101" is available for download on "Linux"
		And the appropriate multi-platform hooks are available for "java" version "8.0.101" on "Linux"
		When I enter "sdk install java 8.0.101"
		And I see "Download has failed, aborting!"
		And the candidate "java" version "8.0.101" is not installed
		And I see "Can not install java 8.0.101 at this time..."

	Scenario: Platform is not supported for specific version and user is notified
		And a machine with "FreeBSD" installed
		And the system is bootstrapped
		And the candidate "java" version "8.0.111" is not available for download on "FreeBSD"
		When I enter "sdk install java 8.0.111"
		Then I see "Stop! java 8.0.111 is not available. Possible causes:"
		And I see " * 8.0.111 is an invalid version"
		And I see " * java binaries are incompatible with FreeBSD"
		And I see " * java has not been released yet"
		And the candidate "java" version "8.0.111" is not installed

	Scenario: Platform is not supported for default version and user is notified
		And a machine with "FreeBSD" installed
		And the system is bootstrapped
		And the default "java" version is "8.0.111"
		And the candidate "java" version "8.0.111" is not available for download on "FreeBSD"
		When I enter "sdk install java"
		Then I see "Stop! java 8.0.111 is not available. Possible causes:"
		And I see " * 8.0.111 is an invalid version"
		And I see " * java binaries are incompatible with FreeBSD"
		And I see " * java has not been released yet"
		And the candidate "java" version "8.0.111" is not installed
