#!/bin/sh

. /etc/conf.d/backup

${REMOTE_DU} -csh ${DST}/{hourly,daily,weekly,monthly}.*
