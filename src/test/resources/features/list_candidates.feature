Feature: List Candidates

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: A List of Available Candidates can be viewed
		Given the system is bootstrapped
		And The candidate list is available
		When I enter "sdk list"
		Then I see "Candidate List"
