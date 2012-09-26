
--------------------------------------------------------
Available ${candidate.capitalize()} Versions
--------------------------------------------------------
<%
	available.each { version ->
		print "\n"
		if(current == version) { 
			print ' > '
		} else if(installed.contains(version)){
			print ' * '
		} else {
			print '   '
		}
		print version
	}
%>
--------------------------------------------------------
* - installed
> - currently in use
--------------------------------------------------------
