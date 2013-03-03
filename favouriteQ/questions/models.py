from django.db import models
from django.template.defaultfilters import slugify
from lazy import lazy


class QuestionManager(models.Manager):
    def get_current_question(self):
        """
        Get the question with the most recent asked date
        (null asked date means question hasn't been asked)
        """
        return self.order_by('-asked_date').filter(asked_date__isnull=False,
                                                   approved=1)[0]

    def get_new_question(self, exclude=None):
        # get priority questions first
        questions = self.order_by('?').filter(asked_date__isnull=True,
                                              priority=1,
                                              approved=1).exclude(id=exclude)

        # no priority questions then get from non-priority
        if not questions:
            questions = self.order_by('?').filter(asked_date__isnull=True,
                                                  priority=0,
                                                  approved=1)
        #TODO: add check and behaviour if we don't have a question.
        return questions[0]

    def get_num_unasked_questions(self):
        return self.filter(asked_date__isnull=True, approved=1).count()


class Question(models.Model):
    question = models.CharField(max_length=140)
    slug = models.CharField(max_length=140, null=True)
    # Null if question hasn't been asked
    asked_date = models.DateTimeField(null=True, blank=True)
    # deafult to not priority
    priority = models.BooleanField()
    approved = models.BooleanField()
    # Twitter user which suggested the question
    # TODO: update this to link to be an foreign key to Person
    twitter_user = models.CharField(max_length=140, null=True, blank=True)

    # System fields
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects = QuestionManager()

    def __unicode__(self):
        return self.question

    @lazy
    def num(self):
        count = Question.objects.filter(asked_date__lte=self.asked_date).count()
        return count

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.question)
        super(Question, self).save(*args, **kwargs)


class Person(models.Model):
    twitter_username = models.CharField(max_length=20)
    first_name = models.CharField(max_length=25)
    surname = models.CharField(max_length=25)
    middle_names = models.CharField(max_length=25, blank=True)
    # automatic system fields
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return self.twitter_username

    @property
    def name(self):
        if self.middle_names and self.surname:
            return '%s %s %s' % (self.first_name, self.middle_names, self.surname)
        elif self.surname:
            return '%s %s' % (self.first_name, self.surname)
        else:
            # Person should always have firstname set as a minimum
            return self.first_name

    class Meta:
        verbose_name_plural = "People"


class Answer(models.Model):
    question = models.ForeignKey(Question)
    answer_text = models.CharField(max_length=200)  # Increased due to strange tweets with more than 140 characters
    person = models.ForeignKey(Person)
    tweet_id = models.CharField(max_length=50)

    # automatic system fields
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return self.answer_text
