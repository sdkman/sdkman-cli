Feature: Offline Mode

  Background:
    Given the internet is not reachable
    And an initialised environment

  # list command

  Scenario: List candidate versions found while Offline
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "grails" version "1.3.9" is already installed but not default
    When I enter "gvm list grails"
    Then I see "Offline Mode: only showing installed grails versions"
    And I see "> 2.1.0"
    And I see "* 1.3.9"

  Scenario: List candidate versions not found while Offline
    When I enter "gvm list grails"
    Then I see "Offline Mode: only showing installed grails versions"
    And I see "None installed!"

# use command

  Scenario: Use the default candidate version while Offline
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "grails" version "1.3.9" is already installed but not default
    When I enter "gvm use grails"
    Then I see "Using grails version 2.1.0 in this shell."

  Scenario: Use the default candidate version when non selected while Offline
    Given the candidate "grails" version "1.3.9" is already installed but not default
    Given the candidate "grails" version "2.1.0" is already installed but not default
    When I enter "gvm use grails"
    Then I see "This command is not available in offline mode."

  Scenario: Use an uninstalled candidate version while Offline
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the candidate "grails" version "2.1.0" is not installed
    When I enter "gvm use grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is not available in offline mode."

  Scenario: Use an invalid candidate version while Offline
    Given the candidate "grails" version "1.3.9" is already installed and default
    When I enter "gvm use grails 9.9.9"
    Then I see "Stop! grails 9.9.9 is not available in offline mode."

  Scenario: Use an installed candidate version while Offline
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "grails" version "1.3.9" is already installed but not default
    When I enter "gvm use grails 1.3.9"
    Then I see "Using grails version 1.3.9 in this shell."

  # default command

  Scenario: Set the default to an uninstalled candidate version while Offline
    Given the candidate "grails" version "1.3.9" is already installed and default
    When I enter "gvm default grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is not available in offline mode."

  Scenario: Set the default to an invalid candidate version while Offline
    Given the candidate "grails" version "1.3.9" is already installed and default
    When I enter "gvm default grails 999"
    Then I see "Stop! grails 999 is not available in offline mode."

  Scenario: Set the default to an installed candidate version while Offline
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "grails" version "1.3.9" is already installed but not default
    When I enter "gvm default grails 1.3.9"
    Then I see "Default grails version set to 1.3.9"

  # install command
  Scenario: Install a candidate version that is not installed while Offline
    Given the candidate "grails" version "2.1.0" is not installed
    When I enter "gvm install grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is not available in offline mode."

  Scenario: Install a candidate version that is already installed while Offline
    Given the candidate "grails" version "2.1.0" is already installed and default
    When I enter "gvm install grails 2.1.0"
    Then I see "Stop! grails 2.1.0 is already installed."

  # uninstall command
  Scenario: Uninstall a candidate version while Offline
    Given the candidate "grails" version "2.1.0" is already installed and default
    When I enter "gvm uninstall grails 2.1.0"
    Then I see "Unselecting grails 2.1.0..."
    And I see "Uninstalling grails 2.1.0..."
    And the candidate "grails" version "2.1.0" is not in use
    And the candidate "grails" version "2.1.0" is not installed

  Scenario: Uninstall a candidate version that is not installed while Offline
    Given the candidate "grails" version "2.1.0" is not installed
    When I enter "gvm uninstall grails 2.1.0"
    Then I see "grails 2.1.0 is not installed."

  # current command
  Scenario: Display the current version of a candidate while Offline
    Given the candidate "grails" version "2.1.0" is already installed and default
    When I enter "gvm current grails"
    Then I see "Using grails version 2.1.0"

  Scenario: Display the current version of all candidates while Offline
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "groovy" version "2.0.5" is already installed and default
    When I enter "gvm current"
	Then I see "Using:"
	And I see "grails: 2.1.0"
	And I see "groovy: 2.0.5"

  # version command
  Scenario: Determine the GVM version when Offline
    When I enter "gvm version"
    Then I see the current gvm version

  # broadcast command
  Scenario: Recall a broadcast while Offline
    Given a prior Broadcast "This is an OLD Broadcast!" was issued
    When I enter "gvm broadcast"
    Then I see "This is an OLD Broadcast!"

  # help command
  Scenario: Request help while Offline
    When I enter "gvm help"
    Then I see "Usage: gvm <command> <candidate> [version]"

  # selfupdate command
  Scenario: Attempt self-update while Offline
    When I enter "gvm selfupdate"
    Then I see "This command is not available in offline mode."

