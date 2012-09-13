Feature: Initialisation

	Scenario: Run gvm for the first time
		When I enter "gvm"
		Then the gvm work folder is created

	Scenario: Run gvm after initialisation
		Given an initialised system
		When I enter "gvm"
		Then I see "Usage: gvm <command> <candidate> [version]"
		Then the gvm work folder is created
