// app.js
var databaseUrl = "mydb"; // "username:password@example.com/mydb"
var collections = ["users", "questions", "answers"]
var db = require("mongojs").connect(databaseUrl, collections);

// get active question from mongo
function getActiveQuestionId(callback){
  db.questions.find({active: true}, function(err, questions) {
    if( err || !questions) console.log("No questions found");
    
    questions.forEach( function(question) {
      callback(question._id);
      //getAnswersForQuestion(question._id);
    });
  });
}

/*
function getAnswersForQuestion(questionId){
  console.log('got answers for ' + questionId);
}
*/
//function add Answer() do we need add user?


//getActiveQuestionId();
/*
getActiveQuestionId(function(id){
  console.log('got answers for ' + id);
});
*/
getActiveQuestionId(function getAnswersForQuestion(questionId){
  console.log('got answers for ' + questionId);
  // Order by needed?
  
  db.answers.find({question_id: questionId}, function(err, answers) {
    if( err || !answers) console.log("No answers found");
    else console.log("answers mofo!");

    answers.forEach( function(answer) {
      console.log(answer);
    });
  });
});
//getActiveQuestionId(getAnswersForQuestion(id));

// 5. Dump DB?