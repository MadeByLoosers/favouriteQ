from django import forms


class QuestionForm(forms.Form):
    question = forms.CharField(widget=forms.Textarea(attrs={'rows': '5',
                                                            'cols': '5',
                                                            'placeholder': 'What is your favourite...',
                                                            'maxlength': '130',
                                                            'required': 'required'
                                                    }), max_length=130, required=True, label='What is your favourite...')

    twitter_user = forms.CharField(widget=forms.Textarea(attrs={'rows': '1',
                                                                'cols': '25',
                                                                'placeholder': '@your_twitter_handle (optional)',
                                                                'maxlength': '20',
                                                    }), max_length=20, required=False, label='@your_twitter_handle (optional)')
