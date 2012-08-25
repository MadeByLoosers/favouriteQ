from django.contrib import admin
from questions.models import Question, Person, Answer

admin.site.register(Question)
admin.site.register(Person)
admin.site.register(Answer)