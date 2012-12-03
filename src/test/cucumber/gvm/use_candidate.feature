Feature: Use Candidate

	Scenario: Use without providing a Candidate
		When I enter "gvm use"
		Then I see "Usage: gvm <command> <candidate> [version]"

	Scenario: Use a version of an installed candidate that exists
		Given the candidate "grails" version "2.1.0" is already installed but not in use
		When I enter "gvm use grails 2.1.0"
		Then the candidate "grails" version "2.1.0" should be in use

	Scenario: Use a version of an uninstalled candidate that exists
		Given the candidate "grails" version "2.1.0" is not installed
		When I enter "gvm use grails 2.1.0" and answer "Y"
		Then I see "Stop! grails 2.1.0 is not installed."
		And I see "Do you want to install it now? (Y/n)"
		And the candidate "grails" version "2.1.0" is installed
		Then the candidate "grails" version "2.1.0" should be in use

	Scenario: Use a version of a candidate that doesn't exist
		When I enter "gvm use grails 1.4.4"
		Then I see "Stop! 1.4.4 is not a valid grails version."

	Scenario: Use an installed candidate version
		Given the candidate "grails" version "1.3.9" is already installed and in use
		And the candidate "grails" version "2.1.0" is already installed but not in use
		When I enter "gvm use grails 2.1.0"
		Then the candidate "grails" version "2.1.0" should be in use
		And the candidate "grails" version "1.3.9" is not in use

	Scenario: Use an uninstalled candidate version and choose to install it
		Given the candidate "grails" version "1.3.9" is already installed and in use
		And the candidate "grails" version "2.1.0" is not installed
		When I enter "gvm use grails 2.1.0" and answer "Y"
		Then the candidate "grails" version "2.1.0" is installed
		And the candidate "grails" version "2.1.0" should be in use
		And the candidate "grails" version "1.3.9" is not in use

	Scenario: Use an uninstalled candidate version and choose not to install it
		Given the candidate "grails" version "1.3.9" is already installed and in use
		And the candidate "grails" version "2.1.0" is not installed
		When I enter "gvm use grails 2.1.0" and answer "N"
		Then the candidate "grails" version "2.1.0" is not installed
		And the candidate "grails" version "1.3.9" should be in use

