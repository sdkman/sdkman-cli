db.versions.insert({candidate:"gradle", version:"1.3", url:"http://services.gradle.org/distributions/gradle-1.3-all.zip"})
db.candidates.update({candidate:"gradle"}, {$set:{default:"1.3"}})
