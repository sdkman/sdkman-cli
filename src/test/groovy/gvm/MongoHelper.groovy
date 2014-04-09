package gvm

import com.mongodb.DB
import com.mongodb.Mongo
import com.mongodb.MongoClient
import com.mongodb.WriteConcern
import com.mongodb.util.JSON

class MongoHelper {

    static final TEST_SOURCE_ROUTE = "src/test/resources"

    static prepareDB(){
        def mongo = new MongoClient()
        mongo.writeConcern = WriteConcern.NORMAL
        mongo.getDB("gvm")
    }

    static loadDbCollectionFromFile(DB db, String collection, String fileName){
        def fixtureFile = "$TEST_SOURCE_ROUTE/$fileName" as File
        def dbObject = JSON.parse(fixtureFile.text)
        def dbCollection  = db.getCollection(collection)
        dbCollection.insert(dbObject)
    }

    static dropCollectionFromDb(DB db, String collection){
        def dbCollection  = db.getCollection(collection)
        dbCollection.drop()
    }
}
