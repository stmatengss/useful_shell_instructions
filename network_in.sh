ifconfig eth0 ip up # up NIC
cat /proc/devices
cat /proc/version # lookup linux version
route add default gw [GateWay] # add GateIp
route -n # show the route table
iperf # a C/S-based network measurement tool

sar -n DEV 1 #Device TX/RX
