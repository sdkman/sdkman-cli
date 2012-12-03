Feature: Current Candidate

	Scenario: Display current candidate version in use
		Given the candidate "grails" version "1.3.9" is already installed and in use
		When I enter "gvm current grails"
		Then I see "Using grails version 1.3.9"

	Scenario: Display current candidate version when none is in use
		Given the candidate "grails" version "1.3.9" is already installed but not in use
		When I enter "gvm current grails"
		Then I see "Not using any version of grails"

	Scenario: Display current candidate versions when none is specified and none is in use
		Given the candidate "grails" version "1.3.9" is already installed but not in use
		When I enter "gvm current"
		Then I see "No candidates are in use"

	Scenario: Display current candidate versions when none is specified and one is in use
		Given the candidate "grails" version "2.1.0" is already installed and in use
		When I enter "gvm current"
		Then I see "Using:"
		And I see "grails: 2.1.0"

	Scenario: Display current candidate versions when none is specified and multiple are in use
		Given the candidate "groovy" version "2.0.5" is already installed and in use
		And the candidate "grails" version "2.1.0" is already installed and in use
		When I enter "gvm current"
		Then I see "Using:"
		And I see "grails: 2.1.0"
		And I see "groovy: 2.0.5"

