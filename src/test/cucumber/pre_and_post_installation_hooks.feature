Feature: Hooks

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: Pre- and Post-installation Hooks return successfully
		And a machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "grails" version "2.1.0" is available for download on "Linux"
		And a "pre" install hook is served for "grails" "2.1.0" on "Linux" that returns successfully
		And a "post" install hook is served for "grails" "2.1.0" on "Linux" that returns successfully
		When I enter "sdk install grails 2.1.0"
		Then I see "Pre-installation hook success"
		And I see "Post-installation hook success"
		And the exit code is 0

	Scenario: Pre-installation Hook returns a non-zero code
		And a machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "grails" version "2.1.0" is available for download on "Linux"
		And a "pre" install hook is served for "grails" "2.1.0" on "Linux" that returns a failure
		When I enter "sdk install grails 2.1.0"
		Then I see "Pre-installation hook failure"
		And the exit code is 1

	Scenario: Post-install Hook returns a non-zero code
		And a machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "grails" version "2.1.0" is available for download on "Linux"
		And a "pre" install hook is served for "grails" "2.1.0" on "Linux" that returns successfully
		And a "post" install hook is served for "grails" "2.1.0" on "Linux" that returns a failure
		When I enter "sdk install grails 2.1.0"
		Then I see "Post-installation hook failure"
		And the exit code is 1
