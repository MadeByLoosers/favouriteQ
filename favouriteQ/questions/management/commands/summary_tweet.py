from django.conf import settings
from django.core.management.base import BaseCommand
from questions.models import Question
import twitter


class Command(BaseCommand):
    help = 'sends out a tweet asking for questions when we are low'

    def handle(self, *args, **options):
        twitter_api = twitter.Api(
            consumer_key=settings.TWITTER_API['consumer_key'],
            consumer_secret=settings.TWITTER_API['consumer_secret'],
            access_token_key=settings.TWITTER_API['access_token_key'],
            access_token_secret=settings.TWITTER_API['access_token_secret'])
