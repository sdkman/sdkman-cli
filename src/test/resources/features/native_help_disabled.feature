Feature: Native Help Disabled

	Background:
		Given the internet is reachable
		And an initialised environment
		And I have configured "sdkman_native_enable" to "false"
		And the native "help" command is installed
		And the system is bootstrapped

	Scenario: Enter sdk without a command
		When I enter "sdk"
		Then I see "Usage: sdk <command> [candidate] [version]"
		And I do not see "native help"

	Scenario: Ask for help on a bash command
		When I enter "sdk list --help"
		Then I see "Usage: sdk <command> [candidate] [version]"
		And I do not see "native help"

	Scenario: Ask for short help without a command
		When I enter "sdk -h"
		Then I see "Invalid command: -h"
		And I see "Usage: sdk <command> [candidate] [version]"
		And I do not see "native help"

	Scenario: Enter an invalid command
		When I enter "sdk goopoo"
		Then I see "Invalid command: goopoo"
		And I see "Usage: sdk <command> [candidate] [version]"
		And I do not see "native help"
