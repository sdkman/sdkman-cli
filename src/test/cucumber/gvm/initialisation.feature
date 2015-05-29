Feature: Initialisation

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Use sdkman for the first time
    When I enter "gvm"
    Then the sdkman work folder is created

  Scenario: Use sdkman after initialisation
    When I enter "gvm"
    Then I see "Usage: gvm <command> <candidate> [version]"
    Then the sdkman work folder is created

  Scenario: sdkman is initialised for the first time
    Given an initialised shell
    When I enter "echo $SDKMAN_INIT"
    Then I see "true"
    When I enter "echo $PATH"
    Then I see a single occurrence of "grails"

  Scenario: sdkman is initialised a subsequent time
    Given an initialised shell
    When I reinitialise the shell
    And I enter "echo $PATH"
    Then I see a single occurrence of "grails"
