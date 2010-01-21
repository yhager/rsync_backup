#!/bin/sh 

. /etc/conf.d/backup

. $BINDIR/backup_lock.sh

# rotate old backups
${REMOTE_RM} -rf ${DST}/weekly.3
${REMOTE_MV} ${DST}/weekly.{2,3}
${REMOTE_MV} ${DST}/weekly.{1,2}
${REMOTE_MV} ${DST}/weekly.{0,1}
${REMOTE_CP} -al ${DST}/daily.3 ${DST}/weekly.0

. $BINDIR/backup_unlock.sh
