Feature: Default Version

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: Default a candidate version that is not installed
		Given the candidate "groovy" version "2.0.5" is a valid candidate version
		And the system is bootstrapped
		When I enter "sdk default groovy 2.0.5"
		Then I see "Stop! groovy 2.0.5 is not available. Possible causes:"
		And I see "* 2.0.5 is an invalid version"
		And I see "* groovy binaries are incompatible with LinuxX64"
		And I see "* groovy has not been released yet"
		And I see "Tip: see all available versions for your platform:"
		And I see "$ sdk list groovy"

	Scenario: Default a candidate version that is installed and not default
		Given the candidate "groovy" version "2.0.5" is a valid candidate version
		And the candidate "groovy" version "2.0.5" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk default groovy 2.0.5"
		Then I see "Default groovy version set to 2.0.5"
		And the candidate "groovy" version "2.0.5" should be the default

	Scenario: Default a candidate version that is installed and already default
		Given the candidate "groovy" version "2.0.5" is a valid candidate version
		And the candidate "groovy" version "2.0.5" is already installed and default
		And the system is bootstrapped
		When I enter "sdk default groovy 2.0.5"
		Then I see "Default groovy version set to 2.0.5"
		And the candidate "groovy" version "2.0.5" should be the default

	Scenario: Default a candidate version that does not exist
		Given the candidate "groovy" version "2.9.9" is not available for download
		And the system is bootstrapped
		When I enter "sdk default groovy 2.9.9"
		Then I see "Stop! groovy 2.9.9 is not available."
