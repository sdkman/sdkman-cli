Feature: Upgrade Candidate

  Background:
    Given the internet is reachable
    And the candidates cache is initialised with "grails"
    And an initialised environment

  Scenario: Display upgradable candidate version in use when it is upgradable
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.4.4"
    And the system is bootstrapped
    When I enter "sdk upgrade grails" and answer "n"
    Then I see "Upgrade:"
    And I see "grails (1.3.9 < 2.4.4)"

  Scenario: Display upgradable candidate version in use when it is not upgradable
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "1.3.9"
    And the system is bootstrapped
    When I enter "sdk upgrade grails"
    Then I see "grails is up-to-date"

  Scenario: Display upgradable candidate version when none is in use
    Given the candidate "grails" does not exist locally
    And the system is bootstrapped
    When I enter "sdk upgrade grails"
    Then I see "Not using any version of grails"

  Scenario: Display upgradable candidate versions when none is specified and none is in use
    Given the candidate "grails" does not exist locally
    And the system is bootstrapped
    When I enter "sdk upgrade"
    Then I see "No candidates are in use"

  Scenario: Display upgradable candidate versions when none is specified and one is in use
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.4.4"
    And the system is bootstrapped
    When I enter "sdk upgrade" and answer "n"
    Then I see "Upgrade:"
    And I see "grails (1.3.9 < 2.4.4)"

  Scenario: Display upgradable candidate versions when none is specified and multiple are in use
    Given  the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.4.4"
    And the candidate "groovy" version "2.0.5" is already installed and default
    And the default "groovy" version is "2.4.1"
    And the system is bootstrapped
    When I enter "sdk upgrade" and answer "n"
    Then I see "Upgrade:"
    And I see "grails (1.3.9 < 2.4.4)"
    And I see "groovy (2.0.5 < 2.4.1)"

  Scenario: Display upgradable candidate versions when none specified and multiple in use but not upgradable
    Given  the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "1.3.9"
    And the candidate "groovy" version "2.0.5" is already installed and default
    And the default "groovy" version is "2.0.5"
    And the system is bootstrapped
    When I enter "sdk upgrade"
    Then I see "All candidates are up-to-date"

  Scenario: Update all upgradable candidates versions and set them as default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.1.0"
    And the candidate "grails" version "2.1.0" is available for download
    And the candidate "groovy" version "2.0.5" is already installed and default
    And the default "groovy" version is "2.4.1"
    And the candidate "groovy" version "2.4.1" is available for download
    And the system is bootstrapped
    When I enter "sdk upgrade" and answer "Y"
    Then I see "Upgrade:"
    And I see "grails (1.3.9 < 2.1.0)"
    And I see "groovy (2.0.5 < 2.4.1)"
    And I see "Upgrade candidate(s) and set latest version(s) as default? (Y/n)"
    And I do not see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And I see "Setting grails 2.1.0 as default."
    And I do not see "Do you want groovy 2.4.1 to be set as default? (Y/n)"
    And I see "Setting groovy 2.4.1 as default."
    Then the candidate "grails" version "2.1.0" should be the default
    And the candidate "groovy" version "2.4.1" should be the default

  Scenario: Don't update all upgradable candidates versions and set them as default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.1.0"
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    When I enter "sdk upgrade" and answer "N"
    Then I see "Upgrade:"
    And I see "grails (1.3.9 < 2.1.0)"
    And I see "Upgrade candidate(s) and set latest version(s) as default? (Y/n)"
    Then the candidate "grails" version "1.3.9" should be the default

  Scenario: Update upgradable candidate version and set it as default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.1.0"
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    When I enter "sdk upgrade grails" and answer "Y"
    Then I see "Upgrade:"
    And I see "grails (1.3.9 < 2.1.0)"
    And I see "Upgrade candidate(s) and set latest version(s) as default? (Y/n): "
    And I do not see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And I see "Setting grails 2.1.0 as default."
    Then the candidate "grails" version "2.1.0" should be the default

  Scenario: Don't update upgradable candidate version and set it as default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.1.0"
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    When I enter "sdk upgrade grails" and answer "N"
    Then I see "Upgrade:"
    And I see "grails (1.3.9 < 2.1.0)"
    And I see "Upgrade candidate(s) and set latest version(s) as default? (Y/n)"
    Then the candidate "grails" version "1.3.9" should be the default
