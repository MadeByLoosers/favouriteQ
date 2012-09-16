#! /usr/bin/python
import commands
import sys

(status, output) = commands.getstatusoutput('git pull')
print output

cmd = "rsync -av --delete --exclude .git* --exclude localsettings.py /srv/www/git_favouriteQ/ /srv/www/www.favouritequestion.com/"
print cmd
(status, output) = commands.getstatusoutput(cmd)
if status:    # Error case, print the command's output to stderr and exit
    sys.stderr.write(output)
    sys.exit(1)
print output  # Otherwise do something with the command's output

(status, output) = commands.getstatusoutput('python /srv/www/www.favouritequestion.com/favouriteQ/manage.py collectstatic --noinput')
print output
