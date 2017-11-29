lspci | grep Mellanox # look up the version of IB.

/etc/init.d/opensmd start # start ib service
service opensmd start
service openibd start

iblinkinfo # look up ib status in the subnet

ibhosts

ibv_devinfo -v  # A strength version tool for getting information about IB

/etc/modprobe.d/mlx4.conf  # configure file for tunning performancce

service irqbalance stop
mlnx_affinity start # use tunning mechinism providing by Mellanox

ofed_info # get the info of whole software stack
ofed_info -s # get version

sudo modprobe ib_uverbs # load uverbs
