Feature: Command Line Interop

	Background:
		Given the internet is reachable
		And an initialised environment
		And the system is bootstrapped

	Scenario: Enter sdk
		When I enter "sdk"
		Then I see "Usage: sdk <command> [candidate] [version]"
		And I see "sdk offline <enable|disable>"
		And the exit code is 1

	Scenario: Ask for help
		When I enter "sdk help"
		Then I see "Usage: sdk <command> [candidate] [version]"
		And the exit code is 0

	Scenario: Enter an invalid Command
		When I enter "sdk goopoo grails"
		Then I see "Invalid command: goopoo"
		And I see "Usage: sdk <command> [candidate] [version]"
		And the exit code is 1

	Scenario: Enter an invalid Candidate
		When I enter "sdk install groffle"
		Then I see "Stop! groffle is not a valid candidate."
		And the exit code is 1
