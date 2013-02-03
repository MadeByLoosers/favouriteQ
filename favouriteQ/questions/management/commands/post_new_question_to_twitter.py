from django.conf import settings
from django.core.management.base import BaseCommand
from django.core.urlresolvers import reverse
from django.utils import timezone
from questions.models import Question
import twitter
import urlparse


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

        if num_answers > 0:
            # send summary tweet with archive link
            archive_url = reverse('questions.views.detail', args=(current_question.slug,))
            archive_url = urlparse.urljoin(settings.DOMAIN, archive_url)
            tweet_text = "Results for %s: %s" % (current_question.question, archive_url)
            try:
                status = twitter_api.PostUpdate(tweet_text)
                self.stdout.write(status.text + "\n")
            except Exception, e:
                print 'Twitter exception: %s' % e
        else:
            # blank the asked date on the question (back into question queue)
            current_question.asked_date = None
            current_question.save()

        # Ask new question (exclude the question before)
        question = Question.objects.get_new_question(exclude=current_question.id)
        print 'new question is %s' % question
        try:
            status = twitter_api.PostUpdate(question.question)
            self.stdout.write(status.text + "\n")
        except Exception, e:
            print 'Twitter exception: %s' % e
        question.asked_date = timezone.now()
        question.save()
