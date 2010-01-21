#!/bin/sh

. /etc/conf.d/backup

#7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on /var/backups/vdb.7z /var/db/pkg
tar cf - /var/db/pkg | 7za a -si /var/backups/vdb.tar.7z

