@manual
Feature: List Candidates

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: List an uninstalled available Version
    Given I do not have a "grails" candidate installed
    When I enter "sdk list grails"
    Then I see "Available Grails Versions"
    And I see "     2.1.0"

  Scenario: List an installed available Version not in use
    Given the candidate "grails" version "2.1.0" is already installed but not default
    When I enter "sdk list grails"
    Then I see "Available Grails Versions"
    And I see "   * 2.1.0"

  Scenario: List an installed available Version in use
    Given the candidate "grails" version "2.1.0" is already installed and default
    When I enter "sdk list grails"
    Then I see "Available Grails Versions"
    And I see " > * 2.1.0"

  Scenario: List an installed local version not in use
    Given I have a local candidate "grails" version "2.3-SNAPSHOT" at "/tmp/groovy-core"
    And the candidate "groovy" version "2.2-SNAPSHOT" is already linked to "/tmp/groovy-core"
    When I enter "sdk list groovy"
    Then I see "Available Groovy Versions"
    And I see "   + 2.2-SNAPSHOT"

  Scenario: List an installed local Version in use
    Given I have a local candidate "groovy" version "2.2-SNAPSHOT" at "/tmp/groovy-core"
    And the candidate "groovy" version "2.2-SNAPSHOT" is already linked to "/tmp/groovy-core"
    And the candidate "groovy" version "2.2-SNAPSHOT" is the default
    When I enter "sdk list groovy"
    Then I see "Available Groovy Versions"
    And I see " > + 2.2-SNAPSHOT"
