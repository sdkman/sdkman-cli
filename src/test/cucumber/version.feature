Feature: Version

  Background:
    Given the internet is reachable
    And an initialised environment
    And the system is bootstrapped

  Scenario: Show the current version of sdkman
    When I enter "sdk version"
    Then I see "SDKMAN x.y.z"
