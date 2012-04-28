// app.js
var databaseUrl = "mydb"; // "username:password@example.com/mydb"
var collections = ["users", "reports"]
var db = require("mongojs").connect(databaseUrl, collections);

/*
// 1. save user (insert)
// app.js
db.users.save({email: "thegingerbloke@gmaill.com", password: "rippedToFuck", sex: "male"}, function(err, saved) {
  if( err || !saved ) console.log("User not saved");
  else console.log("User saved");
});
*/

// 3. update data
// app.js
db.users.update({email: "srirangan@gmail.com"}, {$set: {password: "iReallyLoveJews"}}, function(err, updated) {
  if( err || !updated ) console.log("User not updated");
  else console.log("User updated");
});

// 2. look up users (select)
db.users.find({sex: "male"}, function(err, users) {
  if( err || !users) console.log("No female users found");
  else users.forEach( function(maleUser) {
    console.log(maleUser);
  } );
});

// insert into other collections
// join between collections
// move db to another server?