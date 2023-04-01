# [IP address in local network](http://linux.freeideas.cz/subdom/linux/ip-address-in-local-network/ "Permalink to IP address in local network")


Although things are not so easy because machine can have more network adapters and therefore multiple “inet addresses”.
But usualy we need to find address of “eth0” adapter to simply connect with remote terminal/ database frontend etc.
Beside of “eth0” we usually see “lo” adapter (localhost loop).

We can try one of these commands:

* ifconfig
  * this command from package “net-tools” is deprecated and in some latest installations of Ubuntu or Debian (mainly on cloud) is not present
* ip a
  * shows all adapters
  * replaces ifconfig command in newest distributions
  * part of the package “iproute2”
* ip -4 a
  * shows only IP4 information
* ip -6 a
  * shows only IP6 information
* ip addr show
* hostname -I
