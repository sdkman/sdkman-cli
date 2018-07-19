package sdkman.steps

import static cucumber.api.groovy.EN.And
import static sdkman.stubs.WebServiceStub.primeEndpointWithString

And(~'^no prior Broadcast was received$') { ->
    broadcastFile.delete()
    broadcastIdFile.delete()
}

And(~'^a new Broadcast "(.*)" with id "(.*)" is available$') { String broadcast, String id ->
    primeEndpointWithString("/broadcast/latest/id", id)
    primeEndpointWithString("/broadcast/latest", broadcast)
}

And(~'^a prior Broadcast "(.*)" with id "(.*)" was issued$') { String broadcast, String id ->
    broadcastIdFile.write id
    broadcastFile.write broadcast
}

And(~'^no broadcast message can be found$') {->
    assert !broadcastIdFile.exists()
    assert !broadcastFile.exists()
}

And(~'^the broadcast has been flushed$') { ->
    broadcastIdFile.delete()
    broadcastFile.delete()
}