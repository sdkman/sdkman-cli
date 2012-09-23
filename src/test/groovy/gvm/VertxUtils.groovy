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
			  case('/alive'):
			      req.response.end 'hello world'
			      break
			  case('/candidate/all'):
			      req.response.end 'groovy, grails, griffon, gradle'
				  break
			  case('/candidate/index/2.1.0'):
			      req.response.end 'true'
				  break
			  case('/candidate/index/grails'):
			      req.response.end 'true'
			      break
			  case('/candidate/index/groovy'):
			      req.response.end 'true'
			      break
			  case('/candidate/index/groffle'):
			      req.response.end 'false'
			      break
			  case('/grails/version'):
			      req.response.end "2.1.0"
			      break
			  case('/grails/version/2.1.0'):
			      req.response.end "2.1.0"
			      break
			  case('/grails/version/1.3.9'):
			      req.response.end "1.3.9"
			      break
			  case('/grails/version/1.4.4'):
			      req.response.end "invalid"
			      break
			  case('/grails/download/1.3.9'):
			      req.response.end "http://localhost:8080/someurl/downloadz/1.3.9"
			      break
			  case('/someurl/downloadz/1.3.9'):
			      req.response.putHeader("Content-disposition", "attachment; filename=grails-1.3.9.zip") 
			      req.response.sendFile 'src/test/resources/grails-1.3.9.zip'
			      break
			  case('/grails/download/2.1.0'):
			      req.response.end "http://localhost:8080/someurl/downloadz/2.1.0"
			      break
			  case('/someurl/downloadz/2.1.0'):
			      req.response.putHeader("Content-disposition", "attachment; filename=grails-2.1.0.zip") 
			      req.response.sendFile 'src/test/resources/grails-2.1.0.zip'
			      break
			  case('/grails/download'):
			      req.response.end "http://localhost:8080/someurl/downloadz/2.1.0"
			      break
			  case('/grails/list'):
			      assert req.params.current == '2.1.0'
			      assert req.params.installed.contains('2.1.0')
			      assert req.params.installed.contains('1.3.9')
			      req.response.end "Available Grails Versions"
			      break
			  default:
			      req.response.end "Invalid path: ${req.path}"
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
