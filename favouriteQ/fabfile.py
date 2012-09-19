#import os
from fabric.api import env, sudo, local
from fabric.operations import put, run
from fabric.context_managers import cd
#from settings import PROJECT_ROOT

SERVER_PATH = '/var/www/pricedag'


def server():
    env.hosts = ['54.245.116.229']
    env.user = 'ec2-user'
    env.key_filename = ['~/.ssh/django.pem']


def mkfile():
    run("touch pxg_fabric_test.txt")


# def restart_webserver():
#     """ Restart NGINX & UWSGI
#     """
#     sudo("stop uwsgi-pricedag")
#     sudo("start uwsgi-pricedag")


# def syncdb():
#     with cd(SERVER_PATH):
#         run('python manage.py syncdb')


# def deploy():
#     # Remove all .pyc files
#     local("find . -name \*.pyc -delete")
#     local("tar -czvf /tmp/pricedag.tar.gz * --exclude=database.db \
#                                             --exclude=fabfile.py \
#                                             --exclude=.project \
#                                             --exclude=.pydevproject")

#     put("/tmp/pricedag.tar.gz", "/tmp/")
#     run("rm -rf %s %s" % SERVER_PATH)
#     run("mkdir -p %s" % SERVER_PATH)
#     run("tar -zxvf /tmp/pricedag.tar.gz -C %s" % SERVER_PATH)
#     run("tar -zxvf /tmp/pricedag.tar.gz -C %s" % SERVER_PATH)
#     restart_webserver()
#     syncdb()


# def git_pull():
#     "Updates the repository."
#     run("cd ~/git/$(repo)/; git pull $(parent) $(branch)")


# def git_reset():
#     "Resets the repository to specified version."
#     run("cd ~/git/$(repo)/; git reset --hard $(hash)")


# def production():
#     config.fab_hosts = ['a.example.com','b.example.com']
#     config.repos = (('project','origin','master'),
#                     ('app','origin','master'))
