
================================================================================
Available Candidates
================================================================================
q-quit                                  /-search down
j-down                                  ?-search up
k-up                                    h-help
--------------------------------------------------------------------------------
<%
	candidates.each { candidate, detail ->
		println detail.header
		println ""
		println detail.description
		println ""
		println detail.footer
		println "--------------------------------------------------------------------------------"
	}
%>