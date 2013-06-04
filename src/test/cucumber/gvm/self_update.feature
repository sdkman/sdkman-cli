Feature: Self Update

  Background:
    Given an initialised system
    And an outdated system
    And the internet is reachable

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

  Scenario: Update an installation without an Auto Answer config
    Given an empty configuration file
    When I enter "gvm selfupdate"
    Then the configuration file contains "gvm_auto_answer=false"

  Scenario: Update an installation already containing an Auto Answer config
    Given the configuration file has been primed with "gvm_auto_answer=true"
    When I enter "gvm selfupdate"
    Then the configuration file contains "gvm_auto_answer=true"
    And the configuration file does not contain "gvm_auto_answer=false"

  Scenario: Rename the vertx Candidate on Upgrade
    Given the candidate "vert.x" version "1.3.0.final" is already installed and default
    And the candidate "vertx" does not exist
    When I enter "gvm selfupdate"
    Then the candidate "vertx" version "1.3.0.final" is installed
    And the candidate "vert.x" version "1.3.0.final" is not installed

  Scenario: Ignore an already converted vertx Candidate on Upgrade
    Given the candidate "vertx" version "1.3.0.final" is already installed and default
    When I enter "gvm selfupdate"
    Then the candidate "vertx" version "1.3.0.final" is installed
    And the candidate "vert.x" version "1.3.0.final" is not installed
