Feature: Use

	Scenario: Use a version of an installed candidate that exists
		Given the candidate "grails" version "2.1.0" is already installed
		Given the candidate "grails" version "1.3.9" is already installed
		And the candidate "grails" version "1.3.9" is in use
		When I enter "gvm use grails 2.1.0"
		Then the candidate "grails" version "2.1.0" should be in use

	Scenario: Use a version of an uninstalled candidate that exists
		Given the candidate "grails" version "1.3.9" is already installed
		And the candidate "grails" version "1.3.9" is in use
		And the candidate "grails" version "2.1.0" is not installed
		When I enter "gvm use grails 2.1.0"
		Then I see "Stop! grails 2.1.0 is not installed."

	Scenario: Use a version of a candidate that doesn't exist
		When I enter "gvm use grails 1.4.4"
		Then I see "Stop! 1.4.4 is not a valid grails version."

	Scenario: Switch a candidate version
		Given the candidate "grails" version "1.3.9" is already installed
		And the candidate "grails" version "2.1.0" is already installed
		And the candidate "grails" version "1.3.9" is in use
		When I enter "gvm use grails 2.1.0"
		Then the candidate "grails" version "2.1.0" should be in use
