Feature: Version

	Scenario: Show the current version of sdkman
		Given the internet is reachable
		And the sdkman scripts version is "3.2.1"
		And an initialised environment
		And the system is bootstrapped
		When I enter "sdk version"
		Then I see "SDKMAN 3.2.1"
