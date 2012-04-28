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
    });
  });
}

function getAnswersForQuestion(questionId){
  console.log('got answers for ' + questionId);
  //TODO 0: Order by needed?
  db.answers.find({question_id: questionId.toString()}, function(err, answers) {
    if( err || !answers){
      console.log("No answers found");
    }else{

      console.log("answers mofo!");
      console.log(answers);
    }

    answers.forEach( function(answer) {
      console.log('testing');
      console.log(answer);
    });
  });
}

//TODO 1: write function addAnswer() do we need add user?
//TODO 2: get data saving properlly
//TODO 3: get objects saving with numeric IDs
getActiveQuestionId(getAnswersForQuestion);