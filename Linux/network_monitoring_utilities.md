# [Network monitoring utilities](http://linux.freeideas.cz/subdom/linux/network-monitoring-utilities/ "Permalink to Network monitoring utilities")


These commands must run usually as root or under sudo.

* netstat
* netstat -antupwe
  * shows incoming and outgoing IPs
* iftop
* shows in real time communication between local machine and remote machines – useful to monitor bandwidth between specific machines
* shows IPa
* nload – show incomming and outgoing traffic as sum – min. max, avg speed – shows overall statistics in very simple way
* iptraf – colorful full screen monitor of network traffic on packet level
* nethogs
  * shows bandwidth on process level – you can see in detail how many traffic each process really sends and receives
  * press `m` to switch to the cumulative mode
  * does not show IPs
* dstat – shows also network bandwidth as receive / send values

Test bandwidth between 2 machines:

* start iperf server on first: iperf -s
* start iperf client on second: iperf -c ip_address
  * -i x … for different interval then 1 second
  * -t x … for different total time of testing then 10 second
  * -d … bidirectional testing together
  * -r … split reverse testings to two parts

traceroute

* install nmap and zenmap and run zenmap as superuser
  * zenmap is user friendly GUI for nmap
  * can show you also trace route map
