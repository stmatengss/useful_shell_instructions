echo 3 > /proc/sys/vm/drop_caches # release cache memory

sysctl [-n] [-e] -p <filename> (default /etc/sysctl.conf) # system kernel setting

more /var/log/dmesg | grep cache
