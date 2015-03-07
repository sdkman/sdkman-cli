package gvm

import static cucumber.api.groovy.EN.And
import static gvm.stubs.WebServiceStub.primeEndpoint

And(~'^no prior Broadcast was received$') { ->
    broadcastFile.delete()
}

And(~'^a new Broadcast "(.*)" with id "(.*)" is available$') { String broadcast, String id ->
    primeEndpoint("/broadcast/latest/id", id)
    primeEndpoint("/broadcast/latest", broadcast)
}

And(~'^a prior Broadcast "([^"]*)" was issued$') { String broadcast ->
    broadcastFile.write broadcast
}