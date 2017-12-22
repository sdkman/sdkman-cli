Feature: Mnemonics

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Shortcut for listing an uninstalled available Version
    Given I do not have a "grails" candidate installed
    And a "grails" list view is available for consumption
    And the system is bootstrapped
    When I enter "sdk l grails"
    Then I see "Available Grails Versions"

  Scenario: Alternate shortcut for listing uninstalled available Version
    Given I do not have a "grails" candidate installed
    And a "grails" list view is available for consumption
    And the system is bootstrapped
    When I enter "sdk ls grails"
    Then I see "Available Grails Versions"

  Scenario: Shortcut for asking help
    Given the system is bootstrapped
    When I enter "sdk h"
    Then I see "Usage: sdk <command> [candidate] [version]"

  Scenario: Shortcut for displaying current Candidate Version in use
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the system is bootstrapped
    When I enter "sdk c grails"
    Then I see "Using grails version 1.3.9"

  Scenario: Shortcut for displaying current Candidate Versions
    Given the candidate "groovy" version "2.0.5" is already installed and default
    And the candidate "grails" version "2.1.0" is already installed and default
    And the system is bootstrapped
    When I enter "sdk c"
    Then I see "Using:"
    And I see "grails: 2.1.0"
    And I see "groovy: 2.0.5"

  Scenario: Shortcut for displaying upgradable Candidate Version in use
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the default "grails" version is "2.4.4"
    And the system is bootstrapped
    When I enter "sdk ug grails" and answer "n"
    Then I see "Upgrade:"
    And I see "grails (1.3.9 < 2.4.4)"

  Scenario: Shortcut for installing a Candidate Version
    Given the candidate "grails" version "2.1.0" is not installed
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    When I enter "sdk i grails 2.1.0" and answer "Y"
    Then I see "Installing: grails 2.1.0"
    And the candidate "grails" version "2.1.0" is installed

  Scenario: Shortcut for uninstalling a Candidate Version
    Given the candidate "groovy" version "2.0.5" is already installed and default
    And the system is bootstrapped
    When I enter "sdk rm groovy 2.0.5"
    Then I see "Uninstalling groovy 2.0.5"
    And the candidate "groovy" version "2.0.5" is not installed

  Scenario: Shortcut for showing the current Version of sdkman
    Given the system is bootstrapped
    When I enter "sdk v"
    Then I see "SDKMAN 5.0.0"

  Scenario: Shortcut for using a candidate version that is installed
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "grails" version "2.1.0" is a valid candidate version
    And the candidate "grails" version "1.3.9" is already installed but not default
    And the candidate "grails" version "1.3.9" is a valid candidate version
    And the system is bootstrapped
    When I enter "sdk u grails 1.3.9"
    Then I see "Using grails version 1.3.9 in this shell."
    Then the candidate "grails" version "1.3.9" should be in use
    And the candidate "grails" version "2.1.0" should be the default

  Scenario: Shortcut for defaulting a Candidate Version that is installed and not default
    Given the candidate "groovy" version "2.0.5" is already installed but not default
    And the candidate "groovy" version "2.0.5" is a valid candidate version
    And the system is bootstrapped
    When I enter "sdk d groovy 2.0.5"
    Then I see "Default groovy version set to 2.0.5"
    And the candidate "groovy" version "2.0.5" should be the default

  Scenario: Shortcut for a Broadcast command issued
    Given no prior Broadcast was received
    And a new Broadcast "This is a LIVE Broadcast!" with id "12345" is available
    And the system is bootstrapped
    When I enter "sdk b"
    Then I see "This is a LIVE Broadcast!"
