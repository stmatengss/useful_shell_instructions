lspci | grep Mellanox # look up the version of IB.

/etc/init.d/opensmd start # start ib service
service opensmd start
service openibd start

iblinkinfo # look up ib status in the subnet

ibv_devinfo -v  # A strength version tool for getting information about IB

/etc/modprobe.d/mlx4.conf  # configure file for tunning performancce

service irqbalance stop
mlnx_affinity start # use tunning mechinism providing by Mellanox

ofed_info # get the info of whole software stack
ofed_info -s # get version

sudo modprobe ib_uverbs # load uverbs

ibhosts # Get all node informations

ib_write_bw -Q 64 --size=32 --iters=100000 # Measure cqe

ibdev2netdev # Look up network connections

ib2ib_setup # Set up sub network

sudo ibcheckstate # Check sub network status

mount -o ro,loop MLNX_OFED_LINUX-<ver>-<OS label>.iso /mnt # Install OFED ISO

hca_self_test.ofed # Harware detector

sudo mstflint -d 42:00.0 query # show device

apt-get install dkms infiniband-diags libibverbs* ibacm librdmacm* libmlx4* libmlx5* mstflint libibcm.* libibmad.* libibumad* opensm srptools libmlx4-dev librdmacm-dev rdmacm-utils ibverbs-utils perftest vlan ibutils
# Install package 
./mlnxofedinstall --without-dkms --add-kernel-support --kernel 3.13.0-85-generic --without-fw-update --force

ib_write_bw --ib-dev=mlx5_0 -s 32 --run_infinitely -I 0 --qp=16 --cq-mod=1024 --post_list=64 # Gain Maximum Performance 

ib_write_bw --ib-dev=mlx5_0 -s 32 --run_infinitely -I 0 --qp=16 --cq-mod=1024 --post_list=64 -O -i xxx -p xxx # More parameters (support dual port)

ucx_perftest teaker-11 -t tag_lat -c 0 -s 4096 -T 4

ibdump # Monitor RDMA

show_gids

ib_uverbs
ib_umad  
ib_sa    
ib_mad   
ib_core  
ib_addr  

# RDMA stack modules
sudo modprobe rdma_cm
sudo modprobe ib_uverbs
sudo modprobe rdma_ucm
sudo modprobe ib_ucm
sudo modprobe ib_umad
sudo modprobe ib_ipoib
# RDMA devices low-level drivers
sudo modprobe mlx4_ib
sudo modprobe mlx4_en
sudo modprobe iw_cxgb3
sudo modprobe iw_cxgb4
sudo modprobe iw_nes
sudo modprobe iw_c2

mlnx_tune # A useful tool to maxmize performance

ethtool -S ib0 # statistic

# ibdev2netdev => ifconfig xxx up

mst start
mst status -v

# Limit Bandwidth
tc qdisc add dev eth0 root netem rate 100Mbit
ethtool -s em1 speed 100 duplex full autoneg off/on
sudo ibportstate 1 1 width 1

watch -n 1 'ethtool -S eth1 | grep bytes_phy'

sockperf ping-pong # test lat
