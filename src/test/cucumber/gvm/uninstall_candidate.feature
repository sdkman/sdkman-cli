Feature: Uninstall Candidate
	Scenario: Uninstall an installed Candidate Version
		Given the candidate "grails" version "2.1.0" is already installed
		When I enter "gvm uninstall grails 2.1.0"
		Then I see "Uninstalling grails 2.1.0"
		And the candidate "grails" version "2.1.0" is not installed

	Scenario: Uninstall a Candidate Version in use
		Given the candidate "grails" version "2.1.0" is already installed
		And the candidate "grails" version "2.1.0" is in use
		When I enter "gvm uninstall grails 2.1.0"
		Then I see "Unselecting grails 2.1.0"
		And I see "Uninstalling grails 2.1.0"
		And the candidate "grails" version "2.1.0" is not installed
		And the candidate "grails" is no longer selected

	Scenario: Attempt uninstalling a Candidate Version that is not installed
		Given the candidate "grails" version "2.1.0" is already installed
		When I enter "gvm uninstall grails 1.3.9"
		Then I see "grails 1.3.9 is not installed."
		And the candidate "grails" version "1.3.9" is not installed
		
