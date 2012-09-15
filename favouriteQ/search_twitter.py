import os
import sys
import twitter
import HTMLParser
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "favouriteQ.settings")
from questions.models import Question, Answer, Person
from django.conf import settings


twitter_api = twitter.Api(consumer_key=settings.TWITTER_API['consumer_key'],
              consumer_secret=settings.TWITTER_API['consumer_secret'],
              access_token_key=settings.TWITTER_API['access_token_key'],
              access_token_secret=settings.TWITTER_API['access_token_secret'])
twitter_account = settings.TWITTER_USER

answer = Answer.objects.get_newest_tweet_answer()

# Example URL http://search.twitter.com/search.json?q=%40favouriteQ
tweets = twitter_api.GetSearch(twitter_account, per_page=100, page=1, lang='', since_id=answer.tweet_id)


def add_answer_to_db(tweet):
    question = Question.objects.get_current_question()
    person = Person.objects.filter(twitter_username=tweet.user.screen_name)

    #TODO: could this sort of logic be moved to the model?
    if not person:
        person = Person(twitter_username=tweet.user.screen_name)
        person.save()
    else:
        # get person from the query set. Inelegant could this be modified?
        person = person[0]

    #TODO: ugly global below remove by restructuring with a class
    # Remove @FavouriteQueston from the tweet
    answer_text = tweet.text[len(twitter_account) + 1:]
    print answer_text + " " + person.twitter_username
    h = HTMLParser.HTMLParser()
    answer_text = h.unescape(answer_text)
    #print answer_text
    #sys.exit(0)

    a = Answer(answer_text=answer_text, person=person, question=question, tweet_id=tweet.id)
    a.save()


#TODO? move to it's own file/class/module?
def handle_tweet(tweet):
    # check if it's just a mention or an actual @ message
    if twitter_at_message_check(tweet.text, twitter_account):
        add_answer_to_db(tweet)
    else:
        print "NO A AT MESSAGE: " + tweet.text
    #TODO: does it contain a #q123 archive answer hashtag
    #var matches = tweet.text.match(/#q\d+$/i);
    # add_answer(tweet, question_id?)

    # does it contain a #question hashtag at the end?
    #if (tweet.text.match(/#question$/i)) {
    # suggest_question(tweet, question_id?)


def twitter_at_message_check(string, twitter_account):
    start_string = string[0:len(twitter_account)]
    return start_string.lower() == twitter_account.lower()


if len(tweets) == 0:
    print 'No new tweets'
else:
    for tweet in tweets:
        handle_tweet(tweet)