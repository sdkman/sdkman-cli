package gvm

class CurlStub {

    private File file

    static CurlStub prepareIn(File folder) {
        folder.mkdirs()

        def file = new File(folder, "curl")
        file.createNewFile()
        file.write "#!/bin/bash\n"
        file.executable = true

        new CurlStub(file:file)
    }

    boolean prepared() {
        file && file.exists()
    }

    void primeWith(String bash) {
        file.append bash
    }
}
