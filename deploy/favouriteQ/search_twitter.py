#setup script to hook into Djangos models
import os
import sys

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "favouriteQ.settings")
from django.core.management import execute_from_command_line

# export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages
import twitter
from questions.models import Question, Answer, Person


twitter_api = twitter.Api(consumer_key='X6GT49dzDNiePLCaNIHiAg',
              consumer_secret='4kV5v2DXFUdfYJpa8HalgATLK20zmtU1ZQeWzatw',
              access_token_key='565461060-bnetbvYCncn824yxgamZTbVeJHDu66UKDquFrv0A',
              access_token_secret='ZjNQwRQVbI9RkDXvlQkrAEEbqECIkPZgtwiSvWFS0ok')

#results = api.GetSearch('@favouriteQ', since_id=lastid)
#TODO: only get new tweets, store last ID somwhere DB.
#tweets = twitter_api.GetSearch('@favouriteQ', per_page=20)
twitter_account = '@BarackObama'
tweets = twitter_api.GetSearch(twitter_account, per_page=3)


# should this whole function be in the model?
def add_to_db(tweet):
    #TODO: move to model as this is duplicated in views.py
    question = Question.objects.order_by('-asked_date').filter(asked_date__isnull=False)[0]

    #TODO check if user is in the DB already
    person = Person.objects.filter(twitter_username='petexgraham')[0]

    # save answer
    #TODO: strip @favouriteQ from the message (how to get variable here?)
    #answer_text = tweet.text
    # ugly global belowe remove by restructuring with a class
    answer_text = tweet.text.replace(twitter_account, "")
    #print answer_text
    #print len(answer_text)
    # Do we need to filter out retweets?

    a = Answer(answer_text=answer_text, person=person, question=question)
    a.save()


#TODO? move to it's own file/class/module?
def handle_tweet(tweet):
    #print twitter_account
    #sys.exit(0)
    add_to_db(tweet)


if len(tweets) == 0:
    print 'No new tweets'
else:
    #print 'Found %s results.' % (len(tweets))
    for tweet in tweets:
        handle_tweet(tweet)