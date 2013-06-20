Feature: Shortcuts

  Background:
    Given the internet is reachable

  Scenario: Shortcut - List an uninstalled available Version
    Given I do not have a "grails" candidate installed
    When I enter "gvm ls grails"
    Then I see "Available Grails Versions"
    And I see "     2.1.0"

  Scenario: Shortcut - Ask for help
    When I enter "gvm h"
    Then I see "Usage: gvm <command> <candidate> [version]"

  Scenario: Shortcut - Display current candidate version in use
    Given the candidate "grails" version "1.3.9" is already installed and default
    When I enter "gvm cur grails"
    Then I see "Using grails version 1.3.9"

  Scenario: Shortcut - Display current candidate versions
    Given the candidate "groovy" version "2.0.5" is already installed and default
    And the candidate "grails" version "2.1.0" is already installed and default
    When I enter "gvm cur"
    Then I see "Using:"
    And I see "grails: 2.1.0"
    And I see "groovy: 2.0.5"

  Scenario: Shortcut - Uninstall a local development version
    Given the candidate "groovy" version "2.1-SNAPSHOT" is already linked to "/tmp/groovy-core"
    When I enter "gvm remove groovy 2.1-SNAPSHOT"
    Then I see "Uninstalling groovy 2.1-SNAPSHOT"
    And the candidate "groovy" version "2.1-SNAPSHOT" is not installed

  Scenario: Shortcut - Show the current version of gvm
    When I enter "gvm version"
    Then I see "Groovy enVironment Manager x.y.z"

  Scenario: Shortcut - Use a candidate version that is installed
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "grails" version "1.3.9" is already installed but not default
    When I enter "gvm u grails 1.3.9"
    Then I see "Using grails version 1.3.9 in this shell."
    Then the candidate "grails" version "1.3.9" should be in use
    And the candidate "grails" version "2.1.0" should be the default

  Scenario: Shortcut - Default a candidate version that is installed and not default
    And the candidate "groovy" version "2.0.5" is already installed but not default
    When I enter "gvm def groovy 2.0.5"
    Then I see "Default groovy version set to 2.0.5"
    And the candidate "groovy" version "2.0.5" should be the default

