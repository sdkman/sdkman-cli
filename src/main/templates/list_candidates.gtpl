
================================================================================
Available Candidates
================================================================================

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