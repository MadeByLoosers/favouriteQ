#import os
from fabric.api import env, sudo, local
from fabric.operations import put, run
from fabric.context_managers import cd
#from settings import PROJECT_ROOT

GIT_REPO_PATH = '/srv/www/git_favouriteQ'
PRODUCTION_PATH = '/srv/www/www.favouritequestion.com'
STAGING_PATH = '/srv/www/staging.favouritequestion.com'


def production():
    env.hosts = ['54.245.116.229']
    env.user = 'ec2-user'
    env.directory = '/srv/www/www.favouritequestion.com'
    env.activate = 'source /home/ec2-user/virtualenv/favouriteQ/env/bin/activate'
    env.key_filename = ['~/.ssh/django.pem']


def staging():
    env.hosts = ['54.245.116.229']
    env.user = 'ec2-user'
    env.directory = '/srv/www/staging.favouritequestion.com'
    env.activate = 'source /home/ec2-user/virtualenv/favouriteQ/env/bin/activate'
    env.key_filename = ['~/.ssh/django.pem']


def local():
    "Use the local virtual server"
    config.hosts = ['127.0.0.1']
    config.path = '/path/to/project_name'
    config.user = 'garethr'
    config.virtualhost_path = "/"


def mkfile():
    run("touch pxg_fabric_test.txt")


def deploy():
    # 1. activate virtual env? Is this neeeded? Done in server setup?

    # 2. Pull from Git
    with cd(GIT_REPO_PATH):
        run('git pull')

    # 3. run rsync script
    #require('fab_hosts', provided_by=[production])

    #rsync -av --delete --exclude .git* --exclude localsettings.py /srv/www/git_favouriteQ/ /srv/www/www.favouritequestion.com/

    # 4. run the DB migrations (how to stop this using fixtures on live?)
    # ./manage.py migrate projects

    # 5. collect the static files
    # python /srv/www/www.favouritequestion.com/favouriteQ/manage.py collectstatic --noinput

    # 6. Restart server
    restart_webserver()


def restart_webserver():
    """ Restart Gnunicorn wih Supervisor """
    #TODO: move name off the app to a variable
    sudo("supervisorctl restart favourite_q")


def git_pull():
    """Updates the repository."""
    with cd(env.directory):

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