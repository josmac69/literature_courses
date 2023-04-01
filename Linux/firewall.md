# [Ubuntu – how to find out if some firewall is running](http://linux.freeideas.cz/subdom/linux/ubuntu-how-to-find-out-if-some-firewall-is-running/ "Permalink to Ubuntu – how to find out if some firewall is running")


iptables +front-end “guarddog”:

* service iptables status
  * sudo iptables -L – shows active iptables rules
  * dpkg -l | grep iptables – check installed packages

ufw (Ubuntu-firewall) + gui “gufw”:

* service ufw status
  * sudo ufw status – checks if ubuntu-firewall is running
  * sudo ufw disable / enable
  * basic usage:
    * sudo ufw allow ssh
    * sudo ufw allow 4444/tcp
