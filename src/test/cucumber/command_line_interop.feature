Feature: Command Line Interop

	Background:
		Given the internet is reachable
		And an initialised environment
		And the system is bootstrapped

	Scenario: Enter sdk
		When I enter "sdk"
		Then I see "Stop! Missing command."
		And I see "COMMAND    ALIAS ARGUMENTS"

	Scenario: Ask for help
		When I enter "sdk help"
		Then I see "COMMAND    ALIAS ARGUMENTS"

	Scenario: Enter an invalid Command
		When I enter "sdk goopoo grails"
		Then I see "Invalid command: goopoo"
		And I see "COMMAND    ALIAS ARGUMENTS"

	Scenario: Enter an invalid Candidate
		When I enter "sdk install groffle"
		Then I see "Stop! Invalid candidate: groffle"
