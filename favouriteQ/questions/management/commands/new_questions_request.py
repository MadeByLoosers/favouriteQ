from django.conf import settings
from django.core.management.base import BaseCommand
import twitter


class Command(BaseCommand):
    help = 'Ask for new questions'

    def handle(self, *args, **options):
        twitter_api = twitter.Api(
            consumer_key=settings.TWITTER_API['consumer_key'],
            consumer_secret=settings.TWITTER_API['consumer_secret'],
            access_token_key=settings.TWITTER_API['access_token_key'],
            access_token_secret=settings.TWITTER_API['access_token_secret'])

        tweet_text = "We love questions! What's your Favourite Question? Suggest more %s#suggest" % settings.DOMAIN
        status = twitter_api.PostUpdate(tweet_text)
        self.stdout.write(status.text + "\n")
