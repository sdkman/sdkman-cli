Feature: Outdated Candidate

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Display outdated candidate version in use when it is outdated
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.4.4"
    And the system is bootstrapped
    When I enter "sdk outdated grails"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.4.4)"

  Scenario: Display outdated candidate version in use when it is not outdated
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "1.3.9"
    And the system is bootstrapped
    When I enter "sdk outdated grails"
    Then I see "grails is up-to-date"

  Scenario: Display outdated candidate version when none is in use
    Given the candidate "grails" does not exist locally
    And the system is bootstrapped
    When I enter "sdk outdated grails"
    Then I see "Not using any version of grails"

  Scenario: Display outdated candidate versions when none is specified and none is in use
    Given the candidate "grails" does not exist locally
    And the system is bootstrapped
    When I enter "sdk outdated"
    Then I see "No candidates are in use"

  Scenario: Display outdated candidate versions when none is specified and one is in use
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.4.4"
    And the system is bootstrapped
    When I enter "sdk outdated"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.4.4)"

  Scenario: Display outdated candidate versions when none is specified and multiple are in use
    Given  the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.4.4"
    And the candidate "groovy" version "2.0.5" is already installed and default
    And the default "groovy" version is "2.4.1"
    And the system is bootstrapped
    When I enter "sdk outdated"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.4.4)"
    And I see "groovy (2.0.5 < 2.4.1)"

  Scenario: Display outdated candidate versions when none specified and multiple in use but not outdated
    Given  the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "1.3.9"
    And the candidate "groovy" version "2.0.5" is already installed and default
    And the default "groovy" version is "2.0.5"
    And the system is bootstrapped
    When I enter "sdk outdated"
    Then I see "All candidates are up-to-date"

  Scenario: Update all outdated candidates versions and set them as default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.1.0"
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    When I enter "sdk outdated" and answer "Y"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.1.0)"
    And I see "Update candidate(s) and set latest version(s) as default? (Y/n)"
    And I do not see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And I see "Setting grails 2.1.0 as default."
    Then the candidate "grails" version "2.1.0" should be the default

  Scenario: Don't update all outdated candidates versions and set them as default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.1.0"
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    When I enter "sdk outdated" and answer "N"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.1.0)"
    And I see "Update candidate(s) and set latest version(s) as default? (Y/n)"
    Then the candidate "grails" version "1.3.9" should be the default

  Scenario: Update outdated candidate version and set it as default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.1.0"
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    When I enter "sdk outdated grails" and answer "Y"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.1.0)"
    And I see "Update candidate(s) and set latest version(s) as default? (Y/n): "
    And I do not see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And I see "Setting grails 2.1.0 as default."
    Then the candidate "grails" version "2.1.0" should be the default

  Scenario: Don't update outdated candidate version and set it as default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.1.0"
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    When I enter "sdk outdated grails" and answer "N"
    Then I see "Outdated:"
    And I see "grails (1.3.9 < 2.1.0)"
    And I see "Update candidate(s) and set latest version(s) as default? (Y/n)"
    Then the candidate "grails" version "1.3.9" should be the default
