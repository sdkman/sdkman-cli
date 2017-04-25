package sdkman.stubs

class UnameStub {

    private File file
    private uname

    static UnameStub prepareIn(File folder) {
        folder.mkdirs()

        def file = new File(folder, "uname")
        file.createNewFile()
        file.write "#!/usr/bin/env bash\n"
        file.executable = true

        new UnameStub(file:file)
    }

    UnameStub forPlatform(String uname) {
        this.uname = uname
        this
    }

    void build(){
        file << "echo $uname"
    }
}
