#!/bin/bash
##########################################################################
#
# mysql_backups.sh: A shell script to back up all MySQL databases in
#                   one shot, nightly, and keep a rolling 3 weeks of
#                   backups hot, online in the backup archive.
#
# Written by: David A. Desrosiers
# Contact: desrod@gnu-designs.com
# Last updated: Mon Feb 12 14:08:33 EST 2007
#
# Copyright 1998-2007.  This may be modified and distributed on the same
#                       terms as the GPL itself. This copyright header
#                       must remain intact if you use this script.
#
##########################################################################

#####################################
### MySQL Configuration Variables ###
#####################################

. /etc/conf.d/backup

# Local directory for dump files
MYSQL_BACKUP_DIR=/var/backups/mysql/

#####################################
### Edit Below If Necessary ######### 
#####################################
cd $MYSQL_BACKUP_DIR
DATE=`eval date +%Y-%m-%d`
NOW=`date +'%Y-%m-%d.%H:%M:%S'`

# Optimize the table structure nightly
#mysqlcheck -u$DBUSER -p$DBPASSWD -h$DBHOST -oA

DBS=`mysql -u$DB_USER -p$DB_PASS -h$DB_HOST -e"show databases"`

for DATABASE in $DBS
do
        if [ $DATABASE != "Database" ]; then
                echo "Dumping $DATABASE now..."
								#BASE=${DATE}.${DATABASE}
								BASE=${DATABASE}
                ${MYSQLDUMP} -u$DB_USER -p$DB_PASS -h$DB_HOST --lock-tables --add-drop-table --skip-dump-date -e $DATABASE > ${BASE}.sql

                ${BZIP2} -f9 ${BASE}.sql
                chmod 0400 ${BASE}.sql.bz2
                #7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on ${BASE}.7z ${BASE}.sql && rm ${BASE}.sql
                #chmod 0400 ${BASE}.7z

        fi
done

# Delete files older than 21 days
for i in `find $MYSQL_BACKUP_DIR -mtime +21|sort`; do (rm $i); done;

exit 0
