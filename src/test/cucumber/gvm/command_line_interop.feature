Feature: Command Line Interop

	Scenario: Invoke gvm without a command
		When I enter "gvm"
		Then I see "Usage: gvm <command> <candidate> [version]"
		And I see "commands: install, uninstall, list or use"
		And I see "candidate: groovy, grails, griffon or gradle"
		And I see "version: defaults to latest stable if not provided"		

	Scenario: Invoke gvm install from the Command Line
		When I enter "gvm install grails"
		Then I see "Installing: grails"

	Scenario: Invoke gvm use from the Command Line
		When I enter "gvm use grails"
		Then I see "Using: grails"
