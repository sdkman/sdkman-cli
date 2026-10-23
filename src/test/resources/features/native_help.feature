Feature: Native Help

	Background:
		Given the internet is reachable
		And an initialised environment
		And I have configured "sdkman_native_enable" to "true"
		And the native "help" command is installed
		And the system is bootstrapped

	Scenario: Ask for full help on a bash command
		When I enter "sdk list --help"
		Then I see "native help: list --help"

	Scenario: Ask for short help on a bash command
		When I enter "sdk install -h"
		Then I see "native help: install -h"
		And I do not see "Usage: grep"

	Scenario: Ask for help after the arguments of a bash command
		When I enter "sdk install java 17.0.0-tem --help"
		Then I see "native help: install --help"

	Scenario: Ask for help on a bash command that changes state
		Given the file "grails-1.3.9.zip" in temporary storage
		When I enter "sdk flush --help"
		Then I see "native help: flush --help"
		And I do not see "flushed"

	Scenario: Ask for help on an aliased bash command
		When I enter "sdk ls --help"
		Then I see "native help: list --help"

	Scenario: Ask for full help without a command
		When I enter "sdk --help"
		Then I see "native help: --help"
		And I do not see "Invalid command"

	Scenario: Ask for short help without a command
		When I enter "sdk -h"
		Then I see "native help: -h"
		And I do not see "Invalid command"

	Scenario: Enter an invalid command
		When I enter "sdk goopoo"
		Then I see "native help: goopoo"
		And I do not see "Invalid command"

	Scenario: Ask for help on a native command
		Given the native "home" command is installed
		When I enter "sdk home --help"
		Then I see "native home: --help"
		And I do not see "native help"
