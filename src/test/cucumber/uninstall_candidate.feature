Feature: Uninstall Candidate

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: Uninstall an installed Candidate Version not in use
		Given the candidate "grails" version "2.1.0" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk uninstall grails 2.1.0"
		Then I do not see "Deselecting grails 2.1.0"
		Then I see "Uninstalling grails 2.1.0"
		And the candidate "grails" version "2.1.0" is not installed

	Scenario: Uninstall a Candidate Version in use
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the system is bootstrapped
		When I enter "sdk uninstall grails 2.1.0"
		Then I see "Deselecting grails 2.1.0"
		And I see "Uninstalling grails 2.1.0"
		And the candidate "grails" version "2.1.0" is not installed
		And the candidate "grails" is no longer selected

	Scenario: Attempt uninstalling a Candidate Version that is not installed
		Given the candidate "grails" version "1.3.9" is not installed
		And the system is bootstrapped
		When I enter "sdk uninstall grails 1.3.9"
		Then I see "grails 1.3.9 is not installed."

	Scenario: Attempt uninstalling with no Candidate specified
		Given the system is bootstrapped
		When I enter "sdk uninstall"
		Then I see "No candidate provided."

	Scenario: Attempt uninstalling with an invalid Candidate specified
		Given the system is bootstrapped
		When I enter "sdk uninstall groffle"
		Then I see "Stop! groffle is not a valid candidate."

	Scenario: Attempt uninstalling without a version provided
		Given the system is bootstrapped
		When I enter "sdk uninstall grails"
		Then I see "No candidate version provided."
