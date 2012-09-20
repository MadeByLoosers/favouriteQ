#import os
from fabric.api import env, sudo, local
from fabric.operations import put, run
from fabric.context_managers import cd, prefix

#TODO: move to environments (may be different for QA, staging, production
GIT_REPO_PATH = '/srv/www/git_favouriteQ/'


def production():
    env.hosts = ['54.245.116.229']
    env.user = 'ec2-user'
    env.directory = '/srv/www/www.favouritequestion.com/'
    env.activate = 'source /home/ec2-user/virtualenv/favouriteQ/env/bin/activate/'
    env.key_filename = ['~/.ssh/django.pem']


def staging():
    env.hosts = ['54.245.116.229']
    env.user = 'ec2-user'
    env.directory = '/srv/www/staging.favouritequestion.com/'
    #TODO: give staging it's own venv
    env.activate = 'source /home/ec2-user/virtualenv/favouriteQ/env/bin/activate/'
    env.key_filename = ['~/.ssh/django.pem']


def local():
    "Use the local virtual server (not currently used)"
    env.hosts = ['127.0.0.1']
    env.path = '/path/to/project_name'
    env.user = 'garethr'
    env.virtualhost_path = "/"


def deploy():
    # 1. activate virtual env? Is this neeeded? Done in server setup?

    # 2. Pull from Git
    git_pull()

    # 3. run rsync script
    rsync_files()
    # TODO: research symlinking different versions of the site

    # 4. run the DB migrations (how to stop this using fixtures on live?)
    # ./manage.py migrate projects

    # 5. collect the static files
    # with prefix('workon ' + env.activate):
    #     run('which python')
    #with cd(env.directory):
    #run('./manage.py collectstatic --noinput

    # 6. Restart server
    restart_webserver()


def git_pull():
    with cd(GIT_REPO_PATH):
        run('git pull')


def rsync_files():
    run('rsync -av --delete --exclude .git* --exclude localsettings.py ' + GIT_REPO_PATH + ' ' + env.directory)


def collect_static():
    #TODO: use os.path.join(,,,
    manage_py_path = env.directory + 'favouriteQ/manage.py'
    with prefix('source /home/ec2-user/virtualenv/favouriteQ/env/bin/activate'):
        run(manage_py_path)
    #run('/srv/www/staging.favouritequestion.com/favouriteQ/manage.py collectstatic --noinput')


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
