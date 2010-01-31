#!/bin/sh 

. /etc/conf.d/backup

. $BINDIR/backup_lock.sh

# make sure the destination directory exists
${REMOTE_MKDIR} -p ${DST}

#LINKDEST="--link-dest ../hourly.1"
TIMES=3


# do the backup itself (run a few times, since failing here kills the chain)
for i in `seq 1 $TIMES`; do
  ${RSYNC} ${RSYNCOPTS} --filter="merge $RULES" ${LINKDEST} ${SRC} ${REMOTE}:${DST}/hourly.0
done
${REMOTE_TOUCH} $DST/hourly.0

. $BINDIR/backup_unlock.sh
