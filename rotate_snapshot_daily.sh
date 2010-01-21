#!/bin/sh

. /etc/conf.d/backup

. $BINDIR/backup_lock.sh

# rotate old backups
${REMOTE_RM} -rf ${DST}/daily.3
${REMOTE_MV} ${DST}/daily.{2,3}
${REMOTE_MV} ${DST}/daily.{1,2}
${REMOTE_MV} ${DST}/daily.{0,1}
${REMOTE_CP} -al ${DST}/hourly.4 ${DST}/daily.0

. $BINDIR/backup_unlock.sh
