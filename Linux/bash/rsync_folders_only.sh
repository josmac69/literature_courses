#!/bin/bash

for ftpfolder in /var/ftp/*; do
echo $ftpfolder
ftpuser=$(basename $ftpfolder)
sudo rsync upcload@107.170.182.82:/home/${ftpuser}/ $ftpfolder -avzpogX -e "sudo -u upcload ssh -p 2255" -f"+ */" -f"- *"
done
