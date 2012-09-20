from django.conf import settings
from django.core.management.base import BaseCommand
from django.utils import timezone
from questions.models import Question
import twitter


class Command(BaseCommand):
    help = 'posts a new question to twitter'

    def handle(self, *args, **options):

        twitter_api = twitter.Api(
            consumer_key=settings.TWITTER_API['consumer_key'],
            consumer_secret=settings.TWITTER_API['consumer_secret'],
            access_token_key=settings.TWITTER_API['access_token_key'],
            access_token_secret=settings.TWITTER_API['access_token_secret'])

        question = Question.objects.get_new_question()

        #TODO: add try catch here (in case of API failure)
        status = twitter_api.PostUpdate(question.question)
        self.stdout.write(status.text + "\n")
        question.asked_date = timezone.now()
        question.save()
