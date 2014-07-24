package gvm.stubs

class CurlStub {

    private File file
    private commands = [:]

    static CurlStub prepareIn(File folder) {
        folder.mkdirs()

        def file = new File(folder, "curl")
        file.createNewFile()
        file.write "#!/bin/bash\n"
        file.executable = true

        new CurlStub(file:file)
    }

    CurlStub primeWith(String request, String snippet) {
        commands.put request, snippet
        this
    }

    void build(){
        commands.each { request, snippet ->
            //use second arg because we use curl with -s
            file << 'if [[ "$2" == "'
            file << "$request"
            file << '" ]]; then\n'
            file << "    $snippet\n"
            file << 'fi\n'
        }
    }
}
