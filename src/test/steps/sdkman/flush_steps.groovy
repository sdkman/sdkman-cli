package sdkman

import static cucumber.api.groovy.EN.*

And(~'^the candidate "([^"]*)" is known locally$') { String candidate ->
    assert candidatesFile.text.contains(candidate)
}

And(~'^no candidates are know locally$') {->
    assert ! candidatesFile.exists()
}

And(~'^no broadcast message can be found$') {->
    assert ! (broadcastFile.exists() && broadcastIdFile.exists())
}

And(~'^the archive "([^"]*)" has been cached$') { String archive ->
    new File(archiveDir, archive).createNewFile()
}

And(~'^no archives are cached$') {->
    assert ! archiveDir.listFiles()
}

And(~'^the file "([^"]*)" in temporary storage$') { String fileName ->
    new File(tmpDir, fileName).createNewFile()
}

And(~'^no "([^"]*)" file is present in temporary storage$') { String fileName ->
    assert ! new File(tmpDir, fileName).exists()
}

And(~'^the broadcast has been flushed$') {->
    broadcastIdFile.delete()
    broadcastFile.delete()
}

And(~'^a prior version "([^"]*)" was detected$') { String version ->
    assert versionTokenFile.exists()
    assert versionTokenFile.text.contains(version)
}

And(~'^no version token can be found$') {->
    assert ! versionTokenFile.exists()
}

And(~'^the Remote Version has been flushed$') {->
    assert versionTokenFile.delete()
}