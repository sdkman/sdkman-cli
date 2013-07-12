Feature: Flush

  Background:
    Given the internet is reachable

  Scenario: Flush omitting the Qualifier
    When I enter "gvm flush"
    Then I see "Stop! Please specify what you want to flush."

  Scenario: Clear out my Candidate List
    Given the candidate "grails" is known locally
    When I enter "gvm flush candidates"
    Then no candidates are know locally
    And I see "Candidates have been flushed."

  Scenario: Clean up my current broadcast
    Given a prior Broadcast "This is an old broadcast" was issued
    When I enter "gvm flush broadcast"
    Then no broadcast message can be found
    And I see "Broadcast has been flushed."

  Scenario: Clear out my cached Archives
    Given the archive "grails-1.3.9.zip" has been cached
    When I enter "gvm flush archives"
    Then no archives are cached
    And I see "1 archive(s) flushed, freeing 4.0K"

  Scenario: Clear out my temporary space
    Given the file "res-1.2.0.zip" in temporary storage
    When I enter "gvm flush temp"
    Then no "res-1.2.0.zip" file is present in temporary storage
    And I see "1 archive(s) flushed, freeing 4.0K"

  Scenario: Clear out my temporary space
    Given the file "res-1.2.0.zip" in temporary storage
    When I enter "gvm flush tmp"
    Then no "res-1.2.0.zip" file is present in temporary storage
    And I see "1 archive(s) flushed, freeing 4.0K"


