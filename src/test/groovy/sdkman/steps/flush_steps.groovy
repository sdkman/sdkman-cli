package sdkman.steps

import static cucumber.api.groovy.EN.*

And(~'^the candidate "([^"]*)" is known locally$') { String candidate ->
    assert candidatesFile.text.contains(candidate)
}

And(~'^no candidates are know locally$') {->
    assert ! candidatesFile.exists()
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

And(~'^a prior version "([^"]*)" was detected$') { String version ->
    assert versionFile.exists()
    assert versionFile.text.contains(version)
}

And(~'^no version file can be found$') {->
    assert ! versionFile.exists()
}

And(~'^the Remote Version has been flushed$') {->
    assert versionFile.delete()
}