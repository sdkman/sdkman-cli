Feature: Broadcast

  Background:
    Given the internet is reachable
    And an initialised environment
    And the system is bootstrapped

  Scenario: A command is issued with no prior Broadcast received
    Given no prior Broadcast was received
    And a new Broadcast "This is a LIVE Broadcast!" with id "12345" is available
    When I enter "sdk version"
    Then I see "This is a LIVE Broadcast!"

  Scenario: A command is issued where the prior Broadcast was different to the Live one
    Given a prior Broadcast "This is an OLD Broadcast!" with id "12344" was issued
    And a new Broadcast "This is a LIVE Broadcast!" with id "12345" is available
    When I enter "sdk version"
    Then I see "This is a LIVE Broadcast!"

  Scenario: A command is issued where the prior Broadcast was the same as the Live one
    Given a prior Broadcast "This is a LIVE Broadcast!" with id "12345" was issued
    And a new Broadcast "This is a LIVE Broadcast!" with id "12345" is available
    When I enter "sdk version"
    Then I do not see "This is a LIVE Broadcast!"

  Scenario: A Broadcast command recalls a prior Broadcast
    Given a prior Broadcast "This is an OLD Broadcast!" with id "12344" was issued
    And a new Broadcast "This is an OLD Broadcast!" with id "12344" is available
    When I enter "sdk broadcast"
    Then I see "This is an OLD Broadcast!"

  Scenario: A Broadcast command is issued with no prior Broadcast received
    Given no prior Broadcast was received
    And a new Broadcast "This is a LIVE Broadcast!" with id "12345" is available
    When I enter "sdk broadcast"
    Then I see "This is a LIVE Broadcast!"

