from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext
from forms import QuestionForm
from questions.models import Question, Answer

def current_question(request):
    if request.method == 'POST':
        # this is probably a bit hacky accessing the post here
        q = Question(question=request.POST['your-question'], approved=False)
        q.save()

    question = Question.objects.get_current_question()
    return render_to_response('questions/current_question.html', {"question": question}, context_instance=RequestContext(request))

def suggest_question(request):
    if request.method == 'POST':
        form = QuestionForm(request.POST)
        if form.is_valid():
            q = Question(question=form.cleaned_data['question'], approved=False) # default priority to False
            q.save()
            return HttpResponseRedirect(reverse('questions.views.suggest_question_processed'))
    else:
        form = QuestionForm()
    return render_to_response('questions/suggest_question.html', {'form': form}, context_instance=RequestContext(request))

def suggest_question_processed(request):
    return render_to_response('questions/suggest_question_processed.html', context_instance=RequestContext(request))