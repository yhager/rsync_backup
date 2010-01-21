
#!/bin/sh

. /etc/conf.d/backup

if [ -s $PIDFILE ]; then
  PID=$(cat $PIDFILE)
  ps $PID > /dev/null
  if [ $? -eq 0 ]; then
    echo "Backup already running(PID $PID), exiting"
    exit 1
  fi
fi

echo $$ > $PIDFILE

