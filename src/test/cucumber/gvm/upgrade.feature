Feature: Upgrade

	Scenario: Upgrade an outdated installation
		Given an initialised system
		And an updated gvm available
		When I enter "gvm selfupdate"
		Then I see "Updating gvm scripts..."
		Then I see "Successfully upgraded GVM."
		But I do not see "Your version of GVM is out of date!"
		Then the gvm scripts are up to date

