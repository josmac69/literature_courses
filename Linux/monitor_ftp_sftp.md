# [Monitor and debug ftp / sftp traffic](http://linux.freeideas.cz/subdom/linux/monitor-and-debug-ftp-sftp-traffic/ "Permalink to Monitor and debug ftp / sftp traffic")


if you have to monitor and/or debug ftp / sftp traffic for problems you can use following commands:

* tail -f /var/log/vsftpd.log
* watch -d -n 1 ‘sudo netstat -tan|grep \:21’
* sudo iftop -B -f “port ftp”

Sources:

* http://www.webhostingtalk.com/showthread.php?t=1615072
