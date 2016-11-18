Feature: Multi Platform Binary Distribution

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: Platform is supported and compatible binary is installed
		And a machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "java" version "8u111" is available for download on "Linux"
		And the appropriate multi-platform hooks are available for "java" version "8u111" on "Linux"
		And a cookie is required for installing "java" "8u111" on "Linux"
		When I enter "sdk install java 8u111" and answer "Y"
		Then a download request was made for "java" "8u111" on "Linux" with cookie "oraclelicense=accept-securebackup-cookie"
		And I see "Done installing!"
		And the candidate "java" version "8u111" is installed
		And the cookie-jar has been cleaned up

	Scenario: Platform is not supported and user is notified
		And a machine with "FreeBSD" installed
		And the system is bootstrapped
		And the candidate "java" version "8u111" is not available for download on "FreeBSD"
		When I enter "sdk install java 8u111"
		Then I see "Stop! java 8u111 is not available. Possible causes:"
		Then I see " * 8u111 is an invalid version"
		Then I see " * java binaries are incompatible with FreeBSD"
		And the candidate "java" version "8u111" is not installed