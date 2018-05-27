Feature: Java Multi Platform Binary Distribution

  Three versions of Java are used to test various installation scenarios.
  This feature uses real hooks found in the resources folder under /hooks.

  The following hooks are available:
  8u111: pre- and post-hooks prepared for successful installation
  8u101: pre-hook succeeds but post-hook aborts with non-zero return code
  8u92 : pre-hook aborts with non-zero return code and post-hook is ignored

  In order to install Oracle Java, the user needs to agree to the Oracle Binary Code License Agreement
  This License can be found at: http://www.oracle.com/technetwork/java/javase/terms/license/index.html

  Background:
    Given the internet is reachable
    And an initialised environment

  Scenario: Platform is supported and a specific version of compatible binary is installed
    Given a machine with "Linux" installed
    And the system is bootstrapped
    And the candidate "java" version "8u111" is available for download on "Linux"
    And a cookie is required for installing "java" "8u111" on "Linux"
    And the appropriate multi-platform hooks are available for "java" version "8u111" on "Linux"
    When I enter "sdk install java 8u111", accept the license agreement and confirm to make this the default installation
    Then a download request was made for "java" "8u111" on "Linux" with cookie "oraclelicense=accept-securebackup-cookie"
    And I see "Done installing!"
    And the candidate "java" version "8u111" is installed
    And the cookie has been removed

  Scenario: Platform is supported and a default version of compatible binary is installed
    Given a machine with "Linux" installed
    And the system is bootstrapped
    And the default "java" version is "8u111"
    And the candidate "java" version "8u111" is available for download on "Linux"
    And a cookie is required for installing "java" "8u111" on "Linux"
    And the appropriate multi-platform hooks are available for "java" version "8u111" on "Linux"
    When I enter "sdk install java", accept the license agreement and confirm to make this the default installation
    Then a download request was made for "java" "8u111" on "Linux" with cookie "oraclelicense=accept-securebackup-cookie"
    And I see "Done installing!"
    And the candidate "java" version "8u111" is installed
    And the cookie has been removed

  Scenario: Platform is supported but the User does not agree with the Oracle Binary Code License Agreement
    And a machine with "Linux" installed
    And the system is bootstrapped
    And the candidate "java" version "8u92" is available for download on "Linux"
    And the appropriate multi-platform hooks are available for "java" version "8u92" on "Linux"
    When I enter "sdk install java 8u92" and do not accept the license agreement
    Then I see "Do you agree to the terms of this agreement? (Y/n)"
    And I see "http://www.oracle.com/technetwork/java/javase/terms/license/index.html"
    And I see "Not installing java 8u92 at this time..."
    And the candidate "java" version "8u92" is not installed

  Scenario: Platform is supported but download fails
    Given a machine with "Linux" installed
    And the system is bootstrapped
    And the candidate "java" version "8u101" is available for download on "Linux"
    And a cookie is required for installing "java" "8u101" on "Linux"
    And the appropriate multi-platform hooks are available for "java" version "8u101" on "Linux"
    When I enter "sdk install java 8u101" and accept the license agreement
    Then a download request was made for "java" "8u101" on "Linux" with cookie "oraclelicense=accept-securebackup-cookie"
    And I see "Download has failed, aborting!"
    And the candidate "java" version "8u101" is not installed
    And I see "Can not install java 8u101 at this time..."
    And the cookie has been removed

  Scenario: Platform is not supported for specific version and user is notified
    And a machine with "FreeBSD" installed
    And the system is bootstrapped
    And the candidate "java" version "8u111" is not available for download on "FreeBSD"
    When I enter "sdk install java 8u111"
    Then I see "Stop! java 8u111 is not available. Possible causes:"
    And I see " * 8u111 is an invalid version"
    And I see " * java binaries are incompatible with FreeBSD"
    And I see " * java has not been released yet"
    And the candidate "java" version "8u111" is not installed

  Scenario: Platform is not supported for default version and user is notified
    And a machine with "FreeBSD" installed
    And the system is bootstrapped
    And the default "java" version is "8u111"
    And the candidate "java" version "8u111" is not available for download on "FreeBSD"
    When I enter "sdk install java"
    Then I see "Stop! java 8u111 is not available. Possible causes:"
    And I see " * 8u111 is an invalid version"
    And I see " * java binaries are incompatible with FreeBSD"
    And I see " * java has not been released yet"
    And the candidate "java" version "8u111" is not installed
