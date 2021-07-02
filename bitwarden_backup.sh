#!/bin/bash

#backup all other relevent bitwarden files, excluding any databases
rsync -a /home/user/bitwarden/bw-data /home/user/bw-backup --exclude '*sql*'

#backup the passwords database
sudo sqlite3 /home/user/bitwarden/bw-data/db.sqlite3 ".backup '/home/user/bw-backup/bw-data/db.sqlite3'"

#upload the backup folder using an rclone crypt to nextcloud
rclone copy /home/user/bw-backup secret:

#last backup time
date +"%Y-%m-%d %T" > last_backup_time.txt

