Feature: Initialisation

	Scenario: Run gvm for the first time
		Given an unitialised system
		When I enter "gvm"
		Then I see "Initialising gvm..."
		And I see "All resources to be placed under the ~/.gvm folder."
		And the ".gvm" folder is created in user home

	Scenario: Run gvm after initialisation
		Given an initialised system
		When I enter "gvm"
		Then I see "Usage: gvm [install|list|use|delete] [candidate]"
		And the exit value is "0"