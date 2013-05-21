package gvm

import static cucumber.api.groovy.EN.*
import static gvm.VertxUtils.getLIVE_BROADCAST

Given(~'^no prior Broadcast was received$') { ->
	broadcastFile.delete()
	assert ! broadcastFile.exists()
}

Given(~'^a new Broadcast "([^"]*)" is available$') { String broadcast ->
    println "A new broadcast is available: $broadcast"
    assert LIVE_BROADCAST == broadcast
}

Given(~'^a prior Broadcast "([^"]*)" was issued$') { String broadcast ->
	broadcastFile.write broadcast
	assert broadcastFile.exists()
	assert broadcastFile.text == broadcast
}
