Feature: Per-project configuration

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: An sdkman project configuration is generated
		Given the system is bootstrapped
		When I enter "sdk env init"
		Then I see ".sdkmanrc created."

	Scenario: The env command is issued without an sdkman project configuration present
		Given the system is bootstrapped
		When I enter "sdk env"
		Then I see "Could not find .sdkmanrc in the current directory."
		And I see "Run 'sdk env init' to create it."
		And the exit code is 1

	Scenario: The env command is issued with an sdkman project configuration present
		Given the file ".sdkmanrc" exists and contains "groovy=2.4.1"
		And the candidate "groovy" version "2.0.5" is already installed and default
		And the candidate "groovy" version "2.4.1" is a valid candidate version
		And the candidate "groovy" version "2.4.1" is already installed but not default
		And the system is bootstrapped
		When I enter "sdk env"
		Then I see "Using groovy version 2.4.1 in this shell."
		And the candidate "groovy" version "2.4.1" should be in use
		And the candidate "groovy" version "2.0.5" should be the default
		
	Scenario: The env install subcommand is issued with an sdkman project configuration present
		Given the system is bootstrapped
		And the file ".sdkmanrc" exists and contains "groovy=2.4.1"
		And the candidate "groovy" version "2.0.5" is already installed and default
		And the candidate "groovy" version "2.4.1" is available for download
		When I enter "sdk env install"
		Then I see "Done installing!"
		And the candidate "groovy" version "2.4.1" is installed
		And the candidate "groovy" version "2.4.1" is in use
		And the candidate "groovy" version "2.0.5" should be the default

	Scenario: The env install subcommand is issued without an sdkman project configuration present
		Given the system is bootstrapped
		When I enter "sdk env install"
		Then I see "Could not find .sdkmanrc in the current directory."
		And I see "Run 'sdk env init' to create it."
		And the exit code is 1

	Scenario: The env clear subcommand is issued without an active project configuration
		Given the system is bootstrapped
		When I enter "sdk env clear"
		Then I see "No environment currently set!"
		And the exit code is 1

	Scenario: The env clear subcommand is issued and the active project configuration is missing
		Given the system is bootstrapped
		And a project configuration is active but points to a directory without configuration
		When I enter "sdk env clear"
		Then I see "Could not find"
		And the exit code is 1

	Scenario: The current project configuration is cleared and the default versions restored
		Given the file ".sdkmanrc" exists and contains "groovy=2.0.5"
		And the candidate "groovy" version "2.4.1" is already installed and default
		And the candidate "groovy" version "2.0.5" is in use
		And the system is bootstrapped
		And a project configuration is active
		When I enter "sdk env clear"
		Then I see "Restored groovy version to 2.4.1 (default)"
		And the candidate "groovy" version "2.4.1" should be in use
