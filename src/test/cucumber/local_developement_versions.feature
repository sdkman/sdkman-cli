Feature: Local Development Versions

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Install a new local development version
    Given the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And I have a local candidate "groovy" version "2.1-SNAPSHOT" at "/tmp/groovy-core"
    And the system is bootstrapped
    When I enter "sdk install groovy 2.1-SNAPSHOT /tmp/groovy-core"
    Then I see "Linking groovy 2.1-SNAPSHOT to /tmp/groovy-core"
    And the candidate "groovy" version "2.1-SNAPSHOT" is linked to "/tmp/groovy-core"

  Scenario: Attempt installing a local development version that already exists
    Given the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And the candidate "groovy" version "2.1-SNAPSHOT" is already linked to "/tmp/groovy-core"
    And the system is bootstrapped
    When I enter "sdk install groovy 2.1-SNAPSHOT /tmp/groovy-core"
    Then I see "Stop! groovy 2.1-SNAPSHOT is already installed."
    And the candidate "groovy" version "2.1-SNAPSHOT" is linked to "/tmp/groovy-core"

  Scenario: Uninstall a local development version
    Given the candidate "groovy" version "2.1-SNAPSHOT" is already linked to "/tmp/groovy-core"
    And the system is bootstrapped
    When I enter "sdk uninstall groovy 2.1-SNAPSHOT"
    Then I see "Uninstalling groovy 2.1-SNAPSHOT"
    And the candidate "groovy" version "2.1-SNAPSHOT" is not installed

  Scenario: Attempt uninstalling a local development version that is not installed
    Given the candidate "groovy" version "2.1-SNAPSHOT" is not installed
    And the system is bootstrapped
    When I enter "sdk uninstall groovy 2.1-SNAPSHOT"
    Then I see "groovy 2.1-SNAPSHOT is not installed."

  Scenario: Make the local development version the default for the candidate
    Given the candidate "groovy" version "2.0.6" is already installed and default
    And the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And the candidate "groovy" version "2.1-SNAPSHOT" is already linked to "/tmp/groovy-core"
    And the system is bootstrapped
    When I enter "sdk default groovy 2.1-SNAPSHOT"
    Then I see "Default groovy version set to 2.1-SNAPSHOT"
    And the candidate "groovy" version "2.1-SNAPSHOT" should be the default

  Scenario: Use a local development version
    Given the candidate "groovy" version "2.0.6" is already installed and default
    And the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And the candidate "groovy" version "2.1-SNAPSHOT" is already linked to "/tmp/groovy-core"
    And the system is bootstrapped
    When I enter "sdk use groovy 2.1-SNAPSHOT"
    Then I see "Using groovy version 2.1-SNAPSHOT in this shell"
    And the candidate "groovy" version "2.1-SNAPSHOT" should be in use

  Scenario: Install a local development version from a valid relative path
    Given the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And I have a local candidate "groovy" version "2.1-SNAPSHOT" at relative path "some/relative/path/to/groovy"
    And the system is bootstrapped
    When I enter "sdk install groovy 2.1-SNAPSHOT some/relative/path/to/groovy"
    Then I see "Linking groovy 2.1-SNAPSHOT"
    And the candidate "groovy" version "2.1-SNAPSHOT" is linked to the relative path "some/relative/path/to/groovy"

  Scenario: Prevent installation of a local development version for an invalid path
    Given the candidate "groovy" version "2.1-SNAPSHOT" is not available for download
    And the system is bootstrapped
    When I enter "sdk install groovy 2.1-SNAPSHOT /some/bogus/path/to/groovy"
    Then I see "Invalid path! Refusing to link groovy 2.1-SNAPSHOT to /some/bogus/path/to/groovy."
    And the candidate "groovy" version "2.1-SNAPSHOT" is not installed

  Scenario: Prevent installation of a local development version for a long version
    Given the candidate "groovy" version "2.1-SNAPSHOTLONG" is not available for download
    And I have a local candidate "groovy" version "2.1-SNAPSHOTLONG" at relative path "some/relative/path/to/groovy"
    And the system is bootstrapped
    When I enter "sdk install groovy 2.1-SNAPSHOTLONG some/relative/path/to/groovy"
    Then I see "Invalid version! 2.1-SNAPSHOTLONG with length 16 exceeds max of 15!"
    And the candidate "groovy" version "2.1-SNAPSHOTLONG" is not installed

  Scenario: Allow installation of a local development version for longest possible version
    Given the candidate "groovy" version "2.1-SNAPSHOT-XX" is not available for download
    And I have a local candidate "groovy" version "2.1-SNAPSHOT-XX" at "/tmp/groovy-core"
    And the system is bootstrapped
    When I enter "sdk install groovy 2.1-SNAPSHOT-XX /tmp/groovy-core"
    Then I see "Linking groovy 2.1-SNAPSHOT-XX to /tmp/groovy-core"
    And the candidate "groovy" version "2.1-SNAPSHOT-XX" is linked to "/tmp/groovy-core"

  Scenario: Allow installation of a local development version for a short version
    Given the candidate "java" version "graal" is not available for download
    And I have a local candidate "java" version "graal" at "/tmp/graalvm-1.0.0-rc4-graal"
    And the system is bootstrapped
    When I enter "sdk install java graal /tmp/graalvm-1.0.0-rc4-graal"
    Then I see "Linking java graal to /tmp/graalvm-1.0.0-rc4-graal"
    And the candidate "java" version "graal" is linked to "/tmp/graalvm-1.0.0-rc4-graal"