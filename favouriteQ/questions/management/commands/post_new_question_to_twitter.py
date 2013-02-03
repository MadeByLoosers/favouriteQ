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

        current_question = Question.objects.get_current_question()
        num_answers = current_question.answer_set.count()
        print num_answers
        if num_answers > 0:
            # send summary tweet with archive link (is current tweet in archive?)
            archive_url = '%sarchive/%s' % (settings.DOMAIN, current_question.slug)
            tweet_text = "Results for %s: %s" % (current_question.question, archive_url)
            print tweet_text
            # status = twitter_api.PostUpdate(tweet_text)
            # self.stdout.write(status.text + "\n")
        else:
            # blank the asked date on the question (back into question queue)
            current_question.asked_date = None
            current_question.save()

        # question = Question.objects.get_new_question()
        # #TODO: add try catch here (in case of API failure)
        # status = twitter_api.PostUpdate(question.question)
        # self.stdout.write(status.text + "\n")
        # question.asked_date = timezone.now()
        # question.save()
