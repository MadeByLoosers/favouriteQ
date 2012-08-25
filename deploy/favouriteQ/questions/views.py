from django.shortcuts import render_to_response
from questions.models import Question, Answer

def current_question(request):

    # get the question with the most recent asked date (null asked date means question hasn't been asked)
    question = Question.objects.order_by('-asked_date').filter(asked_date__isnull=False)[0]
    answers = Answer.objects.filter(question_id=question.id)

    return render_to_response('questions/current_question.html', {"question": question, "answers":answers})