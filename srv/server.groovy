import groovy.text.SimpleTemplateEngine
import org.vertx.groovy.core.http.RouteMatcher
import org.vertx.java.core.json.JsonObject

def grails = ['1.3.7','1.3.8','1.3.9','2.0.0','2.0.1','2.0.2','2.0.3','2.0.4','2.1.0','2.1.1']
def candidates = [grails:grails]
def defaults = [grails:'2.1.1']

def gvmVersion = '0.4'
def serverVersion = '0.2'
def vertxVersion = '1.2.3.final'

def config
def mongoJson = new File('srv/mongo.json')
if(mongoJson.exists()){
	config = new JsonObject(mongoJson.text).toMap()
} else {
	config = [address: 'mongo-persistor', db_name: 'gvm']
}
container.deployModule('vertx.mongo-persistor-v1.1', config)

def templateEngine = new SimpleTemplateEngine()

def rm = new RouteMatcher()

rm.get("/") { req ->
	addPlainTextHeader req
	req.response.sendFile('srv/scripts/install.sh')
}

rm.get("/res/init") { req ->
	log 'init', 'n/a', 'n/a', req
	addPlainTextHeader req
	req.response.sendFile 'srv/scripts/gvm-init.sh'
}

rm.get("/res/gvm") { req ->
	addPlainTextHeader req
	req.response.sendFile('srv/scripts/gvm')
}

rm.get("/candidates") { req ->
	def cmd = [action:"find", collection:"candidates", matcher:[:], keys:[candidate:1]]
	vertx.eventBus.send("mongo-persistor", cmd){ msg ->
		def cand = msg.body.results.collect { it.candidate }
		addPlainTextHeader req
		req.response.end buildCsv(cand)
	}
}

rm.get("/candidates/:candidate") { req ->
	def candidate = req.params['candidate']
	def cmd = [action:"find", collection:"versions", matcher:[candidate:candidate], keys:["version":1]]
	vertx.eventBus.send("mongo-persistor", cmd){ msg ->
		def response
		if(msg.body.results){
			def versions = msg.body.results.collect { it.version }
			def versionsCsv = buildCsv(versions)?.toString()
			response = versionsCsv

		} else {
			response = "invalid"
		}

		addPlainTextHeader req
		req.response.end response
	}
}

rm.get("/candidates/:candidate/default") { req ->
	def candidate = req.params['candidate']
	def cmd = [action:"find", collection:"candidates", matcher:[candidate:candidate], keys:["default":1]]
	vertx.eventBus.send("mongo-persistor", cmd){ msg ->
		addPlainTextHeader req
		def defaultVersion = msg.body.results.default
		req.response.end (defaultVersion ?: "")
	}
}

rm.get("/candidates/:candidate/list") { req ->
	def candidate = req.params['candidate']
	def current = req.params['current']
	def installed = req.params['installed']
	def gtplFile = new File('srv/templates/list.gtpl')

	def cmd = [action:"find", collection:"versions", matcher:[candidate:candidate], keys:["version":1], sort:["version":1]]
	vertx.eventBus.send("mongo-persistor", cmd){ msg ->
		def available = msg.body.results.collect { it.version }
		def binding = [candidate:candidate, available:available, current:current, installed:installed]
		def template = templateEngine.createTemplate(gtplFile).make(binding)
		addPlainTextHeader req
		req.response.end template.toString()
	}
}

rm.get("/candidates/:candidate/:version") { req ->
	def candidate = req.params['candidate']
	def version = req.params['version']
	def cmd = [action:"find", collection:"versions", matcher:[candidate:candidate, version:version]]
	vertx.eventBus.send("mongo-persistor", cmd){ msg ->
		addPlainTextHeader req
		if(msg.body.results) {
			req.response.end 'valid'
		} else {
			req.response.end 'invalid'
		}
	}
}

rm.get("/download/:candidate/:version") { req ->
	def candidate = req.params['candidate']
	def version = req.params['version']

	log 'install', candidate, version, req

	def cmd = [action:"find", collection:"versions", matcher:[candidate:candidate, version:version], keys:["url":1]]
	vertx.eventBus.send("mongo-persistor", cmd){ msg ->
		req.response.headers['Location'] = msg.body.results.url.first()
		req.response.statusCode = 302
		req.response.end()
	}
}

rm.get("/app/version") { req ->
	addPlainTextHeader req
	req.response.end gvmVersion
}

rm.get("/app/alive/:version") { req ->
	addPlainTextHeader req
	def version = req.params['version']
	def gtpFile, binding
	if(gvmVersion == version){
		gtplFile = new File('srv/templates/broadcast.gtpl')
		binding = [server:serverVersion, vertx:vertxVersion]
	} else {
		gtplFile = new File('srv/templates/upgrade.gtpl')
		binding = [gvmVersion:gvmVersion, version:version]
	}
	def template = templateEngine.createTemplate(gtplFile).make(binding)
	req.response.end template.toString()
}

def port = System.getenv('PORT') ?: 8080
def host = System.getenv('PORT') ? '0.0.0.0' : 'localhost'
println "Starting vertx on $host:$port"
vertx.createHttpServer().requestHandler(rm.asClosure()).listen(port as int, host)

private addPlainTextHeader(req){
	req.response.putHeader("Content-Type", "text/plain")
}

private buildCsv(list){
	if(!list) return ""
	def csv = ''
	list.each { csv += "$it," }
	csv[0..-2]	
}

private log(command, candidate, version, req){
	def date = new Date()
	def host = req.headers['x-forwarded-for']
	def agent = req.headers['user-agent']
	def platform = req.params['platform']

	def document = [
		command:command,
		candidate:candidate,
		version:version,
		host:host,
		agent:agent,
		platform:platform,
		date:date
	]

	def cmd = [action:'save', collection:'audit', document:document] 

	vertx.eventBus.send 'mongo-persistor', cmd
}
