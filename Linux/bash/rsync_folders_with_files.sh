#!/bin/bash

for homefolder in /var/ftp/*; do
echo $homefolder
homeuser=$(basename $homefolder)
sudo rsync myremoteuser@myremotemachine:/home/${homeuser}/ $homefolder -avzpogX -e "sudo -u upcload ssh -p 2255"
done
