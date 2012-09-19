import twitter
import HTMLParser
from django.conf import settings
from django.core.management.base import BaseCommand
from questions.models import Question, Answer, Person


class Command(BaseCommand):
    args = '<poll_id poll_id ...>'
    help = 'Closes the specified poll for voting'

    def handle(self, *args, **options):
        twitter_api = twitter.Api(
            consumer_key=settings.TWITTER_API['consumer_key'],
            consumer_secret=settings.TWITTER_API['consumer_secret'],
            access_token_key=settings.TWITTER_API['access_token_key'],
            access_token_secret=settings.TWITTER_API['access_token_secret'])
        twitter_account = settings.TWITTER_USER

        answer = Answer.objects.get_newest_tweet_answer()

        # Example URL http://search.twitter.com/search.json?q=%40favouriteQ
        tweets = twitter_api.GetSearch(twitter_account,
                                       per_page=100,
                                       page=1,
                                       lang='',
                                       since_id=answer.tweet_id)

        if len(tweets) == 0:
            self.stdout.write('No new tweets')
        else:
            for tweet in tweets:
                self.stdout.write('tweet: ' + tweet)
                #handle_tweet(tweet)


    def add_answer_to_db(tweet):
        question = Question.objects.get_current_question()
        person = Person.objects.filter(twitter_username=tweet.user.screen_name)

        #TODO: could this sort of logic be moved to the model?
        if not person:
            # Get the users real name
            user = twitter_api.GetUser(tweet.user.screen_name)
            full_name_list = user.name.split(" ")
            first_name = full_name_list[0]
            middle_names = " ".join(full_name_list[1:-1])
            if len(full_name_list) > 1:
                surname = full_name_list[-1]
            else:
                surname = ""

            person = Person(twitter_username=tweet.user.screen_name,
                first_name=first_name,
                middle_names=middle_names,
                surname=surname)
            person.save()
        else:
            # get person from the query set. Inelegant could this be modified with custom save() on the model
            person = person[0]

        #TODO: ugly global below remove by restructuring with a class
        # Remove @FavouriteQueston from the tweet (+2 is for @ and space)
        answer_text = tweet.text[len(twitter_account) + 2:]
        #TODO: add a try catch here incase they are unprintable characters
        #print answer_text + " " + person.twitter_username
        # Decode HTML encoded entities from Twitter
        h = HTMLParser.HTMLParser()
        answer_text = h.unescape(answer_text)

        a = Answer(answer_text=answer_text, person=person, question=question, tweet_id=tweet.id)
        a.save()

    #TODO? move to it's own file/class/module?
    def handle_tweet(tweet):
        # check if it's just a mention or an actual @ message
        if twitter_at_message_check(tweet.text, twitter_account):
            add_answer_to_db(tweet)
        else:
            print "NOT A AT MESSAGE: " + tweet.text
        #TODO: does it contain a #q123 archive answer hashtag
        #var matches = tweet.text.match(/#q\d+$/i);
        # add_answer(tweet, question_id?)

        # does it contain a #question hashtag at the end?
        #if (tweet.text.match(/#question$/i)) {
        # suggest_question(tweet, question_id?)

    def twitter_at_message_check(string, twitter_account):
        twitter_account = '@' + twitter_account
        start_string = string[0:len(twitter_account)]
        return start_string.lower() == twitter_account.lower()
