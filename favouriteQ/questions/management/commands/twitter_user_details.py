from django.conf import settings
from django.core.management.base import BaseCommand
import twitter
#from polls.models import Poll


class Command(BaseCommand):
    help = 'searches the twitter api for user details'

    def handle(self, *args, **options):
        twitter_api = twitter.Api(
            consumer_key=settings.TWITTER_API['consumer_key'],
            consumer_secret=settings.TWITTER_API['consumer_secret'],
            access_token_key=settings.TWITTER_API['access_token_key'],
            access_token_secret=settings.TWITTER_API['access_token_secret'])

        user = twitter_api.GetUser('pxgunit')
        full_name = user.name
        full_name_list = full_name.split(" ")
        surname = full_name_list[-1]
        first_name = " ".join(full_name_list[:-1])
        self.stdout.write(first_name + "\n")
        self.stdout.write(surname + "\n")
        self.stdout.write(settings.TWITTER_USER + "\n")
