import os
import sys
import twitter
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "favouriteQ.settings")
from django.core.management import execute_from_command_line
from questions.models import Question, Answer, Person
# export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages

#TODO: can this be added to the settings file?
twitter_api = twitter.Api(consumer_key='X6GT49dzDNiePLCaNIHiAg',
              consumer_secret='4kV5v2DXFUdfYJpa8HalgATLK20zmtU1ZQeWzatw',
              access_token_key='565461060-bnetbvYCncn824yxgamZTbVeJHDu66UKDquFrv0A',
              access_token_secret='ZjNQwRQVbI9RkDXvlQkrAEEbqECIkPZgtwiSvWFS0ok')


#twitter_account = '@favouriteQ'
twitter_account = '@BarackObama'
answer = Answer.objects.get_newest_tweet_answer()

#TODO: increase number of tweets fetched
tweets = twitter_api.GetSearch(twitter_account, per_page=3, since_id=answer.tweet_id)


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

    # save answer
    #TODO: ugly global belowe remove by restructuring with a class
    answer_text = tweet.text.replace(twitter_account, "")
    #TODO: Do we need to filter out retweets? Once regex is in we should be ok
    a = Answer(answer_text=answer_text, person=person, question=question, tweet_id=tweet.id)
    a.save()


#TODO? move to it's own file/class/module?
def handle_tweet(tweet):
    # check if it's just a mention or an actual @ message
    if twitter_at_message_check(string1, twitter_account):
        add_answer_to_db(tweet)
    #TODO: does it contain a #q123 archive answer hashtag
    #var matches = tweet.text.match(/#q\d+$/i);
    # add_answer(tweet, question_id?)

    # does it contain a #question hashtag at the end?
    #if (tweet.text.match(/#question$/i)) {
    # suggest_question(tweet, question_id?)


def twitter_at_message_check(string, twitter_account):
    start_string = string[0:len(twitter_account)]
    return start_string == twitter_account


# test code for @ message check
string1 = twitter_account + " good reply comment"
string2 = "bad mention comment " + twitter_account
print twitter_at_message_check(string1, twitter_account)
print twitter_at_message_check(string2, twitter_account)
sys.exit()

if len(tweets) == 0:
    print 'No new tweets'
else:
    for tweet in tweets:
        handle_tweet(tweet)