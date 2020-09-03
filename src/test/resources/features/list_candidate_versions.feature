Feature: List Candidate Versions

	A dummy template to be served back that has the following information:
	* Candidate: grails
	* Current: 2.1.0
	* Versions: 2.1.0,2.1.1,2.1.2 (CSV)

	Background:
		Given the internet is reachable
		And an initialised environment

	Scenario: List an uninstalled available Version
		Given I do not have a "grails" candidate installed
		And the candidate "grails" has a version list available
		And the system is bootstrapped
		When I enter "sdk list grails"
		Then I see "Candidate: grails"

	Scenario: List an installed available Version not in use
		Given the candidate "grails" version "2.1.0" is already installed but not default
		And the candidate "grails" has a version list available
		And the system is bootstrapped
		When I enter "sdk list grails"
		Then I see "Versions: 2.1.0"
		And I do not see "Current: 2.1.0"

	Scenario: List an installed available Version in use
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" has a version list available
		And the system is bootstrapped
		When I enter "sdk list grails"
		Then I see "Current: 2.1.0"
		And I see "Versions: 2.1.0"

	Scenario: List installed multiple Versions
		Given the candidate "grails" version "2.1.0" is already installed and default
		And the candidate "grails" version "2.0.9" is already installed but not default
		And the candidate "grails" has a version list available
		And the system is bootstrapped
		When I enter "sdk list grails"
		Then I see "Current: 2.1.0"
		And I see "Versions: 2.0.9,2.1.0"

	Scenario: List an installed local version not in use
		Given I have a local candidate "grails" version "2.3-SNAPSHOT" at "/tmp/groovy-core"
		And the candidate "groovy" version "2.3-SNAPSHOT" is already linked to "/tmp/groovy-core"
		And the candidate "groovy" has a version list available
		And the system is bootstrapped
		When I enter "sdk list groovy"
		Then I see "Versions: 2.3-SNAPSHOT"
		And I do not see "Current: 2.3-SNAPSHOT"

	Scenario: List an installed local Version in use
		Given I have a local candidate "groovy" version "2.2-SNAPSHOT" at "/tmp/groovy-core"
		And the candidate "groovy" version "2.2-SNAPSHOT" is already linked to "/tmp/groovy-core"
		And the candidate "groovy" version "2.2-SNAPSHOT" is the default
		And the candidate "groovy" has a version list available
		And the system is bootstrapped
		When I enter "sdk list groovy"
		Then I see "Current: 2.2-SNAPSHOT"
		And I see "Versions: 2.2-SNAPSHOT"
