// app.js
var databaseUrl = "mydb"; // "username:password@example.com/mydb"
var collections = ["users", "questions", "reports"]
var db = require("mongojs").connect(databaseUrl, collections);

// 1. save user (insert)
/*
// app.js
db.users.save({email: "petegaham1@gmaill.com", password: "123456", sex: "male"}, function(err, saved) {
  if( err || !saved ) console.log("User not saved");
  else console.log("User saved");
});
*/

/*
db.questions.save({question: "Who's your favourite Jew?", asked: false});
db.questions.save({question: "What's your favourite cheese?", asked: false});
db.questions.save({question: "What's your favourite cephalopod?", asked: false});
/*, function(err, saved) {
  if( err || !saved ) console.log("question not saved");
  else console.log("question saved");
});
*/

/*
// 3. update data
// app.js
db.users.update({email: "srirangan@gmail.com"}, {$set: {password: "iReallyLoveJews"}}, function(err, updated) {
  if( err || !updated ) console.log("User not updated");
  else console.log("User updated");
});
*/

// 2. look up users (select)
//db.questions.find({sex: "male"}, function(err, users) {
db.questions.find({}, function(err, users) {
  if( err || !users) console.log("No questions found");
  else users.forEach( function(maleUser) {
    console.log(maleUser);
  } );
});

// insert into other collections
// join between collections
// move db to another server?