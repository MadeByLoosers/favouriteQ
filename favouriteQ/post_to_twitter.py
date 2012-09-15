import os
import sys
import twitter
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "favouriteQ.settings")
#from django.core.management import execute_from_command_line
from questions.models import Question
from django.utils import timezone
from django.conf import settings


twitter_api = twitter.Api(consumer_key=settings.TWITTER_API['consumer_key'],
              consumer_secret=settings.TWITTER_API['consumer_secret'],
              access_token_key=settings.TWITTER_API['access_token_key'],
              access_token_secret=settings.TWITTER_API['access_token_secret'])

question = Question.objects.get_new_question()

#TODO: add try catch here (in case of API failure)
status = twitter_api.PostUpdate(question.question)
print status.text
question.asked_date = timezone.now()
question.save()
