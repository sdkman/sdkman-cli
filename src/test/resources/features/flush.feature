Feature: Flush

	Background:
		Given the internet is reachable
		And an initialised environment
		And the system is bootstrapped

	Scenario: Clear out the temporary storage and metadata
		And the file "res-1.2.0.zip" in temporary storage
		And a headers file "grails-1.3.9.headers" in metadata directory with checksum "c68e386a6deec9fc4c1e18df21f92739ba2ab36e" using algorithm "SHA1"
		When I enter "sdk flush"
		And no "res-1.2.0.zip" file is present in temporary storage
		And no metadata is cached
		And I see "1 archive(s) flushed"
		And I see "1 archive(s) flushed"

	Scenario: Clean up the last known Remote Version
		Given a prior version "5.0.0" was detected
		When I enter "sdk flush version"
		Then no version file can be found
		And I see "Version file has been flushed."

	Scenario: Clear out the temporary storage
		Given the file "res-1.2.0.zip" in temporary storage
		When I enter "sdk flush temp"
		Then no "res-1.2.0.zip" file is present in temporary storage
		And I see "1 archive(s) flushed"

	Scenario: Clear out the metadata
		Given a headers file "grails-1.3.9.headers" in metadata directory with checksum "c68e386a6deec9fc4c1e18df21f92739ba2ab36e" using algorithm "SHA1"
		When I enter "sdk flush metadata"
		Then no metadata is cached
		And I see "1 archive(s) flushed"	
