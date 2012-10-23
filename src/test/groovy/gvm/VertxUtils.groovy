package gvm

import groovy.text.SimpleTemplateEngine
import org.vertx.groovy.core.http.RouteMatcher
import org.vertx.groovy.core.Vertx

class VertxUtils {

	final static grails = ['1.3.6','1.3.9','2.1.0']
	final static candidates = [grails:grails]
	final static defaults = [grails:'2.1.0']

	static final gvmVersion = '0.8'
	static final vertxVersion = '1.2.3.final'


	static templateEngine = new SimpleTemplateEngine()

	static server

	public static startServer(){
		if(!server){
			println "Starting stub webservice..."
			server = createServer("localhost", 8080)
		}
		server
	}

	private static createServer(String host, int port){
		def rm = new RouteMatcher()

		rm.get("/") { req ->
			req.response.sendFile('srv/scripts/install.sh')
		}

		rm.get("/res/init") { req ->
			req.response.sendFile('srv/scripts/gvm-init.sh')
		}

		rm.get("/res/gvm") { req ->
			req.response.sendFile('srv/scripts/gvm')
		}

		rm.get("/candidates") { req ->
			req.response.end "grails"
		}

		rm.get("/candidates/:candidate") { req ->
			def candidate = req.params['candidate']
			def versions = candidates[candidate]?.join(',')
		    req.response.end (versions ?: "invalid")
		}

		rm.get("/candidates/:candidate/default") { req ->
			def candidate = req.params['candidate']
			req.response.end "2.1.0"
		}

		rm.get("/candidates/:candidate/list") { req ->
			def candidate = req.params['candidate']
			def current = req.params['current']
			def installed = req.params['installed']
			def gtplFile = new File('srv/templates/list.gtpl')
			def binding = [candidate:candidate, available:grails, current:current, installed:installed]
			def template = templateEngine.createTemplate(gtplFile).make(binding)
			req.response.end template.toString()
		}

		rm.get("/candidates/:candidate/:version") { req ->
			def candidate = req.params['candidate']
			def version = req.params['version']
			def versionValid = (candidates[candidate].find { it == version}) ? 'valid' : 'invalid'
			req.response.end versionValid
		}

		rm.get("/download/:candidate/:version") { req ->
			def candidate = req.params['candidate']
			def version = req.params['version']
			req.response.putHeader "Content-disposition", "attachment; filename=${candidate}-${version}.zip"
			req.response.sendFile "src/test/resources/${candidate}-${version}.zip"
		}

		rm.get("/app/version") { req ->
			req.response.end '0.1'
		}

		rm.get("/app/alive/:version") { req ->
			def version = req.params['version']
			def gtplFile, binding
			def output
			if(gvmVersion == version){
				output = "This is a LIVE Broadcast!"

			} else {
				gtplFile = new File('srv/templates/upgrade.gtpl')
				binding = [version:version, gvmVersion:gvmVersion]
				def template = templateEngine.createTemplate(gtplFile).make(binding)
				output = template.toString()
			}
			req.response.end output
		}

		def vertx = Vertx.newVertx()
		server = vertx.createHttpServer()
		server.requestHandler(rm.asClosure())
		server.listen(port, host)
		server
	}

	public static stopServer(server){
		println "Stopping web service..."
		server.close()
		println "Stopped web service..."
	}

}
