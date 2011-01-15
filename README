yhager's rsync based backup scripts

  yet another backup script suite, that does exactly what I want.

  * automatic
  * offsite(online)
  * bandwidth and space efficient
  * incremental

  Some more detailed list of the features:

  * use rsync snapshots with hardlinks[1] - a no frills working backup solution:
  * allows going back in time for as long as you want
  * uses the minimal amount of storage space required
  * clear up old backups easily by deleting a directory
  * can retry the backup if the network failed during the process
  * use crontab to control backup initiation
  * simple, simple, simple

  The script more or less implements the method outlined by rsync.net's
  support team[2]  

  [1] http://www.mikerubel.org/computers/rsync_snapshots/
  [2] http://www.rsync.net/resources/howto/rsync_snapshots.html

Installation:
  
  # most of the steps require root privilege
  su 

  # copy this entire directory onto /usr/local/backup
  cp -a . /usr/local/backup  
  cd /usr/local/backup 

  # edit the file conf.d/backup to match your settings
  vi conf.d/backup

  # copy the file to /etc/conf.d
  mkdir /etc/conf.d
  cp conf.d/backup /etc/conf.d/

  # edit the rules file to match your setup
  vi conf.d/rsync-rules

  # copy to /etc/backup
  mkdir /etc/backup
  cp conf.d/rsync-rules /etc/backup/.

  # create a directory for mysql backups
  mkdir -p /var/backups/mysql

  # Add the crontab to your existing crontab
  crontab -l > /tmp/crontab && cat /tmp/crontab crontab | crontab - && rm /tmp/crontab
  # or if your crontab is currently empty, simply
  crontab crontab

Encryption:

  I do not encrypt my backups. I am getting too nervous about losing
  the private key (where would I keep it? in a USB storage? in a bank?
  printed and kept at a friend's house? - I was never able to solve
  that question), so I decided that encryption might give me more
  headache than benefit.

Other options:

  I used rdiff-backup[3] for a while and it is generally very good,
  however, it has it's own format of backup files, and it is very
  dependent on completing a full run everytime, and failures are disastrous.
  
  At one time, the command '--list-increments-sizes' could never be
  completed, and this convinced me I am looking for something less fancy.  

  In addition, removing a huge directory that snuck in by mistake is
  nearly impossible, and you are stuck with it until it is phased out
  as old.

  There are quite a lot of other options, like rsnapshot[4] or
  duplicity[5]. They are all good - choose whatever fits your needs.

  [3] http://rdiff-backup.nongnu.org/
  [4] http://rsnapshot.org
  [5] http://www.nongnu.org/duplicity/

Backup providers:

  All you need is ssh access and rsync to be installed at the remote
  side. This is very common, and I doubt if you will find a backup
  provider that does not give you these.

  I use rsync.net[6], which are very friendly, and give great value
  for the money. However, use any service that rsync works with (I
  believe Amazon s3 is not on this list).

  [6] http://rsync.net

Suggestions, Questions:

  send me an email (see LICENSE file), or use github.

