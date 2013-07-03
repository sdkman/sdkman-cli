Feature: Initialisation

  Background:
    Given the internet is reachable

  Scenario: Use gvm for the first time
    When I enter "gvm"
    Then the gvm work folder is created

  Scenario: Use gvm after initialisation
    Given an initialised system
    When I enter "gvm"
    Then I see "Usage: gvm <command> <candidate> [version]"
    Then the gvm work folder is created

  Scenario: gvm is initialised for the first time
    Given an initialised shell
    When I enter "echo $GVM_INIT"
    Then I see "true"
    When I enter "echo $PATH"
    Then I see a single occurrence of "grails"

  Scenario: gvm is initialised a subsequent time
    Given an initialised shell
    When I reinitialise the shell
    And I enter "echo $PATH"
    Then I see a single occurrence of "grails"
