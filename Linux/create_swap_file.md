# [Create swap file](http://linux.freeideas.cz/subdom/linux/create-swap-file/ "Permalink to Create swap file")


If you run Linux on some cloud service you very likely have this instance without swap partition. Because this is the standard setting used on clouds. Reason is simple – swap would quickly degrade SSD disks and majority of people hate swap anyway… :🙂:

But if you run database server on cloud you may already found some “out of memory” errors in your logs and this is the moment when you finally know why you need swap. Since you cannot use dedicated swap partition you have to create swap file. Which is basically disk image on another disk. Here is how to do it. BUT remember that Linux must be restarted at the end. So be sure that you can do it – for example that all of your disks are persistent etc…

1. check situation regarding swap on your machine
   * sudo swapon -s
     * shows you existing swap setting – in our case nothing
   * free
     * shows you memory and swap amount – in our case zeros in line for swap
2. check available space on file systems on your machine
   * df -Th
     * shows you available file systems, their type, usage etc
     * generally – “xfs” file system is not the best choice, for swap file use some “ext*” file system like “ext4”
   * lsblk
     * shows you all physical disks and their partitions – helps you to understand better distribution of your file systems over disks
3. how big swap file will we need?
   * this is a very hard question and no one knows for sure – try these pages:
     * [http://www.cyberciti.biz/tips/linux-swap-space.html](http://www.cyberciti.biz/tips/linux-swap-space.html)
     * [http://askubuntu.com/questions/62073/how-to-decide-on-swap-size](http://askubuntu.com/questions/62073/how-to-decide-on-swap-size)
4. allocate file which will be used as a swap
   * faster way:
     * sudo fallocate -l 1G /mnt/swapfile1gb
   * if fails run this (slower way):
     * sudo dd if=/dev/zero of=/mnt/swapfile1gb bs=1024 count=1048576
       * (you need to calculate size as number of block 1KB big – 1G = 1024MB = 1024*1024 = 1048576 blocks)
5. make file not visiblechown root:
   * root /mnt/swapfile1gb
   * chmod 600 /mnt/swapfile1gb
   * check it:
     * ls -lh /mnt/swapfile1gb
6. format swap file:
   * sudo mkswap /mnt/swapfile1gb
7. add file to the system as a swap file:
   * sudo swapon /mnt/swapfile1gb
8. add this line to the end of /etc/fstab file to make change permanent
   * /mnt/swapfile1gb  none  swap  sw 0  0
9. set swappiness to very low number – add line into /etc/sysctl.conf
   * vm.swappiness=10
     * or use command:
       * sudo sysctl vm.swappiness=10
     * or
       * echo 10 > /proc/sys/vm/swappiness
10. some people recommend to check value of vm.fs_cache_pressure parameter
    * cat /proc/sys/vm/vfs_cache_pressure
      * according to some docs if vm.fs_cache_pressure=100 it is recommended set it to lower value like 50 – but opinions are not 100% getting this way
11. check that swap is ok
    * sudo swapon -s
12. reboot the machine to make changes alive
13. some people also recommend to tune settings:
    vm.overcommit_memory
    vm.overcommit_ratio
