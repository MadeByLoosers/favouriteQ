#! /usr/bin/python
import commands

cmd = "rsync -av --delete --exclude .git* /srv/www/git_favouriteQ/ /srv/www/www.favouritequestion.com/"
print cmd
(status, output) = commands.getstatusoutput(cmd)
if status:    ## Error case, print the command's output to stderr and exit
    sys.stderr.write(output)
    sys.exit(1)
print output  ## Otherwise do something with the command's output
