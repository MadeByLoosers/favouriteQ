# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Question'
        db.create_table('questions_question', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('question', self.gf('django.db.models.fields.CharField')(max_length=140)),
            ('asked_date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('priority', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal('questions', ['Question'])

        # Adding model 'Person'
        db.create_table('questions_person', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('twitter_username', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('first_name', self.gf('django.db.models.fields.CharField')(max_length=25)),
            ('surname', self.gf('django.db.models.fields.CharField')(max_length=25)),
            ('middle_names', self.gf('django.db.models.fields.CharField')(max_length=25, blank=True)),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal('questions', ['Person'])

        # Adding model 'Answer'
        db.create_table('questions_answer', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('question', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['questions.Question'])),
            ('answer_text', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['questions.Person'])),
            ('tweet_id', self.gf('django.db.models.fields.IntegerField')()),
            ('created_at', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('updated_at', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal('questions', ['Answer'])


    def backwards(self, orm):
        # Deleting model 'Question'
        db.delete_table('questions_question')

        # Deleting model 'Person'
        db.delete_table('questions_person')

        # Deleting model 'Answer'
        db.delete_table('questions_answer')


    models = {
        'questions.answer': {
            'Meta': {'object_name': 'Answer'},
            'answer_text': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['questions.Person']"}),
            'question': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['questions.Question']"}),
            'tweet_id': ('django.db.models.fields.IntegerField', [], {}),
            'updated_at': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'questions.person': {
            'Meta': {'object_name': 'Person'},
            'created_at': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '25'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'middle_names': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'surname': ('django.db.models.fields.CharField', [], {'max_length': '25'}),
            'twitter_username': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'updated_at': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'questions.question': {
            'Meta': {'object_name': 'Question'},
            'asked_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'created_at': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'priority': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'question': ('django.db.models.fields.CharField', [], {'max_length': '140'}),
            'updated_at': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['questions']