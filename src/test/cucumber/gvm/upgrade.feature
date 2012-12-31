Feature: Upgrade

  Background:
    Given the internet is reachable
    And an initialised system

  Scenario: Upgrade an outdated installation
    When I enter "gvm selfupdate"
    Then I see "Updating gvm..."
    And the gvm init script is placed in the bin folder
    And the gvm module scripts are placed in the src folder
    And the staging folder is cleaned up
    And I see "Successfully upgraded GVM."

  Scenario: Upgrade an installation without configuration
    Given the configuration file has not been primed
    When I enter "gvm selfupdate"
    Then the configuration file is present
    And the configuration file contains "isolated_mode=1"

  Scenario: Upgrade an installation with configuration
    Given the configuration file has been primed with "isolated_mode=0"
    When I enter "gvm selfupdate"
    Then the configuration file is present
    And the configuration file contains "isolated_mode=1"

  Scenario: Rename the vertx Candidate on Upgrade
    Given the candidate "vert.x" version "1.3.0.final" is already installed and default
    When I enter "gvm selfupdate"
    Then the candidate "vertx" version "1.3.0.final" is installed