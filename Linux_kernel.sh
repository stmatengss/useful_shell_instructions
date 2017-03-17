echo 3 > /proc/sys/vm/drop_caches # release cache memory

sysctl [-n] [-e] -p <filename> (default /etc/sysctl.conf) # system kernel setting

more /var/log/dmesg | grep cache # look up cache

lscpu # look up cpu

fdisk -l # look up cap of disk

gcc -dumpspecs # look up which libirary is avaliable

ipcs –q # 只显示消息队列
     –m # 只显示共享内存
     –s # 只显示信号量
     
cat /proc/version # lookup system version

vim /etc/sysctl.conf # change system variant
sysctl -p # make the changes

cat /proc/sys/kernel/* # Linux Kernel Info

ipcrm -m [shm_id] # clear the share memory

ipcs -m # show shared memory / sem array / system queue

nice -n [number] [command] # run program with a speacial priority

kill INT/TERM/KILL/ABRT/BUS/SEGV [pid] # different signal to process

/etc/init.d/network restart # reconfig the profiles

ethtool # query or control network driver and hardware settings

cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_max_freq # check cpu frequence
