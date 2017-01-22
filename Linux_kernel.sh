echo 3 > /proc/sys/vm/drop_caches # release cache memory

sysctl [-n] [-e] -p <filename> (default /etc/sysctl.conf) # system kernel setting

more /var/log/dmesg | grep cache # look up cache

lscpu # look up cpu

fdisk -l # look up cap of disk

gcc -dumpspecs # look up which libirary is avaliable

ipcs –q # 只显示消息队列
     –m # 只显示共享内存
     –s # 只显示信号量
