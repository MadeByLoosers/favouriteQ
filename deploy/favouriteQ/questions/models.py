from django.db import models

class QuestionManager(models.Manager):
    def get_current_question(self):
        # get the question with the most recent asked date (null asked date means question hasn't been asked)
        return self.order_by('-asked_date').filter(asked_date__isnull=False)[0]

    def get_new_question(self):
        return self.order_by('-asked_date').filter(asked_date__isnull=False)[0]


class Question(models.Model):
    question = models.CharField(max_length=140)
    asked_date = models.DateTimeField(null=True, blank=True) # Null if question hasn't been asked
    priority = models.BooleanField() # deafult to not priority
    
    # System fields
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    objects = QuestionManager()

    def __unicode__(self):
        return self.question


class Person(models.Model):
    twitter_username = models.CharField(max_length=20)
    first_name = models.CharField(max_length=25)
    surname = models.CharField(max_length=25)
    middle_names = models.CharField(max_length=25, blank=True)
    # automatic system fields
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    def __unicode__(self):
        return self.twitter_username

    class Meta:
        verbose_name_plural = "People"


class AnswerManager(models.Manager):
    def get_newest_tweet_answer(self):
        return self.order_by('-tweet_id')[0]#.filter(asked_date__isnull=False)[0]


class Answer(models.Model):
    question = models.ForeignKey(Question)
    answer_text = models.CharField(max_length=200) # Increased due to strange tweets with more than 140 characters
    person = models.ForeignKey(Person)
    tweet_id = models.IntegerField()

    # automatic system fields
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    objects = AnswerManager()

    def __unicode__(self):
        return self.answer_text