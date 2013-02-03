from django.conf import settings
from django.core.management.base import BaseCommand
from questions.models import Question
import twitter


class Command(BaseCommand):
    help = 'sends out a tweet asking for questions when we are low'

    def handle(self, *args, **options):
        # TODO: move this to ultility function
        twitter_api = twitter.Api(
            consumer_key=settings.TWITTER_API['consumer_key'],
            consumer_secret=settings.TWITTER_API['consumer_secret'],
            access_token_key=settings.TWITTER_API['access_token_key'],
            access_token_secret=settings.TWITTER_API['access_token_secret'])

        num_questions = Question.objects.get_num_unasked_questions()
        if num_questions < 7:
            self.stdout.write('send tweet')
            #TODO: get site url from settings
            tweet_text = "We're running low on questions. Go to http://favouritequestion.com/#suggest and suggest some more"
            status = twitter_api.PostUpdate(tweet_text)
            self.stdout.write(status.text + "\n")
