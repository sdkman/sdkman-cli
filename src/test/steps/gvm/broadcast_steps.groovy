package gvm

import static cucumber.api.groovy.EN.And
import static gvm.StubHelper.primeEndpoint

And(~'^no prior Broadcast was received$') { ->
    broadcastFile.delete()
}

And(~'^a new Broadcast "([^"]*)" is available$') { String broadcast ->
    primeEndpoint("/broadcast/$gvmVersion", broadcast)
}

And(~'^a prior Broadcast "([^"]*)" was issued$') { String broadcast ->
    broadcastFile.write broadcast
}