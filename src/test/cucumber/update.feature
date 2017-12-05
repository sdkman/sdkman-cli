Feature: Update

  Background:
    Given the internet is reachable
    And the following candidates are available for installation in local cache:
      | candidate |
      | ceylon    |
      | groovy    |
      | scala     |
    And an initialised environment
    And the system is bootstrapped

  Scenario: A new candidate is available
    And the following candidates are currently available from remote API:
      | candidate |
      | ceylon    |
      | groovy    |
      | kotlin    |
      | scala     |
    When I enter "sdk update"
    Then I see "New candidates(s) found: kotlin"
    And the Candidates cache should contain "ceylon,groovy,kotlin,scala"

  Scenario: A candidate has been removed
    And the following candidates are currently available from remote API:
      | candidate |
      | groovy    |
      | scala     |
    When I enter "sdk update"
    Then I see "Retired candidates(s) removed: ceylon"
    And the Candidates cache should contain "groovy,scala"

  Scenario: No new candidate is available
    And the following candidates are currently available from remote API:
      | candidate |
      | ceylon    |
      | groovy    |
      | scala     |
    When I enter "sdk update"
    Then I see "No new candidates found at this time."
    And the Candidates cache should contain "ceylon,groovy,scala"

  Scenario:
