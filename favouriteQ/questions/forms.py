from django import forms

class QuestionForm(forms.Form):
    question = forms.CharField(widget=forms.Textarea(), max_length=140)
    twitter_user = forms.CharField(max_length=20)