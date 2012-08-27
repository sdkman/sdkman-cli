Feature: Command Line Interop

	Background:
		Given an initialised system

	Scenario: Enter gvm
		When I enter "gvm"
		Then I see "Usage: gvm <command> <candidate> [version]"
		And I see "commands: install, uninstall, list, use or help"
		And I see "candidate: groovy, grails, griffon or gradle"
		And I see "version: defaults to latest stable if not provided"		

	Scenario: Ask for help
		When I enter "gvm help"
		Then I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Install a Candidate
		When I enter "gvm install grails"
		Then I see "Installing: grails"

	Scenario: Use a Candidate
		When I enter "gvm use grails"
		Then I see "Using: grails"

	Scenario: Ask for help