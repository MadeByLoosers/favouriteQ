from django import forms

class QuestionForm(forms.Form):
    question = forms.CharField(widget=forms.Textarea(attrs={'rows':'5',
                                                            'cols': '5', 
                                                            'placeholder': 'What is your favourite...',
                                                            'maxlength': '130',
                                                            'required': 'required'},
                                                        max_length=140,
                                                        required=True,
                                                        label='Your question'))

    twitter_user = forms.CharField(max_length=20, required=False, label='Your twitter handle')