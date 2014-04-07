package gvm

import static cucumber.api.groovy.EN.And

And(~'^no prior Broadcast was received$') { ->
	broadcastFile.delete()
	assert ! broadcastFile.exists()
}

And(~'^a new Broadcast "([^"]*)" is available$') { String broadcast ->
    println "A new broadcast is available: $broadcast"
}

And(~'^a prior Broadcast "([^"]*)" was issued$') { String broadcast ->
    def broadcastTemplate = """
==== BROADCAST =================================================================

$broadcast

Running GVM server 1.0.0-SNAPSHOT on vertx 1.3.1.final

================================================================================
"""
    broadcastFile.write  broadcastTemplate
}