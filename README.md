# Vaultwarden backup using rclone and crypt

Here is how I backup my docker vaultwarden instance using rclone. 

You can do this using rclone and crypt to encrypt the data, please replace all paths that are relevant to you and make sure you set up rclone using your own cloud provider. For reference I use WebDav on nextcloud. 


https://rclone.org/webdav/

https://rclone.org/crypt/

## Commands 

Backup all relevent bitwarden files, excluding the database
```bash 
rsync -a /home/user/bitwarden/bw-data /home/user/bw-backup --exclude '*sql*'
```

Backup the passwords database
```bash 
sudo sqlite3 /home/user/bitwarden/bw-data/db.sqlite3 ".backup '/home/user/bw-backup/bw-data/db.sqlite3'"
```

Upload the backup folder using an rclone crypt to storage provider
```bash 
rclone copy /home/user/bw-backup secret:
```

Download and decrypt to local machine for manual restore 
```bash 
sudo rclone sync secret:bw-data /home/user/bw-backup/bw-data
```
