Feature: Local Development Versions

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Install a new local development version
    Given the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And I have a local candidate "groovy" version "2.1-SNAPSHOT" at "/tmp/groovy-core"
    When I enter "sdk install groovy 2.1-SNAPSHOT /tmp/groovy-core"
    Then I see "Linking groovy 2.1-SNAPSHOT to /tmp/groovy-core"
    And the candidate "groovy" version "2.1-SNAPSHOT" is linked to "/tmp/groovy-core"

  Scenario: Attempt installing a local development version that already exists
    Given the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And the candidate "groovy" version "2.1-SNAPSHOT" is already linked to "/tmp/groovy-core"
    When I enter "sdk install groovy 2.1-SNAPSHOT /tmp/groovy-core"
    Then I see "Stop! groovy 2.1-SNAPSHOT is already installed."
    And the candidate "groovy" version "2.1-SNAPSHOT" is linked to "/tmp/groovy-core"

  Scenario: Uninstall a local development version
    Given the candidate "groovy" version "2.1-SNAPSHOT" is already linked to "/tmp/groovy-core"
    When I enter "sdk uninstall groovy 2.1-SNAPSHOT"
    Then I see "Uninstalling groovy 2.1-SNAPSHOT"
    And the candidate "groovy" version "2.1-SNAPSHOT" is not installed

  Scenario: Attempt uninstalling a local development version that is not installed
    Given the candidate "groovy" version "2.1-SNAPSHOT" is not installed
    When I enter "sdk uninstall groovy 2.1-SNAPSHOT"
    Then I see "groovy 2.1-SNAPSHOT is not installed."

  Scenario: Make the local development version the default for the candidate
    Given the candidate "groovy" version "2.0.6" is already installed and default
    And the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And the candidate "groovy" version "2.1-SNAPSHOT" is already linked to "/tmp/groovy-core"
    When I enter "sdk default groovy 2.1-SNAPSHOT"
    Then I see "Default groovy version set to 2.1-SNAPSHOT"
    And the candidate "groovy" version "2.1-SNAPSHOT" should be the default

  Scenario: Use a local development version
    Given the candidate "groovy" version "2.0.6" is already installed and default
    And the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And the candidate "groovy" version "2.1-SNAPSHOT" is already linked to "/tmp/groovy-core"
    When I enter "sdk use groovy 2.1-SNAPSHOT"
    Then I see "Using groovy version 2.1-SNAPSHOT in this shell"
    And the candidate "groovy" version "2.1-SNAPSHOT" should be in use
