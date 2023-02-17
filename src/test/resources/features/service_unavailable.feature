Feature: Service Unavailable

	Background:
		Given the internet is not reachable
		And an initialised environment

	# list commands

	Scenario: List candidate versions found while Offline
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" version "1.3.9" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk list grails"
		Then I see "Offline: only showing installed grails versions"
		And I see "> 2.1.0"
		And I see "* 1.3.9"

	Scenario: List candidate versions not found while Offline
		Given the system is bootstrapped
		When I enter "sdk list grails"
		Then I see "Offline: only showing installed grails versions"
		And I see "None installed!"

	Scenario: List Available Candidates while Offline
		Given the system is bootstrapped
		When I enter "sdk list"
		Then I see "This command is not available while offline."

	# use command

	Scenario: Use an installed candidate version while Offline
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" version "1.3.9" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk use grails 1.3.9"
		Then I see "Using grails version 1.3.9 in this shell."

	# default command

	Scenario: Set the default to an uninstalled candidate version while Offline
		Given the candidate "grails" version "1.3.9" is already installed and default
		And the system is bootstrapped
		When I enter "sdk default grails 2.1.0"
		Then I see "Stop! grails 2.1.0 is not available while offline."

	Scenario: Set the default to an invalid candidate version while Offline
		Given the candidate "grails" version "1.3.9" is already installed and default
		And the system is bootstrapped
		When I enter "sdk default grails 999"
		Then I see "Stop! grails 999 is not available while offline."

	Scenario: Set the default to an installed candidate version while Offline
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" version "1.3.9" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk default grails 1.3.9"
		Then I see "Default grails version set to 1.3.9"

	# install command

	Scenario: Install a candidate version that is not installed while Offline
		Given the candidate "grails" version "2.1.0" is not installed
		And the system is bootstrapped
		When I enter "sdk install grails 2.1.0"
		Then I see "Stop! grails 2.1.0 is not available while offline."

	Scenario: Install a candidate version that is already installed while Offline
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the system is bootstrapped
		When I enter "sdk install grails 2.1.0"
		Then I see "grails 2.1.0 is already installed."
		And the exit code is 0

	# uninstall command

	Scenario: Uninstall a candidate version while Offline
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the system is bootstrapped
		When I enter "sdk uninstall grails 2.1.0"
		Then I see "Deselecting grails 2.1.0..."
		And I see "Uninstalling grails 2.1.0..."
		And the candidate "grails" version "2.1.0" is not in use
		And the candidate "grails" version "2.1.0" is not installed

	Scenario: Uninstall a candidate version that is not installed while Offline
		Given the candidate "grails" version "2.1.0" is not installed
		And the system is bootstrapped
		When I enter "sdk uninstall grails 2.1.0"
		Then I see "grails 2.1.0 is not installed."

	# current command

	Scenario: Display the current version of a candidate while Offline
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the system is bootstrapped
		When I enter "sdk current grails"
		Then I see "Using grails version 2.1.0"

	Scenario: Display the current version of all candidates while Offline
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "groovy" version "2.0.5" is already installed and default
		And the system is bootstrapped
		When I enter "sdk current"
		Then I see "Using:"
		And I see "grails: 2.1.0"
		And I see "groovy: 2.0.5"

	# version command

	Scenario: Determine the sdkman version when Offline
		Given the system is bootstrapped
		When I enter "sdk version"
		Then I see the current sdkman version

	# help command

	Scenario: Request help while Offline
		Given the system is bootstrapped
		When I enter "sdk help"
		Then I see "Usage: sdk <command> [candidate] [version]"

	# selfupdate command

	Scenario: Attempt self-update while Offline
		Given the system is bootstrapped
		When I enter "sdk selfupdate"
		Then I see "This command is not available while offline."
