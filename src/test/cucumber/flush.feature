Feature: Flush

  Background:
    Given the internet is reachable
    And an initialised environment
    And the system is bootstrapped

  Scenario: Flush omitting the Qualifier
    When I enter "sdk flush"
    Then I see "Stop! Please specify what you want to flush."

  Scenario: Clean up the current Broadcast
    Given a prior Broadcast "This is an old broadcast" with id "12344" was issued
    When I enter "sdk flush broadcast"
    Then no broadcast message can be found
    And I see "Broadcast has been flushed."

  Scenario: Clean up an uninitialised Broadcast
    Given the broadcast has been flushed
    When I enter "sdk flush broadcast"
    Then I see "No prior broadcast found so not flushed."

  Scenario: Clean up the last known Remote Version
    Given a prior version "5.0.0" was detected
    When I enter "sdk flush version"
    Then no version file can be found
    And I see "Version file has been flushed."

  Scenario: Clean up an uninitialised last known Remote Version
    Given the Remote Version has been flushed
    When I enter "sdk flush version"
    Then I see "No prior Remote Version found so not flushed."

  Scenario: Clear out the cached Archives
    Given the archive "grails-1.3.9.zip" has been cached
    When I enter "sdk flush archives"
    Then no archives are cached
    And I see "1 archive(s) flushed"

  Scenario: Clear out the temporary space
    Given the file "res-1.2.0.zip" in temporary storage
    When I enter "sdk flush temp"
    Then no "res-1.2.0.zip" file is present in temporary storage
    And I see "1 archive(s) flushed"
