import groovy.text.SimpleTemplateEngine
import org.vertx.groovy.core.http.RouteMatcher

def grails = ['1.3.7','1.3.8','1.3.9','2.0.0','2.0.1','2.0.2','2.0.3','2.0.4','2.1.0','2.1.1']
def candidates = [grails:grails]
def defaults = [grails:'2.1.1']

def gvmVersion = '0.4'
def serverVersion = '0.2'
def vertxVersion = '1.2.3.final'

def templateEngine = new SimpleTemplateEngine()

def rm = new RouteMatcher()

rm.get("/") { req ->
	addPlainTextHeader req
	req.response.sendFile('srv/scripts/install.sh')
}

rm.get("/res/init") { req ->
	addPlainTextHeader req
	req.response.sendFile('srv/scripts/gvm-init.sh')
}

rm.get("/res/gvm") { req ->
	addPlainTextHeader req
	req.response.sendFile('srv/scripts/gvm')
}

rm.get("/candidates") { req ->
	addPlainTextHeader req
	req.response.end buildCsv(candidates.keySet())
}

rm.get("/candidates/:candidate") { req ->
	def candidate = req.params['candidate']
	def versions = buildCsv(candidates[candidate])?.toString()
	addPlainTextHeader req
    req.response.end (versions ?: "invalid")
}

rm.get("/candidates/:candidate/default") { req ->
	def candidate = req.params['candidate']
	addPlainTextHeader req
	req.response.end (defaults[candidate] ?: "")
}

rm.get("/candidates/:candidate/list") { req ->
	def candidate = req.params['candidate']
	def current = req.params['current']
	def installed = req.params['installed']
	def gtplFile = new File('srv/templates/list.gtpl')
	def binding = [candidate:candidate, available:grails, current:current, installed:installed]
	def template = templateEngine.createTemplate(gtplFile).make(binding)
	addPlainTextHeader req
	req.response.end template.toString()
}

rm.get("/candidates/:candidate/:version") { req ->
	def candidate = req.params['candidate']
	def version = req.params['version']
	def found = (candidates[candidate].find { it == version}) ? version : 'invalid'
	addPlainTextHeader req
    req.response.end found
}

rm.get("/download/:candidate/:version") { req ->
	def candidate = req.params['candidate']
	def version = req.params['version']
	req.response.headers['Location'] = "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/${candidate}-${version}.zip"
	req.response.statusCode = 302
	req.response.end()
}

rm.get("/app/version") { req ->
	addPlainTextHeader req
	req.response.end '0.1'
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
