Feature: Hooks

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Pre- and Post-installation Hooks return successfully
    And a machine with "Linux" installed
    And the system is bootstrapped
    And the candidate "java" version "8u92" is available for download on "Linux"
    And a "pre" install hook is served for "java" "8u92" on "Linux" that returns successfully
    And a "post" install hook is served for "java" "8u92" on "Linux" that returns successfully
    When I enter "sdk install java 8u92"
    Then I see "Pre-installation hook success"
    And I see "Post-installation hook success"

  Scenario: Pre-installation Hook returns a non-zero code
    And a machine with "Linux" installed
    And the system is bootstrapped
    And the candidate "java" version "8u92" is available for download on "Linux"
    And a "pre" install hook is served for "java" "8u92" on "Linux" that returns a failure
    When I enter "sdk install java 8u92"
    Then I see "Pre-installation hook failure"

  Scenario: Post-install Hook returns a non-zero code
    And a machine with "Linux" installed
    And the system is bootstrapped
    And the candidate "java" version "8u92" is available for download on "Linux"
    And a "pre" install hook is served for "java" "8u92" on "Linux" that returns successfully
    And a "post" install hook is served for "java" "8u92" on "Linux" that returns a failure
    When I enter "sdk install java 8u92"
    Then I see "Post-installation hook failure"
