Feature: Local Development Versions

  Background:
    Given the internet is reachable

  Scenario: Install a new local development version
    Given the candidate "groovy" version "2.1-SNAPSHOT" does not exist
    And I have a local candidate "groovy" version "2.1-SNAPSHOT" at "/tmp/groovy-core"
    When I enter "gvm install groovy 2.1-SNAPSHOT /tmp/groovy-core"
    Then I see "Linking groovy 2.1-SNAPSHOT to /tmp/groovy-core"
    And the candidate "groovy" version "2.1-SNAPSHOT" is linked to "/tmp/groovy-core"

  Scenario: Attempt installing a local development version that already exists

  Scenario: Uninstall a local development version

  Scenario: Attempt uninstalling a local development version that is not installed

  Scenario: Make the local development version the default for the candidate

  Scenario: Use a local development version
