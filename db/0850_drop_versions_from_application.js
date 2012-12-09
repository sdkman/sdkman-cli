db.application.remove()

db.broadcast.remove()
db.broadcast.insert({ "_id" : 1, "text" : "GVM version 0.8.5 release." })
db.broadcast.insert({ "_id" : 2, "text" : "In this release:" })
db.broadcast.insert({ "_id" : 3, "text" : " important bug fix on initial installation." })
db.broadcast.insert({ "_id" : 4, "text" : "" })
db.broadcast.insert({ "_id" : 5, "text" : "As always, please report any issues at:" })
db.broadcast.insert({ "_id" : 6, "text" : " https://github.com/gvmtool/gvm/issues" })
