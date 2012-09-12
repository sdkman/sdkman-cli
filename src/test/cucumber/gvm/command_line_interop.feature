Feature: Command Line Interop

	Background:
		Given an initialised system

	Scenario: Enter gvm
		When I enter "gvm"
		Then I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Ask for help
		When I enter "gvm help"
		Then I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Enter an invalid Command
		When I enter "gvm goopoo grails"
		Then I see "Invalid command: goopoo"
		And I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Enter an invalid Candidate
		When I enter "gvm install groffle"
		Then I see "Invalid candidate: groffle"
		And I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Use without providing a Candidate
		When I enter "gvm use"
		Then I see "Usage: gvm <command> <candidate> [version]"