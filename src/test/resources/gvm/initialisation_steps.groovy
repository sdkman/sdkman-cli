import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

gvmDir = new File(System.getenv('GVM_DIR'))

Then(~'^the gvm work folder is created$') { ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

Then(~'^the "([^"]*)" folder exists in user home$') { String arg1 ->
    assert gvmDir.isDirectory(), "The gvm directory does not exist."
}

Given(~'^an initialised system$') { ->
    gvmDir.mkdirs()
}