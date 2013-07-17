#!/usr/bin/env groovy

@Grab('org.mongodb:mongo-java-driver:2.11.0')
@Grab('org.vert-x:vertx-core:1.3.0.final')

import com.mongodb.*
import org.vertx.java.core.json.JsonObject

if(!args || args.size() > 2){
	println "Usage: broadcast.sh <broadcastfile> <configfile>"
	return
}

def config
if(args.size() == 2 && args[1]){
	def mongoConfig = args[1] as File
	config = new JsonObject(mongoConfig.text).toMap()
} else {
	config = [address: 'mongo-persistor', db_name: 'gvm', host: 'localhost', port: 27017, username: '', password: '']
}


def mongoClient = new MongoClient(config.host, config.port.toInteger())
def db = mongoClient.getDB(config.db_name)
db.authenticate(config.username, config.password?.chars)

def collection = db.getCollection('broadcast')

def removeObject = new BasicDBObject()
collection.remove(removeObject)

def input = this.args[0] as File
def counter = 1
println "\nInserting the following into ${config.db_name} at ${config.host} port ${config.port} as user ${config.username}: \n"
input.eachLine { line ->
	println "$line"
	def dbObject = new BasicDBObject('_id': counter++).append('text', line)
	collection.insert(dbObject)
}
