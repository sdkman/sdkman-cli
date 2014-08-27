Feature: Self Update

  Background:
    Given the internet is reachable

  Scenario: Agree to a suggested Selfupdate
    Given an outdated initialised environment
    When I enter "gvm help" and answer "Y"
    Then I see "A new version of GVM is available..."
    And I see "Would you like to upgrade now? (Y/n)"
    And I see "Successfully upgraded GVM."
    And I do not see "Not upgrading today..."

  Scenario: Do not agree to a suggested Selfupdate
    Given an outdated initialised environment
    When I enter "gvm help" and answer "N"
    Then I see "A new version of GVM is available..."
    And I see "Would you like to upgrade now? (Y/n)"
    And I see "Not upgrading today..."
    And I do not see "Successfully upgraded GVM."

  Scenario: Automatically Selfupdate
    Given an outdated initialised environment
    And the configuration file has been primed with "gvm_auto_selfupdate=true"
    When I enter "gvm help"
    Then I see "A new version of GVM is available..."
    And I do not see "Would you like to upgrade now? (Y/n)"
    And I do not see "Not upgrading today..."
    And I see "Successfully upgraded GVM."

  Scenario: Do not automatically Selfupdate
    Given an outdated initialised environment
    And the configuration file has been primed with "gvm_auto_selfupdate=false"
    When I enter "gvm help" and answer "n"
    Then I see "A new version of GVM is available..."
    And I see "Would you like to upgrade now? (Y/n)"
    And I see "Not upgrading today..."
    And I do not see "Successfully upgraded GVM."

  Scenario: Bother the user with Upgrade message once a day
    Given an outdated initialised environment
    When I enter "gvm help" and answer "N"
    Then I see "A new version of GVM is available..."
    And I see "Would you like to upgrade now? (Y/n)"
    And I see "Not upgrading today..."
    And I enter "gvm help"
    Then I do not see "A new version of GVM is available..."
    And I do not see "Would you like to upgrade now? (Y/n)"
    And I do not see "Not upgrading now..."
    And I do not see "Successfully upgraded GVM."