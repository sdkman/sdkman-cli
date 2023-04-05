Feature: Hooks
	
	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: Pre- and Post-installation Hooks return successfully
		And an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "grails" version "2.1.0" is available for download on "Linux" with architecture "x86_64"
		And a "pre" install hook is served for "grails" "2.1.0" on "Linux" with architecture "x86_64" that returns successfully
		And a "relocate" install hook is served for "grails" "2.1.0" on "Linux" with architecture "x86_64" that returns successfully
		When I enter "sdk install grails 2.1.0"
		Then I see "Pre-installation hook success"
		And I see "Relocation hook success"
		And the exit code is 0

	Scenario: Pre-installation Hook returns a non-zero code
		And an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "grails" version "2.1.0" is available for download on "Linux" with architecture "x86_64"
		And a "pre" install hook is served for "grails" "2.1.0" on "Linux" with architecture "x86_64" that returns a failure
		When I enter "sdk install grails 2.1.0"
		Then I see "Pre-installation hook failure"
		And the exit code is 1

	Scenario: Relocate Hook returns a non-zero code
		And an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "grails" version "2.1.0" is available for download on "Linux" with architecture "x86_64"
		And a "pre" install hook is served for "grails" "2.1.0" on "Linux" with architecture "x86_64" that returns successfully
		And a "relocate" install hook is served for "grails" "2.1.0" on "Linux" with architecture "x86_64" that returns a failure
		When I enter "sdk install grails 2.1.0"
		Then I see "Relocation hook failure"
		And the exit code is 1
		