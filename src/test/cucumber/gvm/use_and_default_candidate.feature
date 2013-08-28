Feature: Use and Default Candidate

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Use without providing a Candidate
    When I enter "gvm use"
    Then I see "Usage: gvm <command> <candidate> [version]"

  Scenario: Use a candidate version that is installed
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "grails" version "1.3.9" is already installed but not default
    When I enter "gvm use grails 1.3.9"
    Then I see "Using grails version 1.3.9 in this shell."
    Then the candidate "grails" version "1.3.9" should be in use
    And the candidate "grails" version "2.1.0" should be the default

  Scenario: Use a candidate version that is not installed
    When I enter "gvm use grails 1.3.9" and answer "Y"
    Then I see "Using grails version 1.3.9 in this shell."
    And the candidate "grails" version "1.3.9" should be in use

  Scenario: Use a candidate version that is automatically installed
    And I have configured "gvm_auto_answer" to "true"
    When I enter "gvm use grails 1.3.9"
    Then I see "Stop! grails 1.3.9 is not installed."
    Then I see "Using grails version 1.3.9 in this shell."
    And the candidate "grails" version "1.3.9" should be in use

  Scenario: Use a candidate version that does not exist
    When I enter "gvm use groovy 1.9.9"
    Then I see "Stop! 1.9.9 is not a valid groovy version."

  Scenario: Use a candidate version that only exists locally
    Given the candidate "grails" version "2.0.0.M1" is not available for download
    And the candidate "grails" version "2.0.0.M1" is already installed but not default
    When I enter "gvm use grails 2.0.0.M1"
    Then I see "Using grails version 2.0.0.M1 in this shell."

  Scenario: Default a candidate version that is not installed
    When I enter "gvm default groovy 2.0.5"
    Then I see "Stop! groovy 2.0.5 is not installed."

  Scenario: Default a candidate version that is installed and not default
    And the candidate "groovy" version "2.0.5" is already installed but not default
    When I enter "gvm default groovy 2.0.5"
    Then I see "Default groovy version set to 2.0.5"
    And the candidate "groovy" version "2.0.5" should be the default

  Scenario: Default a candidate version that is installed and already default
    And the candidate "groovy" version "2.0.5" is already installed and default
    When I enter "gvm default groovy 2.0.5"
    Then I see "Default groovy version set to 2.0.5"
    And the candidate "groovy" version "2.0.5" should be the default

  Scenario: Default a candidate version that does not exist
    When I enter "gvm default groovy 2.9.9"
    Then I see "Stop! 2.9.9 is not a valid groovy version."
