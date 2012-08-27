Feature: Command Line Interop

	Scenario: Invoke gvm without a command
		When I enter "gvm"
		Then I see "Usage: gvm [install|list|use|delete] [candidate]"
		And the exit value is "0"

	Scenario: Invoke gvm install from the Command Line
		When I enter "gvm install grails"
		Then I see "Installing: grails"
		And the exit value is "0"

	Scenario: Invoke gvm use from the Command Line
		When I enter "gvm use grails"
		Then I see "Using: grails"
		And the exit value is "0"