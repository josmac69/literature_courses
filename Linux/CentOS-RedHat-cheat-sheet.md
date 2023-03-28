# [CentOS/ RedHat – basic administration commands and checks](http://linux.freeideas.cz/subdom/linux/centos-redhat-basic-administration-commands-and-checks/ "Permalink to CentOS/ RedHat – basic administration commands and checks")


* check if updates are available: `yum check-update`
* update packages: `su -c 'yum update'`
  (does not force remove of old packages)
* `yum upgrade`
  (forces removal of old packages – can be dangerous)
  the same like: `yum update --obsoletes`
* install package: `yum install packagename`
* install package using local file: `yum localinstall packagename`
* check [last yum updates](https://unix.stackexchange.com/questions/224627/find-last-time-yum-update-was-run): `cat /var/log/yum.log | grep Updated: | tail -5`
* clean downloaded packages:
  * clean cached packages: yum clean packages
  * clean headers: yum clean headers
  * clean all: yum clean all
* if yum update will not finish properly you can try: yum-complete-transaction –cleanup-only
  + yum history redo last
