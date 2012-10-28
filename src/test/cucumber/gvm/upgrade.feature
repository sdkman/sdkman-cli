Feature: Upgrade

	Scenario: Upgrade an outdated installation
		Given an initialised system
		When I enter "gvm selfupdate"
		Then I see "Updating gvm scripts..."
		Then I see "Successfully upgraded GVM."
		Then the gvm scripts are up to date

