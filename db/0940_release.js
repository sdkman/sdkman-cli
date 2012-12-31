db.broadcast.remove();
db.broadcast.insert({ "_id": 1, "text": "GVM version 0.9.4                            " });
db.broadcast.insert({ "_id": 2, "text": "In this release:                             " });
db.broadcast.insert({ "_id": 3, "text": " * vert.x renamed to vertx                   " });
db.broadcast.insert({ "_id": 4, "text": "                                             " });
db.broadcast.insert({ "_id": 5, "text": "Report any issues at:                        " });
db.broadcast.insert({ "_id": 6, "text": "  https://github.com/gvmtool/gvm/issues      " });

//rename vert.x to vertx
db.candidates.update({candidate:"vert.x"}, {$set:{candidate:"vertx"}});
db.versions.update({candidate:"vert.x"}, {$set:{candidate:"vertx"}}, {multi:true});
