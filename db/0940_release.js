//broadcast
db.broadcast.remove();
db.broadcast.insert({ "_id": 1, "text": "GVM version 0.9.4                              " });
db.broadcast.insert({ "_id": 2, "text": "In this release:                               " });
db.broadcast.insert({ "_id": 3, "text": " * vert.x renamed to vertx                     " });
db.broadcast.insert({ "_id": 4, "text": " * extension modules rework (thanks Jeff Beck!)" });
db.broadcast.insert({ "_id": 5, "text": " * robots.txt disallow on web service          " });
db.broadcast.insert({ "_id": 6, "text": "                                               " });
db.broadcast.insert({ "_id": 7, "text": "Report any issues at:                          " });
db.broadcast.insert({ "_id": 8, "text": "  https://github.com/gvmtool/gvm/issues        " });

//insert vertx candidate and versions
db.candidates.insert({candidate:"vertx", default: "1.3.0.final"});
db.versions.insert({candidate:"vertx", version:"1.1.0.final", url:"https://s3.amazonaws.com/vert.x/vert.x-1.1.0.final.zip"});
db.versions.insert({candidate:"vertx", version:"1.2.0.final", url:"https://s3.amazonaws.com/vert.x/vert.x-1.2.0.final.zip"});
db.versions.insert({candidate:"vertx", version:"1.2.1.final", url:"https://s3.amazonaws.com/vert.x/vert.x-1.2.1.final.zip"});
db.versions.insert({candidate:"vertx", version:"1.2.2.final", url:"https://s3.amazonaws.com/vert.x/vert.x-1.2.2.final.zip"});
db.versions.insert({candidate:"vertx", version:"1.2.3.final", url:"http://vertx.io/downloads/vert.x-1.2.3.final.zip"});
db.versions.insert({candidate:"vertx", version:"1.3.0.final", url:"http://vertx.io/downloads/vert.x-1.3.0.final.zip"});

