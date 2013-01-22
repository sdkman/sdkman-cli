Feature: Use and Default Candidate

  Background:
    Given the internet is reachable

  Scenario: Use without providing a Candidate
    When I enter "gvm use"
    Then I see "Usage: gvm <command> <candidate> [version]"

  Scenario: Use a candidate version that is installed
    Given the candidate "groovy" version "2.0.5" is already installed and default
    And the candidate "groovy" version "1.8.8" is already installed but not default
    When I enter "gvm use groovy 1.8.8"
    Then I see "Using groovy version 1.8.8 in this shell."
    Then the candidate "groovy" version "1.8.8" should be in use
    And the candidate "groovy" version "2.0.5" should be the default

  Scenario: Use a candidate version that is not installed
    When I enter "gvm use groovy 1.8.8" and answer "Y"
    Then I see "Using groovy version 1.8.8 in this shell."
    And the candidate "groovy" version "1.8.8" should be in use

  Scenario: Use a candidate version that does not exist
    When I enter "gvm use groovy 1.9.9"
    Then I see "Stop! 1.9.9 is not a valid groovy version."

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
