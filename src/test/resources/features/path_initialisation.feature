Feature: Path Initialisation

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: sdkman is initialised for the first time
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the system is bootstrapped
		When I enter "echo $PATH"
		Then I see a single occurrence of "grails"

	Scenario: sdkman is initialised a subsequent time
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the system is bootstrapped
		And the system is bootstrapped again
		And I enter "echo $PATH"
		Then I see a single occurrence of "grails"

	Scenario: sdkman is initialised without candidates
		Given the system is bootstrapped
		When I enter "echo $PATH"
		Then I see no occurrences of "grails"

	Scenario: Install a candidate and see it on the PATH
		And the candidate "grails" version "2.1.0" is available for download
		And the system is bootstrapped
		And I enter "sdk install grails 2.1.0" and answer "Y"
		When I enter "echo $PATH"
		Then I see a single occurrence of "grails"

	Scenario: Install multiple candidate versions and see it once on the PATH
		Given the candidate "grails" version "1.3.9" is available for download
		And the candidate "grails" version "2.1.0" is available for download
		And the system is bootstrapped
		And I enter "sdk install grails 1.3.9" and answer "Y"
		And I enter "sdk install grails 2.1.0" and answer "Y"
		When I enter "echo $PATH"
		Then I see a single occurrence of "grails"
