package gvm

import static cucumber.runtime.groovy.EN.*

Given(~'^no prior Broadcast was received$') { ->
	broadcastFile.delete()
	assert ! broadcastFile.exists()
}

Given(~'^a new Broadcast "([^"]*)" is available$') { String broadcast ->
	assert true
}

Given(~'^a prior Broadcast "([^"]*)" was issued$') { String broadcast ->
	broadcastFile.write broadcast
	assert broadcastFile.exists()
	assert broadcastFile.text == broadcast
}
