Feature: Use Version

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: Use without providing a Candidate
		Given the system is bootstrapped
		When I enter "sdk use"
		Then I see "Usage: sdk <command> [candidate] [version]"

	Scenario: Use a candidate version that is installed
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" version "1.3.9" is a valid candidate version
		And the candidate "grails" version "1.3.9" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk use grails 1.3.9"
		Then I see "Using grails version 1.3.9 in this shell."
		Then the candidate "grails" version "1.3.9" should be in use
		And the candidate "grails" version "2.1.0" should be the default

	Scenario: Use a candidate version that is not installed
		Given the candidate "groovy" version "1.9.9" is not available for download
		And the system is bootstrapped
		When I enter "sdk use groovy 1.9.9"
		Then I see "Stop! Candidate version is not installed."
		And I see "Tip: Run the following to install this version"
		And I see "$ sdk install groovy 1.9.9"

	Scenario: Use a candidate version that only exists locally
		Given the candidate "grails" version "2.0.0.M1" is not available for download
		And the candidate "grails" version "2.0.0.M1" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk use grails 2.0.0.M1"
		Then I see "Using grails version 2.0.0.M1 in this shell."

	# scenarios related to updating _HOME variable

	Scenario: Use an installed version of an installed candidate updates the candidate _HOME variable
		Given the candidate "grails" version "1.3.9" is already installed and default
		And the candidate "grails" version "2.1.0" is already installed but not default
		And the candidate "grails" version "2.1.0" is available for download
		And the system is bootstrapped
		And the "GRAILS_HOME" variable contains "grails/current"
		When I enter "sdk use grails 2.1.0"
		And I see "Using grails version 2.1.0 in this shell."
		Then the "GRAILS_HOME" variable contains "grails/2.1.0"
