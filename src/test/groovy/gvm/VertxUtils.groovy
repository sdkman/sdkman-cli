package gvm

import groovy.text.SimpleTemplateEngine
import org.vertx.groovy.core.http.RouteMatcher
import org.vertx.groovy.core.Vertx

class VertxUtils {

    static final LIVE_BROADCAST = "This is a LIVE Broadcast!"
    static final groovy = ['2.0.5']
    static final grails = ['1.3.6','1.3.9','2.1.0']
    static final candidates = [groovy:groovy,grails:grails]
    static final defaults = [groovy:'2.0.5',grails:'2.1.0']

    static templateEngine = new SimpleTemplateEngine()
	static server

    public static startServer(gvmVersion){
        if(!server){
			println "Starting stub webservice..."
			server = createServer("localhost", 8080, gvmVersion)
		}
		server
	}

	private static createServer(String host, int port, String gvmVersion){
		def rm = new RouteMatcher()

		rm.get("/") { req ->
			req.response.sendFile('build/scripts/install.sh')
		}

		rm.get("/selfupdate") { req ->
			req.response.sendFile('build/scripts/selfupdate.sh')
		}

		rm.get("/res") { req ->
			req.response.sendFile('build/distributions/gvm-scripts.zip')
		}

		rm.get("/candidates") { req ->
			req.response.end "groovy,grails"
		}

		rm.get("/candidates/:candidate") { req ->
			def candidate = req.params['candidate']
			def versions = candidates[candidate]?.join(',')
		    req.response.end (versions ?: "invalid")
		}

		rm.get("/candidates/:candidate/default") { req ->
			def candidate = req.params['candidate']
			req.response.end (defaults[candidate])
		}

		rm.get("/candidates/:candidate/list") { req ->
			def candidate = req.params['candidate']
			def available = candidates[candidate]
			def current = req.params['current']
			def installed = req.params['installed'].tokenize(',')
			def local = installed.findAll { ! available.contains(it) }
			def gtplFile = 'build/templates/list.gtpl' as File
			def binding = [candidate:candidate, available:available, current:current, installed:installed, local:local]
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
			req.response.end gvmVersion
		}

		rm.get("/broadcast/:version") { req ->
			req.response.end LIVE_BROADCAST
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
