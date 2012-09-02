package gvm

import org.vertx.groovy.core.Vertx

class VertxUtils {

	public static startServer(){
		def vertx = Vertx.newVertx()
		def server = vertx.createHttpServer()
		server.requestHandler { req ->
			req.response.chunked = true

			//mocked responses
			switch(req.path){
			  case('/candidate/validate/grails'):
			      req.response.write 'true'
			      req.response.end()
			      break
			  case('/candidate/validate/groffle'):
			      req.response.write 'false'
			      req.response.end()
			      break
			  case('/grails/version'):
			      req.response.write "2.1.0"
			      req.response.end()
			      break
			  case('/grails/version/1.3.9'):
			      req.response.write "1.3.9"
			      req.response.end()
			      break
			  case('/grails/version/1.4.4'):
			      req.response.write ""
			      req.response.end()
			      break
			  case('/grails/download/1.3.9'):
			      req.response.putHeader("Content-disposition", "attachment; filename=grails-1.3.9.zip") 
			      req.response.sendFile 'src/test/resources/grails-1.3.9.zip'
			      break
			  case('/grails/download/2.1.0'):
			      req.response.putHeader("Content-disposition", "attachment; filename=grails-2.1.0.zip") 
			      req.response.sendFile 'src/test/resources/grails-2.1.0.zip'
			      break
			  case('/grails/download'):
			      req.response.putHeader("Content-disposition", "attachment; filename=grails-2.1.0.zip") 
			      req.response.sendFile 'src/test/resources/grails-2.1.0.zip'
			      break
			  default:
			      req.response.write "Invalid path: ${req.path}"
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