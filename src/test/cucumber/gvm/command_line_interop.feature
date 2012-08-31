Feature: Command Line Interop

	Background:
		Given an initialised system

	Scenario: Enter gvm
		When I enter "gvm"
		Then I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Ask for help
		When I enter "gvm help"
		Then I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Install without a Candidate
		When I enter "gvm install"
		Then I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Install a Candidate
		When I enter "gvm install grails"
		Then I see "Installing: grails"

	Scenario: Use without providing a Candidate
		When I enter "gvm use"
		Then I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Use a Candidate
		When I enter "gvm use grails"
		Then I see "Using: grails"
