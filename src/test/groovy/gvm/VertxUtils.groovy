package gvm

import groovy.text.SimpleTemplateEngine
import org.vertx.groovy.core.http.RouteMatcher
import org.vertx.groovy.core.Vertx

class VertxUtils {

	final static grails = ['1.3.9','2.1.0']
	final static candidates = [grails:grails]
	final static defaults = [grails:'2.1.0']

	static final gvmVersion = '0.1'
	static final serverVersion = '0.1'
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
			def versions = buildCsv(candidates[candidate])?.toString()
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
			def found = (candidates[candidate].find { it == version}) ? version : 'invalid'
			req.response.end found
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
			if(gvmVersion == version){
				gtplFile = new File('srv/templates/broadcast.gtpl')
				binding = [server:serverVersion, vertx:vertxVersion]
			} else {
				gtplFile = new File('srv/templates/upgrade.gtpl')
				binding = [version:gvmVersion]
			}
			def template = templateEngine.createTemplate(gtplFile).make(binding)
			req.response.end template.toString()
		}

		def vertx = Vertx.newVertx()
		server = vertx.createHttpServer()
		server.requestHandler(rm.asClosure())
		server.listen(port, host)
		server
	}

	private static buildCsv(list){
		if(!list) return ""
		def csv = ''
		list.each { csv += "$it," }
		csv[0..-2]	
	}

	public static stopServer(server){
		println "Stopping web service..."
		server.close()
		println "Stopped web service..."
	}

}
