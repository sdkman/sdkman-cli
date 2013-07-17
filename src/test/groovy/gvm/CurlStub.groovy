package gvm

class CurlStub {
	
	static prepareIn(String folder){
		def file = new File("$folder/curl")
		file.createNewFile()
		file.write "#!/bin/bash\n"
		file.executable = true
		file
	}	

	void primeWith(String bash){
		file.append bash
	}
}
