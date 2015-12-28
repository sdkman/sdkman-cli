Feature: Forced Offline Mode

  #offline modes

  Scenario: Enter an invalid offline mode
    Given offline mode is disabled with reachable internet
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk offline grails"
    Then I see "Stop! grails is not a valid offline mode."

  Scenario: Issue Offline command without qualification
    Given offline mode is disabled with reachable internet
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk offline"
    Then I see "Stop! Specify a valid offline mode."

  Scenario: Enable Offline Mode with internet reachable
    Given offline mode is disabled with reachable internet
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk offline enable"
    Then I see "Forced offline mode enabled."
    And I do not see "THE INTERNET IS NOT REACHABLE!"
    When I enter "sdk install grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is not available in offline mode."

  Scenario: Disable Offline Mode with internet reachable
    Given offline mode is enabled with reachable internet
    And the candidate "grails" version "2.1.0" is available for download
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk offline disable"
    Then I see "Online mode re-enabled!"
    When I enter "sdk install grails 2.1.0" and answer "Y"
    Then I see "Done installing!"
    And the candidate "grails" version "2.1.0" is installed

  Scenario: Disable Offline Mode with internet unreachable
    Given offline mode is enabled with unreachable internet
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk offline disable"
    Then I see "Online mode re-enabled!"
    When I enter "sdk install grails 2.1.0"
    Then I see "THE INTERNET IS NOT REACHABLE!"
    And I see "Stop! grails 2.1.0 is not available in offline mode."

  #broadcast
  Scenario: Recall a broadcast while Forced Offline
    Given offline mode is enabled with reachable internet
    And an initialised environment
    And the system is bootstrapped
    When a prior Broadcast "This is an OLD Broadcast!" with id "12344" was issued
    And I enter "sdk broadcast"
    Then I see "This is an OLD Broadcast!"

  #sdk version
  Scenario: Determine the sdkman version while Forced Offline
    Given offline mode is enabled with reachable internet
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk version"
    Then I see the current sdkman version

  #list candidate version
  Scenario: List candidate versions found while Forced Offline
    Given offline mode is enabled with reachable internet
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk list grails"
    Then I see "Offline Mode: only showing installed grails versions"

  #use version
  Scenario: Use an uninstalled candidate version while Forced Offline
    Given offline mode is enabled with reachable internet
    And the candidate "grails" version "1.3.9" is already installed and default
    And the candidate "grails" version "2.1.0" is not installed
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk use grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is not available in offline mode."

  #default version
  Scenario: Set the default to an uninstalled candidate version while Forced Offline
    Given offline mode is enabled with reachable internet
    And the candidate "grails" version "1.3.9" is already installed and default
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk default grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is not available in offline mode."

  #install command
  Scenario: Install a candidate version that is not installed while Forced Offline
    Given offline mode is enabled with reachable internet
    And the candidate "grails" version "2.1.0" is not installed
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk install grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is not available in offline mode."

  #uninstall command
  Scenario: Uninstall a candidate version while Forced Offline
    Given offline mode is enabled with reachable internet
    And the candidate "grails" version "2.1.0" is already installed and default
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk uninstall grails 2.1.0"
    And the candidate "grails" version "2.1.0" is not installed

  #current command
  Scenario: Display the current version of a candidate while Forced Offline
    Given offline mode is enabled with reachable internet
    And the candidate "grails" version "2.1.0" is already installed and default
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk current grails"
    Then I see "Using grails version 2.1.0"

  #help command
  Scenario: Request help while Forced Offline
    Given offline mode is enabled with reachable internet
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk help"
    Then I see "Usage: sdk <command> [candidate] [version]"

  #selfupdate command
  Scenario: Attempt self-update while Forced Offline
    Given offline mode is enabled with reachable internet
    And an initialised environment
    And the system is bootstrapped
    When I enter "sdk selfupdate"
    Then I see "This command is not available in offline mode."

