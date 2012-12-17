Feature: Upgrade

  Background:
    Given the internet is reachable

  Scenario: Upgrade an outdated installation
		Given an initialised system
		When I enter "gvm selfupdate"
		Then I see "Updating gvm scripts..."
		Then I see "Successfully upgraded GVM."
		Then the gvm scripts are up to date

    Scenario: Upgrade an installation without configuration
        Given an initialised system
        And the configuration file has not been primed
        When I enter "gvm selfupdate"
        Then the configuration file is present
        And the configuration file contains "isolated_mode=1"

    Scenario: Upgrade an installation with configuration
        Given an initialised system
        And the configuration file has been primed with "isolated_mode=0"
        When I enter "gvm selfupdate"
        Then the configuration file is present
        And the configuration file contains "isolated_mode=1"
