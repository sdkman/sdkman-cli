Feature: Version

  Background:
    Given the internet is reachable

  Scenario: Show the current version of gvm
    When I enter "gvm version"
      Then I see "Groovy enVironment Manager 0.9.3"

  Scenario: The local gvm is out of date
    Given no prior Broadcast was received
    And a new Broadcast "This is a LIVE Broadcast!" is available
    When I enter "gvm broadcast"
    Then I see only "This is a LIVE Broadcast!"
