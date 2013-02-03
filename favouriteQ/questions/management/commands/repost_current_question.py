from django.conf import settings
from django.core.management.base import BaseCommand
from django.utils import timezone
from questions.models import Question
import twitter


class Command(BaseCommand):
    help = 'reposts current question to twitter'

    def handle(self, *args, **options):

        twitter_api = twitter.Api(
            consumer_key=settings.TWITTER_API['consumer_key'],
            consumer_secret=settings.TWITTER_API['consumer_secret'],
            access_token_key=settings.TWITTER_API['access_token_key'],
            access_token_secret=settings.TWITTER_API['access_token_secret'])

        # Ask the current question again
        question = Question.objects.get_current_question()
        try:
            status = twitter_api.PostUpdate(question.question)
            self.stdout.write(status.text + "\n")
        except Exception, e:
            self.stdout.write('Twitter exception: %s' % e)
        question.asked_date = timezone.now()
        question.save()
