Feature: Install Candidate

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Install a default Candidate and set to default
    Given the system is bootstrapped
    And the candidate "grails" version "2.1.0" is a valid candidate version
    And the default "grails" version is "2.1.0"
    When I enter "sdk install grails"
    Then I see "Done installing!"
    And I do not see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And the candidate "grails" version "2.1.0" is installed

  Scenario: Install a specific Candidate and set to default
    Given the system is bootstrapped
    And the candidate "grails" version "1.3.9" is available for download
    When I enter "sdk install grails 1.3.9"
    Then I see "Done installing!"
    And I do not see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And the candidate "grails" version "1.3.9" is installed

  Scenario: Install a Candidate version that does not exist
    Given the system is bootstrapped
    And the candidate "grails" version "1.4.4" is not available for download
    When I enter "sdk install grails 1.4.4"
    Then I see "Stop! grails 1.4.4 is not available."
    And the exit code is 1

  Scenario: Install a Candidate version that is already installed
    Given the system is bootstrapped
    And the candidate "grails" version "1.3.9" is available for download
    And the candidate "grails" version "1.3.9" is already installed and default
    When I enter "sdk install grails 1.3.9"
    Then I see "Stop! grails 1.3.9 is already installed."

  Scenario: Install a candidate and auto-answer to make it default
    Given the system is bootstrapped
    And the candidate "grails" version "2.1.0" is available for download
    And I have configured "sdkman_auto_answer" to "true"
    When I enter "sdk install grails 2.1.0"
    Then the candidate "grails" version "2.1.0" is installed
    And I do not see "Do you want grails 2.1.0 to be set as default?"
    And I see "Done installing!"
    And I see "Setting grails 2.1.0 as default."
    And the candidate "grails" version "2.1.0" should be the default

  Scenario: Install a candidate and choose to make it default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the system is bootstrapped
    And the candidate "grails" version "2.1.0" is available for download
    When I enter "sdk install grails 2.1.0" and answer "Y"
    Then the candidate "grails" version "2.1.0" is installed
    And I see "Done installing!"
    And I see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And I see "Setting grails 2.1.0 as default."
    And the candidate "grails" version "2.1.0" should be the default
    And the candidate "grails" version "1.3.9" should not be the default

  Scenario: Install a candidate and choose not to make it default
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the system is bootstrapped
    And the candidate "grails" version "2.1.0" is available for download
    When I enter "sdk install grails 2.1.0" and answer "n"
    Then the candidate "grails" version "2.1.0" is installed
    And I see "Done installing!"
    And I see "Do you want grails 2.1.0 to be set as default? (Y/n)"
    And I do not see "Setting grails 2.1.0 as default."
    And the candidate "grails" version "2.1.0" should not be the default
    And the candidate "grails" version "1.3.9" should be the default

  #revisit to redownload automatically
  Scenario: Abort installation on download of a corrupt Candidate archive
    Given the system is bootstrapped
    And the candidate "grails" version "1.3.6" is available for download
    And the archive for candidate "grails" version "1.3.6" is corrupt
    When I enter "sdk install grails 1.3.6"
    Then I see "Stop! The archive was corrupt and has been removed! Please try installing again."
    And the candidate "grails" version "1.3.6" is not installed
    And the archive for candidate "grails" version "1.3.6" is removed
