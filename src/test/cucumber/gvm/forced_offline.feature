Feature: Forced Offline Mode

  Background:
    Given the internet is reachable

# use command

  Scenario: Use an installed candidate version in aeroplane mode while Online
    Given the candidate "grails" version "2.1.0" is already installed and default
    And the candidate "grails" version "1.3.9" is already installed but not default
    When I enter "gvm use grails 1.3.9 --offline"
    Then I see "Using grails version 1.3.9 in this shell."

  Scenario: Use an uninstalled candidate version in aeroplane mode while Online
    Given the candidate "grails" version "1.3.9" is already installed and default
    And the candidate "grails" version "2.1.0" is not installed
    When I enter "gvm use grails 2.1.0 --offline"
    Then I see "Stop! grails 2.1.0 is not available in aeroplane mode."
