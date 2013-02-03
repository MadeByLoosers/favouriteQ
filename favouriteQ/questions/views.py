from django.conf import settings
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import get_object_or_404, render_to_response
from django.template import RequestContext
from forms import QuestionForm
from questions.models import Question


def current_question(request):
    question = Question.objects.get_current_question()
    params = {"question": question, "current": True}
    return render_template(request, "questions/current_question.html", params)


def archive(request):
    questions = Question.objects.order_by('-asked_date').filter(asked_date__isnull=False)
    params = {"questions": questions}
    return render_template(request, "questions/archive.html", params)


def detail(request, slug):
    question = get_object_or_404(Question,
                                 Q(asked_date__isnull=False, slug=slug))

    params = {"question": question}
    return render_template(request, "questions/current_question.html", params)


def ajax_suggest(request):
    if request.method == 'POST':
        form = QuestionForm(request.POST)
        if form.is_valid():
            q = Question(question=form.cleaned_data['question'],
                         twitter_user=form.cleaned_data['twitter_user'],
                         approved=False)
            q.save()
            message = "success"
        else:
            # shouldn't be reached accept if HTML5 validation is bypassed
            message = "form not valid"
    else:
        message = "you must post"
    return HttpResponse(message)


# def handle_form(request):
#     if request.method == 'POST':
#         form = QuestionForm(request.POST)
#         if form.is_valid():
#             q = Question(question=form.cleaned_data['question'],
#                          approved=False)
#             q.save()
#             print "success"
#         else:
#             # shouldn't be reached accept if HTML5 validation is bypassed
#             print "form not valid"
#     else:
#         form = QuestionForm()
#     return form


def render_template(request, template, params):
    params['twitter_account'] = settings.TWITTER_USER
    # Deal with Form submission which is on everypage
    #params['form'] = handle_form(request)
    params['form'] = QuestionForm()
    return render_to_response(template, params,
                              context_instance=RequestContext(request))
