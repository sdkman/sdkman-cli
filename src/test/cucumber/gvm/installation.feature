Feature: Installation

	Scenario: Install a default Candidate
		Given the default "grails" candidate is "2.1.0"
		When I enter "gvm install grails"
		Then the candidate "grails" version "2.1.0" is installed
		And I see "Done installing!"

	Scenario: Install a specific Candidate
		When I enter "gvm install grails 1.3.9"
		Then the candidate "grails" version "1.3.9" is installed
		And I see "Done installing!"

	Scenario: Install a Candidate version that does not exist
		When I enter "gvm install grails 1.4.4"
		Then I see "Stop! 1.4.4 is not a valid grails version."
