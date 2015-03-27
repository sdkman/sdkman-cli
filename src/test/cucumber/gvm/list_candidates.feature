@manual
Feature: List Candidates

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: List an uninstalled available Version
    Given I do not have a "grails" candidate installed
    When I enter "gvm list grails"
    Then I see "Available Grails Versions"
    And I see "     2.1.0"

  Scenario: List an installed available Version not in use
    Given the candidate "grails" version "2.1.0" is already installed but not default
    When I enter "gvm list grails"
    Then I see "Available Grails Versions"
    And I see "   * 2.1.0"

  Scenario: List an installed available Version in use
    Given the candidate "grails" version "2.1.0" is already installed and default
    When I enter "gvm list grails"
    Then I see "Available Grails Versions"
    And I see " > * 2.1.0"

  Scenario: List an installed local version not in use
    Given I have a local candidate "grails" version "2.3-SNAPSHOT" at "/tmp/groovy-core"
    And the candidate "groovy" version "2.2-SNAPSHOT" is already linked to "/tmp/groovy-core"
    When I enter "gvm list groovy"
    Then I see "Available Groovy Versions"
    And I see "   + 2.2-SNAPSHOT"

  Scenario: List an installed local Version in use
    Given I have a local candidate "groovy" version "2.2-SNAPSHOT" at "/tmp/groovy-core"
    And the candidate "groovy" version "2.2-SNAPSHOT" is already linked to "/tmp/groovy-core"
    And the candidate "groovy" version "2.2-SNAPSHOT" is the default
    When I enter "gvm list groovy"
    Then I see "Available Groovy Versions"
    And I see " > + 2.2-SNAPSHOT"

  Scenario: List all abailable versions and validate sorting
    Given I do not have a "groovy" candidate installed
    When I enter "gvm list groovy"
    Then I see "Available Groovy Versions"
    And I see a sorted table of versions
      |  2.4.3  |   2.3.0  |  2.0.7  |  1.8.2  |
      |  2.4.2  |   2.2.2  |  2.0.6  |  1.8.1  |
      |  2.4.1  |   2.2.1  |  2.0.5  |  1.8.0  |
      |  2.4.0  |   2.2.0  |  2.0.4  |  1.7.11 |
      |  2.3.11 |   2.1.9  |  2.0.3  |  1.7.10 |
      |  2.3.10 |   2.1.8  |  2.0.2  |  1.7.9  |
      |  2.3.9  |   2.1.7  |  2.0.1  |  1.7.8  |
      |  2.3.8  |   2.1.6  |  2.0.0  |  1.7.7  |
      |  2.3.7  |   2.1.5  |  1.8.9  |  1.7.6  |
      |  2.3.6  |   2.1.4  |  1.8.8  |  1.7.5  |
      |  2.3.5  |   2.1.3  |  1.8.7  |  1.7.4  |
      |  2.3.4  |   2.1.2  |  1.8.6  |  1.7.3  |
      |  2.3.3  |   2.1.1  |  1.8.5  |  1.7.2  |
      |  2.3.2  |   2.1.0  |  1.8.4  |  1.7.1  |
      |  2.3.1  |   2.0.8  |  1.8.3  |  1.7.0  |

