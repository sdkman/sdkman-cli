package gvm

import static cucumber.api.groovy.EN.*
import static gvm.VertxUtils.getLIVE_BROADCAST

And(~'^no prior Broadcast was received$') { ->
	broadcastFile.delete()
	assert ! broadcastFile.exists()
}

And(~'^a new Broadcast "([^"]*)" is available$') { String broadcast ->
    println "A new broadcast is available: $broadcast"
    assert LIVE_BROADCAST == broadcast
}

And(~'^a prior Broadcast "([^"]*)" was issued$') { String broadcast ->
	broadcastFile.write broadcast
	assert broadcastFile.exists()
	assert broadcastFile.text == broadcast
}
