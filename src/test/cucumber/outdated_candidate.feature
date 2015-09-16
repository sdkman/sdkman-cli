Feature: Outdated Candidate

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Display outdated candidate version in use when it is outdated
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" candidate is "2.4.4"
    When I enter "sdk outdated grails"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.4.4)"

  Scenario: Display outdated candidate version in use when it is not outdated
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" candidate is "1.3.9"
    When I enter "sdk outdated grails"
    Then I see "grails is up-to-date"

  Scenario: Display outdated candidate version when none is in use
    Given the candidate "grails" does not exist
    When I enter "sdk outdated grails"
    Then I see "Not using any version of grails"

  Scenario: Display outdated candidate versions when none is specified and none is in use
    Given the candidate "grails" does not exist
    When I enter "sdk outdated"
    Then I see "No candidates are in use"

  Scenario: Display outdated candidate versions when none is specified and one is in use
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" candidate is "2.4.4"
    When I enter "sdk outdated"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.4.4)"

  Scenario: Display outdated candidate versions when none is specified and multiple are in use
    Given  the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" candidate is "2.4.4"
    And the candidate "groovy" version "2.0.5" is already installed and default
    And the default "groovy" candidate is "2.4.1"
    When I enter "sdk outdated"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.4.4)"
    And I see "groovy (2.0.5 < 2.4.1)"

  Scenario: Display outdated candidate versions when none specified and multiple in use but not outdated
    Given  the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" candidate is "1.3.9"
    And the candidate "groovy" version "2.0.5" is already installed and default
    And the default "groovy" candidate is "2.0.5"
    When I enter "sdk outdated"
    Then I see "All candidates are up-to-date"
