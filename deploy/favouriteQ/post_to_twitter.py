import os
import sys
import twitter
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "favouriteQ.settings")
from django.core.management import execute_from_command_line
from questions.models import Question, Answer, Person

#TODO: can this be added to the settings file?
twitter_api = twitter.Api(consumer_key='X6GT49dzDNiePLCaNIHiAg',
              consumer_secret='4kV5v2DXFUdfYJpa8HalgATLK20zmtU1ZQeWzatw',
              access_token_key='565461060-bnetbvYCncn824yxgamZTbVeJHDu66UKDquFrv0A',
              access_token_secret='ZjNQwRQVbI9RkDXvlQkrAEEbqECIkPZgtwiSvWFS0ok')

question = Question.objects.get_new_question()
print question

#TODO get next question from the DB
#TODO: add try catch here (in case of API failure)
#status = twitter_api.PostUpdate('test python message')
#print status.text
#TODO: if post successfull the update the DB with question posted time