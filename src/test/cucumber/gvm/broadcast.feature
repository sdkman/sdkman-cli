Feature: Broadcast

	Scenario: A command is issued with no prior Broadcast received
		Given no prior Broadcast was received
		And a new Broadcast "This is a LIVE Broadcast!" is available
		When I enter "gvm install grails"
		Then I see "This is a LIVE Broadcast!"

	Scenario: A command is issued where the prior Broadcast was different to the Live one
		Given a prior Broadcast "This is an OLD Broadcast!" was issued
		And a new Broadcast "This is a LIVE Broadcast!" is available
		When I enter "gvm install grails"
		Then I see "This is a LIVE Broadcast!"

	Scenario: A command is issued where the prior Broadcast was the same as the Live one
		Given a prior Broadcast "This is a LIVE Broadcast!" was issued
		And a new Broadcast "This is a LIVE Broadcast!" is available
		When I enter "gvm install grails"
		Then I do not see "This is a LIVE Broadcast!"

	Scenario: A Broadcast command recalls a prior Broadcast
		Given a prior Broadcast "This is an OLD Broadcast!" was issued
		When I enter "gvm broadcast"
		Then I see only "This is an OLD Broadcast!"

	Scenario: A Broadcast command is issued with no prior Broadcast received
		Given no prior Broadcast was received
		And a new Broadcast "This is a LIVE Broadcast!" is available
		When I enter "gvm broadcast"
		Then I see only "This is a LIVE Broadcast!"

