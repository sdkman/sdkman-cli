package sdkman

import static cucumber.api.groovy.EN.And
import static sdkman.stubs.WebServiceStub.primeEndpoint

And(~'^no prior Broadcast was received$') { ->
    broadcastFile.delete()
    broadcastIdFile.delete()
}

And(~'^a new Broadcast "(.*)" with id "(.*)" is available$') { String broadcast, String id ->
    primeEndpoint("/broadcast/latest/id", id)
    primeEndpoint("/broadcast/latest", broadcast)
}

And(~'^a prior Broadcast "(.*)" with id "(.*)" was issued$') { String broadcast, String id ->
    broadcastIdFile.write id
    broadcastFile.write broadcast
}