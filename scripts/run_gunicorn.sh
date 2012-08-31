#!/bin/bash
set -e
LOGFILE=/var/log/gunicorn/pollmania.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=3
# user/group to run as
USER=ec2-user
GROUP=ec2-user
#cd /srv/www/arquivo/checkout/website
cd /srv/www/www.favouritequestion.com/favouriteQ/favouriteQ
source /home/ec2-user/virtualenv/favouriteQ/env/bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
exec /home/ec2-user/virtualenv/favouriteQ/env/bin/gunicorn_django -w $NUM_WORKERS \
--user=$USER --group=$GROUP --log-level=debug \
--log-file=$LOGFILE 2>>$LOGFILE
