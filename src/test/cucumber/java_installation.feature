Feature: Java Installation

  Background:
    Given the internet is reachable
    And an initialised environment
    And the system is bootstrapped

  Scenario: Install the default Java version for a supported platform
    And the candidate "java" version "8u111" is available for download on "Linux"
    Given a cookie is required for installing "java" "8u111" on "Linux"
    When I enter "sdk install java 8u111" and answer "Y"
    Then a download request was made for "java" "8u111" on "Linux" with cookie "oraclelicense=accept-securebackup-cookie"
    And I see "Done installing!"
    And the candidate "java" version "8u111" is installed
    And the cookie-jar has been cleaned up

