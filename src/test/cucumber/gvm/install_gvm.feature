@manual
Feature: Install GVM

	Platform defaults as follows:
	* Ubuntu:  .profile, .bashrc
	* Fedora:  .bash_profile, .bashrc
	* OS X:    no skeleton files in user home (nice one Apple!)
	* Cygwin:  .bash_profile, .profile and .bashrc
	* Solaris: .profile, .bashrc
	* FreeBSD: .profile with NO .bashrc or bash pre-installed

	Order of precedence:
	Login shells (all new terminals) are intialised with the first file found in this order:
	* .bash_profile
	* .bash_login
	* .profile
	Non-login shells (like xterm shells) read the .bashrc file.

	Also important to note that usually the .bash_profile or .profile login shell files
	will check for the .bashrc file and invoke if present!

	Background: 
		Given a user home exists

	Scenario: Creates and initialises .bash_profile on absence of login shell dot files
		Given the user home directory contains no ".bash_profile" file
		And the user home directory contains no ".profile" file
		When I run the installation script
		Then the user home contains a ".bash_profile" file
		And the ".bash_profile" contains an Initialisation Snippet

	Scenario: Add Init Snippet to the .bash_profile if present
		Given the user home contains a ".bash_profile" file
		When I run the installation script
		Then the ".bash_profile" contains an Initialisation Snippet

	Scenario: Add Init Snippet to the .profile if present
		Given the user home contains a ".profile" file
		When I run the installation script
		Then the ".profile" contains an Initialisation Snippet

	Scenario: Creates and initialises .bashrc on absence of non-login dot files
		Given the user home directory contains no ".bashrc" file
		When I run the installation script
		Then the user home contains a ".bashrc" file
		And the ".bashrc" contains an Initialisation Snippet

	Scenario: Always adds Init Snippet to the .bashrc
		Given the user home contains a ".bashrc" file
		When I run the installation script
		Then the ".bashrc" contains an Initialisation Snippet

	Scenario: Source the Initialisation Script on first invokation of the Init Snippet
		Given the user home contains a ".bash_profile" file
		And the ".bash_profile" contains an Initialisation Snippet
		When I open a new Login Shell
		Then the "gvm-init.sh" script is sourced once only

	Scenario: Do not Source the Initialisation Script on subsequent invokation of the Init Snippet
		Given the user home contains a ".bash_profile" file
		And the ".bash_profile" contains an Initialisation Snippet
		And the user home contains a ".bashrc" file
		And the ".bashrc" contains an Initialisation Snippet
		When I open a new Login Shell
		Then the "gvm-init.sh" script is sourced once only
