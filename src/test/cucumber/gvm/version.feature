Feature: Version

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Show the current version of sdkman
    When I enter "sdk version"
    Then I see "Groovy enVironment Manager x.y.z"