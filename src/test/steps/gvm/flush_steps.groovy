package gvm

import static cucumber.api.groovy.EN.*

Given(~'^the candidate "([^"]*)" is known locally$') { String candidate ->
    assert candidatesFile.text.contains(candidate)
}
Then(~'^no candidates are know locally$') {->
    assert ! candidatesFile.exists()
}
Then(~'^no broadcast message can be found$') {->
    assert ! broadcastFile.exists()
}
Given(~'^the archive "([^"]*)" has been cached$') { String archive ->
    new File(archiveDir, archive).createNewFile()
}
Then(~'^no archives are cached$') {->
    assert ! archiveDir.listFiles()
}
Given(~'^the file "([^"]*)" in temporary storage$') { String fileName ->
    new File(tmpDir, fileName).createNewFile()
}
Then(~'^no "([^"]*)" file is present in temporary storage$') { String fileName ->
    assert ! new File(tmpDir, fileName).exists()
}

Given(~'^the broadcast has been flushed$') {->
    assert broadcastFile.delete()
}
Given(~'^a prior version "([^"]*)" was detected$') { String version ->
    assert versionTokenFile.exists()
    assert versionTokenFile.text.contains(version)
}
Then(~'^no version token can be found$') {->
    assert ! versionTokenFile.exists()
}
Given(~'^the Remote Version has been flushed$') {->
    assert versionTokenFile.delete()
}