Feature: List Candidates

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: A List of Available Candidates can be viewed
		Given the system is bootstrapped
		And The candidate list is available
		When I enter "sdk list"
		Then I see "Candidate List"

	Scenario: A List of Installed Candidates can be viewed locally
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "groovy" version "2.0.5" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk list --local"
		Then I see "Installed Candidates"
		And I see "grails"
		And I see "groovy"

	Scenario: Locally installed candidates are listed
		Given the candidate "java" does not exist locally
		And the system is bootstrapped
		When I enter "sdk list --local"
		Then I see "Installed Candidates"
		And I see "grails"
		And I see "groovy"
