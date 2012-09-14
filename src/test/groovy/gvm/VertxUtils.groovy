package gvm

import org.vertx.groovy.core.Vertx

class VertxUtils {

	public static startServer(){
		println "Starting stub webservice..."

		def vertx = Vertx.newVertx()
		def server = vertx.createHttpServer()
		server.requestHandler { req ->
			req.response.chunked = true

			//mocked responses
			switch(req.path){
			  case('/candidate/all'):
			      req.response.write 'groovy, grails, griffon, gradle'
			      req.response.end()
				  break
			  case('/candidate/all/2.1.0'):
			      req.response.write 'true'
			      req.response.end()
				  break
			  case('/candidate/all/grails'):
			      req.response.write 'true'
			      req.response.end()
			      break
			  case('/candidate/all/groovy'):
			      req.response.write 'true'
			      req.response.end()
			      break
			  case('/candidate/all/groffle'):
			      req.response.write 'false'
			      req.response.end()
			      break
			  case('/grails/version/current'):
			      req.response.write "2.1.0"
			      req.response.end()
			      break
			  case('/grails/version/2.1.0'):
			      req.response.write "2.1.0"
			      req.response.end()
			      break
			  case('/grails/version/1.3.9'):
			      req.response.write "1.3.9"
			      req.response.end()
			      break
			  case('/grails/version/1.4.4'):
			      req.response.write "invalid"
			      req.response.end()
			      break
			  case('/grails/download/1.3.9'):
			      req.response.write "http://localhost:8080/someurl/downloadz/1.3.9"
			      req.response.end()
			      break
			  case('/someurl/downloadz/1.3.9'):
			      req.response.putHeader("Content-disposition", "attachment; filename=grails-1.3.9.zip") 
			      req.response.sendFile 'src/test/resources/grails-1.3.9.zip'
			      break
			  case('/grails/download/2.1.0'):
			      req.response.write "http://localhost:8080/someurl/downloadz/2.1.0"
			      req.response.end()
			      break
			  case('/someurl/downloadz/2.1.0'):
			      req.response.putHeader("Content-disposition", "attachment; filename=grails-2.1.0.zip") 
			      req.response.sendFile 'src/test/resources/grails-2.1.0.zip'
			      break
			  case('/grails/download'):
			      req.response.write "http://localhost:8080/someurl/downloadz/2.1.0"
			      req.response.end()
			      break
			  case('/grails/list'):
			      assert req.params.current == '2.1.0'
			      assert req.params.installed.contains('2.1.0')
			      assert req.params.installed.contains('1.3.9')
			      req.response.write "Available Grails Versions"
			      req.response.end()
			      break
			  default:
			      req.response.write "Invalid path: ${req.path}"
			      req.response.end()
			}         
		    
		}.listen(8080)

		server
	}

	public static stopServer(server){
		println "Stopping web service..."
		server.close()
		println "Stopped web service..."
	}

}
