Feature: Version

	Scenario: Show the current version of gvm
		When I enter "gvm version"
		Then I see "Groovy enVironment Manager 0.8.4"
