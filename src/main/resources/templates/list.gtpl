
============================================================
Available ${candidate.capitalize()} Versions
============================================================
<%
	if(local){
		local.each { version ->
			if(current == version) {
                println " > + ${version}"
            } else {
                println "   + ${version}"
            }
	    }
	}
	available.each { version ->
		if(current == version) {
			println " > * ${version}"
		} else if(installed.contains(version)){
			println "   * ${version}"
		} else {
			println "     ${version}"
		}
	}
%>
============================================================
+ - local version
* - installed
> - currently in use
============================================================
