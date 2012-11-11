package gvm

import groovy.text.SimpleTemplateEngine
import org.vertx.groovy.core.http.RouteMatcher

class ServerResponses {

	def gvmVersion
	def vertxVersion

	def templateEngine = new SimpleTemplateEngine()

	final static grails = ['1.3.6','1.3.9','2.1.0']
	final static candidates = [grails:grails]
	final static defaults = [grails:'2.1.0']

	def createRouteMatcherFor(server) {
		def rm = new RouteMatcher()

		rm.get("/") { req ->
			req.response.sendFile('srv/scripts/install.sh')
		}

		rm.get("/selfupdate") { req ->
			req.response.sendFile('src/test/resources/selfupdate.sh')
		}

		rm.get("/res") { req ->
			req.response.sendFile('src/test/resources/res.zip')
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

		rm.get("/broadcast/:version") { req ->
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

		server.requestHandler(rm.asClosure())
	}
}