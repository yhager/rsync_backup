#!/bin/sh 

. /etc/conf.d/backup

. $BINDIR/backup_lock.sh 

# rotate old backups
${REMOTE_RM} -rf ${DST}/hourly.4
${REMOTE_MV} ${DST}/hourly.{3,4}
${REMOTE_MV} ${DST}/hourly.{2,3}
${REMOTE_MV} ${DST}/hourly.{1,2}
${REMOTE_CP} -al ${DST}/hourly.{0,1}


. $BINDIR/backup_unlock.sh 
