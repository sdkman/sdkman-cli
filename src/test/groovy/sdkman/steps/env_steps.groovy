package sdkman.steps


import static cucumber.api.groovy.EN.And

And(~/^the file "([^"]+)" exists and contains$/) { String filename, String body ->
    def tree = new FileTreeBuilder(sdkmanBaseEnv as File)
    tree {
        "$filename"(body)
    }
}