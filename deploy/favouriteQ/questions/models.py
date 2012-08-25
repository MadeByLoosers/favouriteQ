from django.db import models

class Question(models.Model):
    question = models.CharField(max_length=140)
    asked_date = models.DateTimeField(null=True) # Null if question hasn't been asked
    priority = models.BooleanField() # deafult to not priority
    # automatic system fields
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    def __unicode__(self):
        return self.question

class Person(models.Model):
    twitter_username = models.CharField(max_length=20)
    first_name = models.CharField(max_length=25)
    surname = models.CharField(max_length=25)
    middle_names = models.CharField(max_length=25)
    # automatic system fields
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    def __unicode__(self):
        return self.twitter_username

class Answer(models.Model):
    question = models.ForeignKey(Question)
    answer_text = models.CharField(max_length=140) # should it be less as will include @favouriteQ? possibly allow non-twitter answering in future
    person = models.ForeignKey(Person)
    # automatic system fields
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    def __unicode__(self):
        return self.answer_text