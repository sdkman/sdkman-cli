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

	Scenario: List an installed Version bearing a build-metadata '+'
		# A semverish DISCO java id carries a literal '+' (e.g. 21.0.1+12-open). The CLI must
		# percent-encode it to %2B in the list query, otherwise the candidates service (Play
		# query bind) folds '+' to a space and the version is mis-marked (spec 06 §3/§6). The
		# stub is primed with the encoded query, so this fails if the CLI stops encoding.
		Given the candidate "java" version "21.0.1+12-open" is already installed and default
		And the candidate "java" has a version list available
		And the system is bootstrapped
		When I enter "sdk list java"
		Then I see "Current: 21.0.1+12-open"
		And I see "Versions: 21.0.1+12-open"

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
