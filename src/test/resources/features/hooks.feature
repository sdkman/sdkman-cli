Feature: Hooks

	We can safely remove this feature when `.tar.gz` and `.zip` are supported directly by the backend.
	
	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: Post-installation Hook returns successfully
		And an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "grails" version "2.1.0" is available for download on "Linux" with architecture "x86_64"
		And a post-installation hook is served for "grails" "2.1.0" on "Linux" with architecture "x86_64" that returns successfully
		When I enter "sdk install grails 2.1.0"
		And I see "Post-installation hook success"
		And the exit code is 0

	Scenario: Post-install Hook returns a non-zero code
		And an "x86_64" machine with "Linux" installed
		And the system is bootstrapped
		And the candidate "grails" version "2.1.0" is available for download on "Linux" with architecture "x86_64"
		And a post-installation hook is served for "grails" "2.1.0" on "Linux" with architecture "x86_64" that returns a failure
		When I enter "sdk install grails 2.1.0"
		Then I see "Post-installation hook failure"
		And the exit code is 1
