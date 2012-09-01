import static cucumber.runtime.groovy.EN.*
import cucumber.runtime.PendingException

home = System.getProperty('user.home')
gvmDir = new File("${home}/.gvm")    

Then(~'^the "([^"]*)" folder is created in user home$') { String folder ->
    assert gvmDir.isDirectory(), "The .gvm directory does not exist."
}

Then(~'^the "([^"]*)" folder exists in user home$') { String arg1 ->
    assert gvmDir.isDirectory(), "The .gvm directory does not exist."
}

Given(~'^an initialised system$') { ->
    gvmDir.mkdirs()
}