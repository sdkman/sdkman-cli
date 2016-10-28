Feature: Multi Platform Binary Distribution

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: A compatible binary is installed
		And a machine with "Mac OSX" installed
		And the system is bootstrapped
		And the candidate "java" version "8u101" is available for download on "Mac OSX"
		When I enter "sdk install java 8u101" and answer "Y"
		Then I see "Done installing!"
		And the candidate "java" version "8u101" is installed

	Scenario: Platform is not supported
		And a machine with "FreeBSD" installed
		And the system is bootstrapped
		And the candidate "java" version "8u101" is not available for download on "FreeBSD"
		When I enter "sdk install java 8u101"
		Then I see "Stop! java 8u101 is not available on this platform."
		And the candidate "java" version "8u101" is not installed