Feature: Initialisation

	Scenario: Run gvm for the first time
		Given an unitialised system
		When I enter "gvm"
		Then I see "Initialising gvm..."
		And the ".gvm" folder is created in user home

	Scenario: Run gvm after initialisation
		Given an initialised system
		When I enter "gvm"
		Then I see "Usage: gvm <command> <candidate> [version]"
		And the ".gvm" folder exists in user home