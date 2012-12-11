Feature: List Candidates

	Scenario: List all available Versions for an installed Candidate
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" version "1.3.9" is already installed but not default
		When I enter "gvm list grails"
		Then I see "Available Grails Versions"
		And I see "> 2.1.0"
		And I see "* 1.3.9"

	Scenario: List all available Versions without a Candidate installed
		Given I do not have a "grails" candidate installed
		When I enter "gvm list grails"
		Then I see "Available Grails Versions"
		And I see "  2.1.0"
		And I see "  1.3.9"

