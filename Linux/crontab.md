# [crontab – useful hints, commands and small scripts](http://linux.freeideas.cz/subdom/linux/crontab-useful-hints-commands-and-small-scripts/ "Permalink to crontab – useful hints, commands and small scripts")

* to see cron jobs for all users:

```
for user in $(cut -f1 -d: /etc/passwd); do echo ""; echo "$user"; echo "--------------------"; sudo crontab -u $user -l; done
```

* Ubuntu specific approach:

```
v=/var/spool/cron/crontabs; for f in $(sudo ls $v); do echo ""; echo $f; echo "-------------------------"; sudo cat $v/$f; done
```

* show currently running cron processes:
  * using tree of processes:

```
ps -ejHf|grep -A20 -i "cron$"
```

– adjust number of lines after “-A” switch to see what you need

* using crontab for given user + list of processes:

```
ps -ef|grep -F "$(sudo crontab -u ...here_your_username... -l|grep -v '#'|tr -s ' '|cut -d' ' -f6-99)"
```

opposite problem – show running scripts which are not cron jobs.

using crontab for all users + list of processes:

```
ps -ef|grep -v "sshd\|-zsh\|sftp-server"|grep -i "sh\|coffee"|grep -F "(for user in (foruserin(cut -f1 -d: /etc/passwd); do sudo crontab -u $user -l 2>/dev/null|grep -v '#'; done|tr -s ' '|cut -d' ' -f6-99)" -v
```

– adjust excluded processes in 2 part of pipe and included processes in 3 part of pipe to your needs
