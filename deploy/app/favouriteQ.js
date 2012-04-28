/*
 * What's your favourite?
 *
 * @guntlondon
 *
 */
var twitter = require('ntwitter'),
    initData;
  
/*
 * init
 * called from the main app.js file
 */
function init(data) {

  initData = data;

  // init twit
  var t = new twitter({
    consumer_key        : initData['consumer_key'],
    consumer_secret     : initData['consumer_secret'],
    access_token_key    : initData['access_token_key'],
    access_token_secret : initData['access_token_secret']
  });

  // connect to twitter stream
  t.stream(
    'statuses/filter',
    { track: [ "@" + initData['twitterAccount'] ] },
    function(stream) {
      console.log("connected to stream");

      // when we're mentioned...
      stream.on('data', handleTweet);
    }
  );
}


/*
 * handle tweet
 * tweet detected, work out what the hell to do with it...
 */
function handleTweet(tweet) {

  console.log("tweet detected: ", tweet.text);
  console.log("\r\n");

  // is it just a mention?
  if (tweet.text.toLowerCase().substr(1, initData['twitterAccount'].length) !== initData['twitterAccount'].toLowerCase()) {

    // do anything with it?
    console.log("just mentioned, ignoring...");

  // it is a direct reply
  } else {

    console.log("reply detected");
    
    // need to do this up front - does it contain a #q123 archive answer hashtag
    var matches = tweet.text.match(/#q\d+$/i);

    // does it contain a #question hashtag at the end?
    if (tweet.text.match(/#question$/i)) {

      console.log("question detected");

    // does it contain a #q123 archive answer hashtag
    } else if (!!matches) {

      console.log("archive answer to question " + matches[0] + " detected");

    // assume it's a reply to the latest question
    } else {

      // ignore any tweets containing links?
      // ignore any tweets containing #hashtags or @users?
      // moderate tweet?

      console.log("standard answer detected");
    }
  }

  console.log("\n\r--------\r\n");
}


/*
 * Post a tweet
 */
function postTweet(twit, tweet) {
  // mung and repost
  twit.updateStatus(tweet,
    function(data) {
      console.log("tweet posted: "+translated);
    }
  );
}


module.exports.init = init;