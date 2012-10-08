Feature: List Candidates

	Scenario: List all available Versions for an installed Candidate
		Given the candidate "grails" version "1.3.9" is already installed
		And the candidate "grails" version "2.1.0" is already installed
		And the candidate "grails" version "2.1.0" is in use
		When I enter "gvm list grails"
		Then I see "Available Grails Versions"

	Scenario: List all available Versions without a Candidate installed
		Given I do not have a "grails" candidate installed
		When I enter "gvm list grails"
		Then I see "Stop! grails has never been installed."


