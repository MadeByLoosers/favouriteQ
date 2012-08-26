from django.shortcuts import render_to_response
from django.template import RequestContext
from questions.models import Question, Answer
import sys

def current_question(request):
    # get the question with the most recent asked date (null asked date means question hasn't been asked)
    #question = Question.objects.order_by('-asked_date').filter(asked_date__isnull=False)[0]
    question = Question.objects.get_current_question()
    #Person.objects.get_fun_people()
    #print question
    #sys.exit()
    return render_to_response('questions/current_question.html', {"question": question}, context_instance=RequestContext(request))

def suggest_question(request):
    return render_to_response('questions/suggest_question.html', context_instance=RequestContext(request))