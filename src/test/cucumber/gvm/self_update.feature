Feature: Self Update

  Background:
    Given the internet is reachable
    And an initialised environment
    And an outdated system
    And the system is bootstrapped

  Scenario: Upgrade an outdated installation
    When I enter "gvm selfupdate"
    Then I see "Updating gvm..."
    And the gvm init script is placed in the bin folder
    And the gvm module scripts are placed in the src folder
    And the staging folder is cleaned up
    And I see "Successfully upgraded GVM."

  Scenario: Upgrade an installation with dodgy configuration
    Given a configuration file in the extensions folder
    When I enter "gvm selfupdate"
    And the configuration is not present in the extensions folder
    And the configuration file is present in the etc folder

  Scenario: Update an installation without an Auto Answer config
    Given an empty configuration file
    When I enter "gvm selfupdate"
    Then the configuration file contains "gvm_auto_answer=false"
    And the configuration file contains "gvm_suggestive_selfupdate=true"

  Scenario: Update an installation already containing an Auto Answer config
    Given the configuration file has been primed with "gvm_auto_answer=true"
    And the configuration file has been primed with "gvm_suggestive_selfupdate=true"
    When I enter "gvm selfupdate"
    Then the configuration file contains "gvm_auto_answer=true"
    And the configuration file contains "gvm_suggestive_selfupdate=true"
