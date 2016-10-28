Feature: Use Version

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Use without providing a Candidate
    Given the system is bootstrapped
    When I enter "sdk use"
    Then I see "Usage: sdk <command> [candidate] [version]"

  Scenario: Use a candidate version that is installed
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "grails" version "1.3.9" is a valid candidate version
    And the candidate "grails" version "1.3.9" is already installed but not default
    And the system is bootstrapped
    When I enter "sdk use grails 1.3.9"
    Then I see "Using grails version 1.3.9 in this shell."
    Then the candidate "grails" version "1.3.9" should be in use
    And the candidate "grails" version "2.1.0" should be the default

  Scenario: Use a candidate version that is not installed
    Given the candidate "grails" version "1.3.9" is available for download
    And the system is bootstrapped
    When I enter "sdk use grails 1.3.9" and answer "Y"
    Then I see "Using grails version 1.3.9 in this shell."
    And the candidate "grails" version "1.3.9" should be in use

  Scenario: Use a candidate version that is automatically installed
    Given I have configured "sdkman_auto_answer" to "true"
    And the candidate "grails" version "1.3.9" is available for download
    And the system is bootstrapped
    When I enter "sdk use grails 1.3.9"
    Then I see "Stop! grails 1.3.9 is not installed."
    Then I see "Using grails version 1.3.9 in this shell."
    And the candidate "grails" version "1.3.9" should be in use

  Scenario: Use a candidate version that does not exist
    Given the candidate "groovy" version "1.9.9" is not available for download
    And the system is bootstrapped
    When I enter "sdk use groovy 1.9.9"
    Then I see "Stop! groovy 1.9.9 is not available."

  Scenario: Use a candidate version that only exists locally
    Given the candidate "grails" version "2.0.0.M1" is not available for download
    And the candidate "grails" version "2.0.0.M1" is already installed but not default
    And the system is bootstrapped
    When I enter "sdk use grails 2.0.0.M1"
    Then I see "Using grails version 2.0.0.M1 in this shell."

  Scenario: Use an uninstalled candidate version of an uninstalled candidate and it becomes default
    Given the candidate "grails" version "1.3.9" is available for download
    And the candidate "grails" does not exist locally
    And the system is bootstrapped
    When I enter "sdk use grails 1.3.9" and answer "Y"
    Then I see "Setting grails version 1.3.9 as default."
    And I see "Using grails version 1.3.9 in this shell."
    And the candidate "grails" version "1.3.9" is installed
    And the candidate "grails" version "1.3.9" should be the default

  Scenario: Use an uninstalled candidate version of an installed candidate and it does not become default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    When I enter "sdk use grails 2.1.0" and answer "Y"
    Then I do not see "Setting grails version 1.3.9 as default."
    And I see "Using grails version 2.1.0 in this shell."
    And the candidate "grails" version "2.1.0" is installed
    And the candidate "grails" version "1.3.9" should be the default

  #scenarios related to updating _HOME variable

  Scenario: Use an installed version of an installed candidate updates the candidate _HOME variable
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the candidate "grails" version "2.1.0" is already installed but not default
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    And the "GRAILS_HOME" variable contains "grails/current"
    When I enter "sdk use grails 2.1.0"
    And I see "Using grails version 2.1.0 in this shell."
    Then the "GRAILS_HOME" variable contains "grails/2.1.0"

  Scenario: Use an uninstalled version of an uninstalled candidate updates the candidate _HOME variable
    Given the candidate "grails" does not exist locally
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    And the "GRAILS_HOME" variable is not set
    When I enter "sdk use grails 2.1.0" and answer "Y"
    Then the "GRAILS_HOME" variable contains "grails/2.1.0"

  Scenario: Use an uninstalled version of an installed candidate updates the candidate _HOME variable
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the candidate "grails" version "2.1.0" is available for download
    And the system is bootstrapped
    And the "GRAILS_HOME" variable contains "grails/current"
    When I enter "sdk use grails 2.1.0" and answer "Y"
    Then the "GRAILS_HOME" variable contains "grails/2.1.0"

