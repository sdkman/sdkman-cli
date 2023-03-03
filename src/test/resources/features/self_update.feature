@manual
Feature: Self Update

	Background:
		Given the internet is reachable

	Scenario: Force a Selfupdate
		Given an initialised environment
		And the system is bootstrapped
		When I enter "sdk selfupdate force"
		Then I do not see "A new version of SDKMAN is available..."
		And I do not see "Would you like to upgrade now? (Y/n)"
		And I do not see "Not upgrading today..."
		And I see "Updating SDKMAN..."
		And I see "Successfully upgraded SDKMAN."

	Scenario: Selfupdate when not out of date
		Given an initialised environment
		And the system is bootstrapped
		When I enter "sdk selfupdate"
		Then I see "No update available at this time."
