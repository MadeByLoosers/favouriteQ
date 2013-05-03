from django.conf import settings
from django.core.management.base import BaseCommand
from django.utils import timezone
from questions.models import Question
import twitter


class Command(BaseCommand):
    help = 'reposts current question to twitter'

    def handle(self, *args, **options):

        greeeting_dict = {
            1: 'Good morning.',
            2: 'Good afternoon.',
            3: 'Good evening.'}

        twitter_api = twitter.Api(
            consumer_key=settings.TWITTER_API['consumer_key'],
            consumer_secret=settings.TWITTER_API['consumer_secret'],
            access_token_key=settings.TWITTER_API['access_token_key'],
            access_token_secret=settings.TWITTER_API['access_token_secret'])

        # Ask the current question again
        question = Question.objects.get_current_question()
        try:
            if len(args) > 0:
                # lookup in greeting dict here, didn't want to hardcode text in cron
                greeting = greeeting_dict.get(int(args[0]), '')
                tweet = '%s %s' % (greeting, question.question)
            else:
                tweet = question.question
            status = twitter_api.PostUpdate(tweet)
            self.stdout.write(status.text + "\n")

        except Exception, e:
            self.stdout.write('Twitter exception: %s' % e)
