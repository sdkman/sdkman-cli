Feature: Idempotent Self Update

  Scenario: Attempt Self Update on an up to date system
    Given an initialised system
    And the internet is reachable
    When I enter "gvm selfupdate"
    Then I see "No update available at this time."