Feature: Print home path

* Print home directory
* Printing the home directory does not require reaching out to the internet.
* Printing the home directory also has the hard requirement of not printing
anything else unless it is an actual error.

	Background:
		Given the internet is reachable
		And an initialised environment without debug prints

	Scenario: Home without providing a Candidate
		Given the system is bootstrapped
		When I enter "sdk home"
		Then I see "Usage: sdk <command> [candidate] [version]"

	Scenario: Home for a candidate version that is installed
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" version "1.3.9" is a valid candidate version
		And the candidate "grails" version "1.3.9" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk home grails 1.3.9"
		Then the home path ends with ".sdkman/candidates/grails/1.3.9"

	Scenario: Home for a candidate version that is not installed
		Given the candidate "grails" version "1.3.9" is available for download
		And the system is bootstrapped
		When I enter "sdk home grails 1.3.9"
		Then I see "Stop! Candidate version is not installed."
		And I see "Tip: Run the following to install this version"
		And I see "$ sdk install grails 1.3.9"
		And the exit code is 1

	Scenario: Home for a candidate version that does not exist
		Given the candidate "groovy" version "1.9.9" is not available for download
		And the system is bootstrapped
		When I enter "sdk home groovy 1.9.9"
		Then I see "Stop! groovy 1.9.9 is not available."

	Scenario: Home for a candidate version that only exists locally
		Given the candidate "grails" version "2.0.0.M1" is not available for download
		And the candidate "grails" version "2.0.0.M1" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk home grails 2.0.0.M1"
		Then the home path ends with ".sdkman/candidates/grails/2.0.0.M1"
