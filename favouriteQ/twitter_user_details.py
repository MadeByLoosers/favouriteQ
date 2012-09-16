import os
import twitter
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "favouriteQ.settings")
from django.conf import settings


twitter_api = twitter.Api(consumer_key=settings.TWITTER_API['consumer_key'],
              consumer_secret=settings.TWITTER_API['consumer_secret'],
              access_token_key=settings.TWITTER_API['access_token_key'],
              access_token_secret=settings.TWITTER_API['access_token_secret'])

user = twitter_api.GetUser('pxgunit')
full_name = user.name
full_name_list = full_name.split(" ")
surname = full_name_list[-1]
first_name = " ".join(full_name_list[:-1])
print first_name
print surname
