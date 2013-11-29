Feature: Install Candidate

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Install a default Candidate
    Given the default "grails" candidate is "2.1.0"
    When I enter "gvm install grails" and answer "Y"
    Then I see "Done installing!"
    Then the candidate "grails" version "2.1.0" is installed
    #And the exit status is zero

  Scenario: Install a specific Candidate
    When I enter "gvm install grails 1.3.9" and answer "Y"
    Then I see "Done installing!"
    Then the candidate "grails" version "1.3.9" is installed
    #And the exit status is zero

  Scenario: Install a Candidate version that does not exist
    When I enter "gvm install grails 1.4.4"
    Then I see "Stop! 1.4.4 is not a valid grails version."
    #And the exit status is non-zero

  Scenario: Install a Candidate version that is already installed
    Given the candidate "grails" version "1.3.9" is already installed and default
    When I enter "gvm install grails 1.3.9"
    Then I see "Stop! grails 1.3.9 is already installed."
    #And the exit status is zero

  Scenario: Install a candidate and select to use it
    When I enter "gvm install grails 2.1.0" and answer "Y"
    Then the candidate "grails" version "2.1.0" is installed
    And I see "Done installing!"
    And I see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And I see "Setting grails 2.1.0 as default."
    Then the candidate "grails" version "2.1.0" should be the default
    #And the exit status is zero

  Scenario: Install a candidate and select to use it automatically
    And I have configured "gvm_auto_answer" to "true"
    When I enter "gvm install grails 2.1.0"
    Then the candidate "grails" version "2.1.0" is installed
    And I see "Done installing!"
    And I see "Setting grails 2.1.0 as default."
    Then the candidate "grails" version "2.1.0" should be the default
    #And the exit status is zero

  Scenario: Install a candidate and do not select to use it
    When I enter "gvm install grails 2.1.0" and answer "n"
    Then the candidate "grails" version "2.1.0" is installed
    And I see "Done installing!"
    And I see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And I do not see "Setting grails 2.1.0 as default."
    Then the candidate "grails" version "2.1.0" should not be the default
    #And the exit status is zero

  #revisit to redownload automatically
  Scenario: Abort installation on download of a corrupt Candidate archive
    Given the archive for candidate "grails" version "1.3.6" is corrupt
    When I enter "gvm install grails 1.3.6"
    Then I see "Stop! The archive was corrupt and has been removed! Please try installing again."
    #And the exit status is non-zero
    And the candidate "grails" version "1.3.6" is not installed
    And the archive for candidate "grails" version "1.3.6" is removed
	
