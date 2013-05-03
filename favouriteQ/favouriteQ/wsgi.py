"""
WSGI config for favouriteQ project.

This module contains the WSGI application used by Django's development server
and any production WSGI deployments. It should expose a module-level variable
named ``application``. Django's ``runserver`` and ``runfcgi`` commands discover
this application via the ``WSGI_APPLICATION`` setting.

Usually you will have the standard Django WSGI application here, but it also
might make sense to replace the whole Django WSGI application with a custom one
that later delegates to the Django one. For example, you could introduce WSGI
middleware here, or combine a Django application with an application of another
framework.

"""
import os
import sys

# Make sure the settings file is found
# http://blog.dscpl.com.au/2010/03/improved-wsgi-script-for-use-with.html
path = os.path.abspath('..')
# trailing slash needed for apache to behave
if not path.endswith(os.path.sep):
    path += os.path.sep
# temp hack as dynamic path was failing under apache
path = '/var/www/favouritequestion.com/favouriteQ/'
sys.path.insert(0, path)

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "favouriteQ.settings")

# This application object is used by any WSGI server configured to use this
# file. This includes Django's development server, if the WSGI_APPLICATION
# setting points here.
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()

# Apply WSGI middleware here.
# from helloworld.wsgi import HelloWorldApplication
# application = HelloWorldApplication(application)
