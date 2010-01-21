#!/bin/sh 

. /etc/conf.d/backup

. $BINDIR/backup_lock.sh

# rotate old backups
${REMOTE_RM} -rf ${DST}/monthly.3
${REMOTE_MV} ${DST}/monthly.{2,3}
${REMOTE_MV} ${DST}/monthly.{1,2}
${REMOTE_MV} ${DST}/monthly.{0,1}
${REMOTE_CP} -al ${DST}/weekly.3 ${DST}/monthly.0

. $BINDIR/backup_unlock.sh
