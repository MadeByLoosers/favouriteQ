from django.contrib import admin
#from django.contrib.admin import BooleanFieldListFilter
from questions.models import Question, Person, Answer


class QuestionAdmin(admin.ModelAdmin):
    list_display = ('question', 'asked_date', 'approved', 'priority')
    list_filter = ['asked_date', 'approved']
    search_fields = ['question']
    ordering = ['asked_date', 'approved']


admin.site.register(Question, QuestionAdmin)
admin.site.register(Person)
admin.site.register(Answer)
