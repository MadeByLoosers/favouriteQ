from fabric.api import env, sudo, local
from fabric.operations import run
from fabric.context_managers import cd, prefix
import os

PROJECT_NAME = 'favouriteQ'
#TODO: move to environments (may be different for QA, staging, production


def production():
    env.hosts = ['54.245.116.229']
    env.user = 'ec2-user'
    env.directory = '/srv/www/www.favouritequestion.com/'
    env.activate = '/home/ec2-user/virtualenv/favouriteQ/env/bin/activate'
    env.git_repo_path = '/srv/www/git_favouriteQ/'
    env.key_filename = ['~/.ssh/django.pem']


def staging():
    env.hosts = ['54.245.116.229']
    env.user = 'ec2-user'
    env.directory = '/srv/www/staging.favouritequestion.com/'
    #TODO: give staging it's own venv
    env.activate = '/home/ec2-user/virtualenv/favouriteQ/env/bin/activate'
    env.git_repo_path = '/srv/www/git_favouriteQ/'
    env.key_filename = ['~/.ssh/django.pem']


def deploy():
    git_pull()
    # TODO: research symlinking different versions of the site
    rsync_files()
    collect_static()
    # 4. run the DB migrations (how to stop this using fixtures on live?)
    # 5. ./manage.py migrate projects

    # 5. collect the static files
    # with prefix('workon ' + env.activate):
    #     run('which python')
    #with cd(env.directory):
    #run('./manage.py collectstatic --noinput
    restart_webserver()


def git_pull():
    with cd(env.git_repo_path):
        run('git pull')


def rsync_files():
    run('rsync -av --delete --exclude .git* --exclude localsettings.py ' + env.git_repo_path + ' ' + env.directory)


def collect_static():
    manage_py_path = os.path.join(env.directory, PROJECT_NAME, 'manage.py')
    with prefix('source ' + env.activate):
        run(manage_py_path)
    # collectstatic --noinput'


def restart_webserver():
    """ Restart Gnunicorn wih Supervisor """
    #TODO: move name off the app to a variable
    sudo("supervisorctl restart favourite_q")


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
