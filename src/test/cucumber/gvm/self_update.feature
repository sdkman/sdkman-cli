Feature: Self Update

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

  Scenario: Upgrade an installation with dodgy configuration
    Given a configuration file in the extensions folder
    When I enter "gvm selfupdate"
    Then I see "Removing config from ext folder."
    And the configuration is not present in the extensions folder
    And the configuration file is present in the etc folder

  Scenario: Rename the vertx Candidate on Upgrade
    Given the candidate "vert.x" version "1.3.0.final" is already installed and default
    When I enter "gvm selfupdate"
    Then the candidate "vertx" version "1.3.0.final" is installed
    And the candidate "vert.x" version "1.3.0.final" is not installed

  Scenario: Ignore an already converted vertx Candidate on Upgrade
    Given the candidate "vertx" version "1.3.0.final" is already installed and default
    When I enter "gvm selfupdate"
    Then the candidate "vertx" version "1.3.0.final" is installed
    And the candidate "vert.x" version "1.3.0.final" is not installed
