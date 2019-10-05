docker run --cap-add=IPC_LOCK --net=host --device=/dev/infiniband/uverbs0 --device=/dev/infiniband/rdma_cm -t -i ubuntu 

    1  ls
    2  touch test
    3  ls
    4  exit
    5  ls
    6  exit
    7  ls
    8  yum install -y libibverbs-utils libibverbs-devel libibverbs-devel-static libmlx4 libmlx5 ibutils libibcm libibcommon libibmad libibumad
    9  yum install -y rdma librdmacm-utils librdmacm
-devel librdmacm libibumad-devel perftest
   10  exit
   11  ib_write_bw
   12  ib_write_bw
   13  ll
   14  ls /etc/
   15  cat /etc/hosts
   16  mkdir benchmark; cd benchmark; curl http://ic
l.cs.utk.edu/projectsfiles/hpcc/download/hpcc-1.5.0.
tar.gz
   17  wget http://icl.cs.utk.edu/projectsfiles/hpcc
/download/hpcc-1.5.0.tar.gz
   18  yum install wget
   19  wget http://icl.cs.utk.edu/projectsfiles/hpcc
/download/hpcc-1.5.0.tar.gz
   20  l
   21  ls
   22  tar zxfv hpcc-1.5.0.tar.gz
   23  ls
   24  wget https://github.com/graph500/graph500/arc
hive/graph500-3.0.0.tar.gz
   25  tar zvxf graph500-3.0.0.tar.gz
   26  ls
   27  cd hpcc-1.5.0
   28  ls
   29  make all
   30  yum install make
   31  make all
   32  make
   33  ls hpl/setup/

make arch=Linux
ls hpl/
ls
cd hpl/
cat README
make
make arch=Linux
ls
cp setup/Make.LinuxIntelIA64Itan2_eccMKL
cp setup/Make.LinuxIntelIA64Itan2_eccMKL
make arch=Linux
make arch=LinuxIntelIA64Itan2_eccMKL
yum install mpicc
yum install mpi
make arch=LinuxIntelIA64Itan2_eccMKL
yum install mpich
make arch=LinuxIntelIA64Itan2_eccMKL
yum install mpich2-devel
yum install mpich2
yum search mpich
yum install mpich3
yum install mpich-3.0
yum install mpich-devel
mpicc
make arch=LinuxIntelIA64Itan2_eccMKL
ll
ls setup/
cp setup/Make.Linux_PII_CBLAS .
make arch=Linux_PII_CBLAS
yum search mpi
yum search openmpi
yum install openmpi
make arch=Linux_PII_CBLAS
make arch=LinuxIntelIA64Itan2_eccMKL
make arch=Linux_PII_CBLAS
yum install libopenmpi
yum  install mvapich2
make arch=Linux_PII_CBLAS
ls setup/
cp setup/Make.Linux_PII_VSIPL .
make arch=Linux_PII_VSIPL
make arch=Linux_PII_CBLAS
cd ..
make arch=Intel
make arch=intel
make arch=Intel
make arch=intel
ls
make arch=Linux_PII_CBLAS
make arch=Linux_PII_CBLAS
mpicc
cc
gcc
yum install openmpi
which mpicc
yum install which
which mpicc
yum install openmpi-devel
which mpicc
lsb_release -a
yum install lsb_release
yum install lsb
lsb_release -a
modinfo
modinfo mpi
yum search mpi
yum install mpich3
yum install mpich-3
yum install mpich-3.0
yum install mpich-3.0-devel
cd ../graph500-
cd ../graph500-graph500-3.0.0/
ls
cd src/
ls
make
find / -name "mpich"
vi ~/.bashrc
vi ~/.bashrc
source ~/.bashrc
history

│root@4129f2daa9bf:/# ibstat                   
│CA 'mlx4_0'                                   
│        CA type: MT4099                       
│        Number of ports: 2                    
│        Firmware version: 2.42.5000           
│        Hardware version: 1                   
│        Node GUID: 0xf45214030091ba10         
│        System image GUID: 0xf45214030091ba13 
│        Port 1:                               
│                State: Active                 
│                Physical state: LinkUp        
│                Rate: 40                      
│                Base lid: 10                  
│                LMC: 0                        
│                SM lid: 12                    
│                Capability mask: 0x02514868   
│                Port GUID: 0xf45214030091ba11 
│                Link layer: InfiniBand        
│        Port 2:                               
│                State: Down                   
│                Physical state: Disabled      
│                Rate: 10                      
│                Base lid: 0                   
│                LMC: 0                        
│                SM lid: 0                     
│                Capability mask: 0x04010000   
│                Port GUID: 0xf65214fffe91ba12 
│                Link layer: Ethernet          



root@4bfed8618b1d:/benchmark/graph500-2.1.4/mpi# ib_write_bw -a --iter 50000 192.168.1.60
---------------------------------------------------------------------------------------
                    RDMA_Write BW Test
 Dual-port       : OFF          Device         : mlx4_0
 Number of qps   : 1            Transport type : IB
 Connection type : RC           Using SRQ      : OFF
 TX depth        : 128
 CQ Moderation   : 100
 Mtu             : 2048[B]
 Link type       : IB
 Max inline data : 0[B]
 rdma_cm QPs     : OFF
 Data ex. method : Ethernet
---------------------------------------------------------------------------------------
 local address: LID 0x03 QPN 0x33431 PSN 0x739436 RKey 0x18011b4c VAddr 0x007f527f589000
 remote address: LID 0x0a QPN 0x2aa31 PSN 0x86204a RKey 0x400103c1 VAddr 0x007f4f444ff000
---------------------------------------------------------------------------------------
 #bytes     #iterations    BW peak[MB/sec]    BW average[MB/sec]   MsgRate[Mpps]
 2          50000            0.00               10.43                5.467546
 4          50000            0.00               20.74                5.437201
 8          50000            0.00               41.68                5.462932
 16         50000            0.00               83.53                5.474490
 32         50000            0.00               166.62               5.459712
 64         50000            0.00               332.85               5.453383
 128        50000            0.00               662.85               5.430062
 256        50000            0.00               1318.94              5.402398
 512        50000            0.00               2607.23              5.339612
 1024       50000            0.00               3405.64              3.487379
 2048       50000            0.00               3542.37              1.813691
 4096       50000            0.00               3608.18              0.923695
 8192       50000            0.00               3636.45              0.465465
 16384      50000            0.00               3650.15              0.233610
 32768      50000            0.00               3653.77              0.116921
 65536      50000            0.00               3658.48              0.058536
 131072     50000            0.00               3660.67              0.029285
 262144     50000            0.00               3661.62              0.014646
 524288     50000            0.00               3662.81              0.007326
 1048576    50000            0.00               3662.96              0.003663
 2097152    50000            0.00               3662.97              0.001831
 4194304    50000            0.00               3662.12              0.000916
 8388608    50000            0.00               3662.02              0.000458

