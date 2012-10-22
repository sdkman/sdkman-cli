Feature: Install Candidate

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

	Scenario: Install a Candidate version that is already installed
		Given the candidate "grails" version "1.3.9" is already installed
		When I enter "gvm install grails 1.3.9"
		Then I see "Stop! grails 1.3.9 is already installed."

	Scenario: Abort installation on download of a corrupt Candidate archive
		Given the archive for candidate "grails" version "1.3.6" is corrupt
		When I enter "gvm install grails 1.3.6"
		Then I see "Stop! The archive was corrupt and has been removed! Please try installing again."
		And the candidate "grails" version "1.3.6" is not installed
		And the archive for candidate "grails" version "1.3.6" is removed
		
