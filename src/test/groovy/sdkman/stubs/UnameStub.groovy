package sdkman.stubs

class UnameStub {

	private File file
	private platform = "Linux"
	private kernel = "Linux"
	private machine = "X86_64"

	static UnameStub prepareIn(File folder) {
		folder.mkdirs()

		def file = new File(folder, "uname")
		file.createNewFile()
		file.write "#!/usr/bin/env bash\n"
		file.executable = true

		new UnameStub(file: file)
	}

	UnameStub forKernel(String kernel) {
		this.kernel = kernel
		this
	}
	
	UnameStub forMachine(String machine) {
		this.machine = machine
		this
	}
	
	UnameStub forPlatform(String uname) {
		this.platform = uname
		this
	}

	void build() {
		file << """
			|if [[ "\$1" == '-m' ]]; then
			|	echo "$machine"
			|elif [[ "\$1" == '-s' ]]; then
			|	echo "$kernel"
			|else
			|	echo "$platform"
			|fi
			""".stripMargin('|')
	}
}
