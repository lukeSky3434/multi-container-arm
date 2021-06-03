#!/bin/bash

CDAY=$(date '+%d%m%y')
FOLDER=backup_grafana_$CDAY
BACKUP_DIR=/home/pi/grafana/data/

echo "mkdir $FOLDER"
/home/pi/Dropbox-Uploader/dropbox_uploader.sh mkdir $FOLDER

echo "uploading file to dropbox"
/home/pi/Dropbox-Uploader/dropbox_uploader.sh upload $BACKUP_DIR* $FOLDER/
echo "done"

