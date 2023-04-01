# [HW info in /proc files](http://linux.freeideas.cz/subdom/linux/hw-info-in-proc-files/ "Permalink to HW info in /proc files")


Based on my experiences this is the most reliable way how to find HW info on Linux machine.
There are many good commands which can show you many interesting things but – it happens very often that some or even majority of them are not installed.
But files in /proc directory should be present always.
To see their content we just use “cat” or “less”.

What we can find in /proc directory? Almost everything. Here are just basic facts:

* cpuinfo – detailed info about CPUs
* meminfo – info about memory
* swaps – info about swap filesystems
* uptime – instantly updated file with run time of OS
* version – info about kernel version
