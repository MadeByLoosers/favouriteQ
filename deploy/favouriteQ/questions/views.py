from django.shortcuts import render_to_response
from django.template import RequestContext
from questions.models import Question, Answer
#import sys

def current_question(request):
    question = Question.objects.get_current_question()
    return render_to_response('questions/current_question.html', {"question": question}, context_instance=RequestContext(request))

def suggest_question(request):
    return render_to_response('questions/suggest_question.html', context_instance=RequestContext(request))