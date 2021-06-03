#!/bin/bash

CDAY=$(date '+%d%m%y')
FOLDER=backup_influx_$CDAY
BACKUP_DIR=/home/pi/influxdb/backup/

echo "mkdir $FOLDER"
/home/pi/Dropbox-Uploader/dropbox_uploader.sh mkdir $FOLDER

rm -rf $BACKUP_DIR*

sudo docker exec influx influxd backup -portable -database home /backup

sudo chmod 666 $BACKUP_DIR* 

echo "uploading files to dropbox"
/home/pi/Dropbox-Uploader/dropbox_uploader.sh upload $BACKUP_DIR* $FOLDER/
echo "done"

