# [Check what is process doing](http://linux.freeideas.cz/subdom/linux/check-what-process-is-doing/ "Permalink to Check what process is doing")


* sudo strace -p xxx
* sudo ltrace -p xxx
* sudo iotop p xxx
* top -c -p xxx
* gdb -batch -ex bt -p xxx
* sudo gdb
  * (gdb) attach xxx
  * (gdb) bt
* sudo perf top
* pstree -spga
