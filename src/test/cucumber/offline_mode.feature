Feature: Offline Mode

	# offline modes

	Scenario: Enter an invalid offline mode
		Given offline mode is disabled with reachable internet
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk offline grails"
		Then I see "Stop! grails is not a valid offline mode."
		And the exit code is 1

	Scenario: Issue Offline command without qualification
		Given offline mode is disabled with reachable internet
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk offline"
		Then I see "Offline mode enabled."
		And the exit code is 0

	Scenario: Enable Offline Mode with internet reachable
		Given offline mode is disabled with reachable internet
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk offline enable"
		Then I see "Offline mode enabled."
		And I do not see "INTERNET NOT REACHABLE!"
		And the exit code is 0
		When I enter "sdk install grails 2.1.0"
		Then I do not see "INTERNET NOT REACHABLE!"
		And I see "Stop! grails 2.1.0 is not available while offline."
		And the exit code is 1

	Scenario: Disable Offline Mode with internet reachable
		Given offline mode is enabled with reachable internet
		And the candidate "grails" version "2.1.0" is available for download
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk offline disable"
		Then I see "Online mode re-enabled!"
		And the exit code is 0
		When I enter "sdk install grails 2.1.0"
		Then I see "Done installing!"
		And the candidate "grails" version "2.1.0" is installed
		And the exit code is 0

	Scenario: Disable Offline Mode with internet unreachable
		Given offline mode is enabled with unreachable internet
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk offline disable"
		Then I see "Online mode re-enabled!"
		And the exit code is 0
		When I enter "sdk install grails 2.1.0"
		Then I see "INTERNET NOT REACHABLE!"
		And I see "Stop! grails 2.1.0 is not available while offline."
		And the exit code is 1

	# broadcast

	Scenario: Recall a broadcast while in Offline Mode
		Given offline mode is enabled with reachable internet
		And an initialised environment
		And the system is bootstrapped
		When a prior Broadcast "This is an OLD Broadcast!" with id "12344" was issued
		And I enter "sdk broadcast"
		Then I see "This is an OLD Broadcast!"
		And the exit code is 0

	# sdk version

	Scenario: Determine the sdkman version while in Offline Mode
		Given offline mode is enabled with reachable internet
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk version"
		Then I see the current sdkman version
		And the exit code is 0

	# list candidate version

	Scenario: List candidate versions found while in Offline Mode
		Given offline mode is enabled with reachable internet
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk list grails"
		Then I see "Offline: only showing installed grails versions"
		And the exit code is 0

	# default version

	Scenario: Set the default to an uninstalled candidate version while in Offline Mode
		Given offline mode is enabled with reachable internet
		And the candidate "grails" version "1.3.9" is already installed and default
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk default grails 2.1.0"
		Then I see "Stop! grails 2.1.0 is not available while offline."
		And the exit code is 1

	# install command

	Scenario: Install a candidate version that is not installed while in Offline Mode
		Given offline mode is enabled with reachable internet
		And the candidate "grails" version "2.1.0" is not installed
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk install grails 2.1.0"
		Then I see "Stop! grails 2.1.0 is not available while offline."
		And the exit code is 1

	# uninstall command

	Scenario: Uninstall a candidate version while in Offline Mode
		Given offline mode is enabled with reachable internet
		And the candidate "grails" version "2.1.0" is already installed and default
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk uninstall grails 2.1.0"
		And the candidate "grails" version "2.1.0" is not installed
		And the exit code is 0

	# current command

	Scenario: Display the current version of a candidate while in Offline Mode
		Given offline mode is enabled with reachable internet
		And the candidate "grails" version "2.1.0" is already installed and default
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk current grails"
		Then I see "Using grails version 2.1.0"
		And the exit code is 0

	# help command

	Scenario: Request help while in Offline Mode
		Given offline mode is enabled with reachable internet
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk help"
		Then I see "Usage: sdk <command> [candidate] [version]"
		And the exit code is 0

	# selfupdate command

	Scenario: Attempt self-update while in Offline Mode
		Given offline mode is enabled with reachable internet
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk selfupdate"
		Then I see "This command is not available while offline."
		And the exit code is 1
