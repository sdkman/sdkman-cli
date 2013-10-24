@manual
Feature: Idempotent Self Update

  Scenario: Attempt Self Update on an up to date system
    Given the internet is reachable
    And an initialised environment
    When I enter "gvm selfupdate"
    Then I see "No update available at this time."