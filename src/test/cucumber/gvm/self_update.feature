@manual
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

  Scenario: Update an installation without any configuration
    Given an empty configuration file
    When I enter "gvm selfupdate"
    Then the configuration file contains "gvm_auto_answer=false"
    And the configuration file contains "gvm_auto_selfupdate=false"

  Scenario: Update an installation already containing an Auto Answer config
    Given the configuration file has been primed with "gvm_auto_answer=true"
    And the configuration file has been primed with "gvm_auto_selfupdate=false"
    When I enter "gvm selfupdate"
    Then the configuration file contains "gvm_auto_answer=true"
    And the configuration file contains "gvm_auto_selfupdate=false"
