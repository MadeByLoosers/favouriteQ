// app.js
var databaseUrl = "mydb"; // "username:password@example.com/mydb"
var collections = ["users", "questions", "answers"]
var db = require("mongojs").connect(databaseUrl, collections);

// get active question from mongo
function getActiveQuestionId(callback){
  var activeId = false;
  db.questions.find({active: true}, function(err, questions) {
    if( err || !questions) console.log("No questions found");
    
    questions.forEach( function(question) {
      callback(question._id);
      //console.log(question._id);
      //return question._id;
    });
  });
}

getActiveQuestionId(function(id){
  console.log('in callback');
  console.log("active question id " + id);
  // 4. Get answers for active question (order)
});

// 5. Dump DB?

/*
// Save Questions
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

/*
// 2. look up questions (select)
//db.questions.find({sex: "male"}, function(err, users) {
db.questions.find({}, function(err, users) {
  if( err || !users) console.log("No questions found");
  else users.forEach( function(maleUser) {
    console.log(maleUser);
  } );
});
*/