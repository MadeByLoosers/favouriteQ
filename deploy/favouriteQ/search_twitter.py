#setup script to hook into Djangos models
import os
import sys

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "favouriteQ.settings")
from django.core.management import execute_from_command_line

# export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages
import twitter
from questions.models import Question, Answer


twitter_api = twitter.Api(consumer_key='X6GT49dzDNiePLCaNIHiAg',
              consumer_secret='4kV5v2DXFUdfYJpa8HalgATLK20zmtU1ZQeWzatw',
              access_token_key='565461060-bnetbvYCncn824yxgamZTbVeJHDu66UKDquFrv0A',
              access_token_secret='ZjNQwRQVbI9RkDXvlQkrAEEbqECIkPZgtwiSvWFS0ok')

#results = api.GetSearch('@favouriteQ', since_id=lastid)
#TODO: only get new tweets, store last ID somwhere DB.
#tweets = twitter_api.GetSearch('@favouriteQ', per_page=20)
tweets = twitter_api.GetSearch('@BarackObama', per_page=3)


def add_to_db(tweet):
    # get todays question
    queston_id = 3

    # check if user is in the DB already
    person_id = 1

    # save answer
    a = Answer(answer_text="python script test", person=person_id, question=question_id)
    a.save()


#TODO? move to it's own file/class/module?
def handle_tweet(tweet):
    print "in function: " + tweet.text
    add_to_db(tweet)
    # add results to DB (check they don't exist already)

if len(tweets) == 0:
    print 'Nothing to reply to. Quitting.'
else:
    print 'Found %s results.' % (len(tweets))
    # loop results
    for tweet in tweets:
        handle_tweet(tweet)