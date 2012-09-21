from fabric.api import env, sudo
from fabric.operations import run
from fabric.context_managers import cd, prefix
import os

PROJECT_NAME = 'favouriteQ'


def production():
    env.hosts = ['54.245.116.229']
    env.user = 'ec2-user'
    env.directory = '/srv/www/www.favouritequestion.com/'
    env.activate = '/home/ec2-user/virtualenv/favouriteQ/env/bin/activate'
    env.git_repo_path = '/srv/www/git_favouriteQ/'
    env.key_filename = ['~/.ssh/django.pem']
    # The name supervisor uses
    env.server_name = 'favourite_q'


def staging():
    env.hosts = ['54.245.116.229']
    env.user = 'ec2-user'
    env.directory = '/srv/www/staging.favouritequestion.com/'
    #TODO: give staging it's own venv (could be created by initialise)
    env.activate = '/home/ec2-user/virtualenv/favouriteQ/env/bin/activate'
    env.git_repo_path = '/srv/www/git_favouriteQ/'
    env.key_filename = ['~/.ssh/django.pem']
    # The name supervisor uses
    env.server_name = 'favourite_q_staging'


def deploy():
    #TODO: add a initialise function which sets the project up fresh
    #TODO: do DB backups here
    #TODO: pip update requirements.txt here
    git_pull()  # could switch branches here
    # could tag the release
    #TODO: research symlinking different versions of the site
    rsync()
    collectstatic()
    #TODO: run the DB migrations (how to stop this using fixtures on live?) test
    #./manage.py migrate projects
    restart_webserver()


def git_pull():
    with cd(env.git_repo_path):
        run('git pull')
    #TODO: also update the config repo (this should be checked out with ssh keys as the GuntOps bit bucket user)


def rsync():
    run('rsync -av --delete --exclude .git* --exclude localsettings.py ' + env.git_repo_path + ' ' + env.directory)


def collectstatic():
    with cd(os.path.join(env.directory, PROJECT_NAME)):
        #TODO research: with prefix('workon myvenv'):
        with prefix('source ' + env.activate):
            run('./manage.py collectstatic --noinput')


def restart_webserver():
    """ Restart Gnunicorn wih Supervisor """
    sudo('supervisorctl restart ' + env.server_name)


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
