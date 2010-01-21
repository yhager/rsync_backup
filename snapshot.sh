#!/bin/sh

BINDIR=$(dirname $0)

run() {
  echo -n "$2"
	$BINDIR/$1
	RET=$?
	if [ $RET -eq 0 ]; then
	  echo "		[ok]"
	else
	  echo "		[error]"
	fi
	return $RET
}

run mysql_backup.sh "MySQL local backup"
run vdb_backup.sh "VDB backup"
run rotate_snapshot_hourly.sh "Rotating snapshots" 
run make_snapshot.sh "Sync with remote server"
run check_quota.sh "Check quota"
