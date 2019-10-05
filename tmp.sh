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


root@4129f2daa9bf:/# ibv_devinfo                               
hca_id: mlx4_0                                                 
        transport:                      InfiniBand (0)         
        fw_ver:                         2.42.5000              
        node_guid:                      f452:1403:0091:ba10    
        sys_image_guid:                 f452:1403:0091:ba13    
        vendor_id:                      0x02c9                 
        vendor_part_id:                 4099                   
        hw_ver:                         0x1                    
        board_id:                       MT_1090110018          
        phys_port_cnt:                  2                      
                port:   1                                      
                        state:                  PORT_ACTIVE (4)
                        max_mtu:                4096 (5)       
                        active_mtu:             4096 (5)       
                        sm_lid:                 12             
                        port_lid:               10             
                        port_lmc:               0x00           
                        link_layer:             InfiniBand     
                                                               
                port:   2                                      
                        state:                  PORT_DOWN (1)  
                        max_mtu:                4096 (5)       
                        active_mtu:             1024 (3)       
                        sm_lid:                 0              
                        port_lid:               0              
                        port_lmc:               0x00           
                        link_layer:             Ethernet       



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
 
 root@4bfed8618b1d:/benchmark/graph500-2.1.4/mpi# ib_write_lat -a --iter 20000 192.168.1.60
---------------------------------------------------------------------------------------
                    RDMA_Write Latency Test
 Dual-port       : OFF          Device         : mlx4_0
 Number of qps   : 1            Transport type : IB
 Connection type : RC           Using SRQ      : OFF
 TX depth        : 1
 Mtu             : 2048[B]
 Link type       : IB
 Max inline data : 220[B]
 rdma_cm QPs     : OFF
 Data ex. method : Ethernet
---------------------------------------------------------------------------------------
 local address: LID 0x03 QPN 0x3352b PSN 0xa7af12 RKey 0x10011b4d VAddr 0x007f10cb874000
 remote address: LID 0x0a QPN 0x2aa37 PSN 0x4a717d RKey 0x780103c1 VAddr 0x007f28fef85000
---------------------------------------------------------------------------------------
 #bytes #iterations    t_min[usec]    t_max[usec]  t_typical[usec]    t_avg[usec]    t_stdev[usec]   99% percentile[usec]   99.9% percentile[usec]
 2       20000          0.88           6.84         0.98               1.03          0.20            1.21                    5.42   
 4       20000          0.88           6.89         0.98               1.03          0.18            1.21                    5.49   
 8       20000          0.89           9.06         0.99               1.04          0.25            1.22                    6.05   
 16      20000          0.89           6.82         0.99               1.04          0.21            1.21                    5.77   
 32      20000          0.93           21.12        1.04               1.10          0.23            1.29                    5.50   
 64      20000          0.97           7.07         1.09               1.11          0.17            1.21                    4.32   
 128     20000          1.07           7.37         1.22               1.24          0.21            1.38                    5.63   
 256     20000          1.69           8.78         1.84               1.86          0.20            2.02                    6.41   
 512     20000          1.89           26.14        2.04               2.07          0.27            2.23                    6.95   
 1024    20000          2.27           8.43         2.42               2.45          0.23            2.60                    7.10   
 2048    20000          3.00           9.36         3.18               3.21          0.28            3.38                    8.29   
 4096    20000          3.56           49.03        3.74               3.80          0.29            4.16                    8.70   
 8192    20000          4.62           11.10        4.82               4.89          0.27            5.24                    9.58   
 16384   20000          6.73           14.85        7.08               7.07          0.36            7.39                    11.91  
 32768   20000          11.06          54.13        11.33              11.37         0.49            12.14                   16.26  
 65536   20000          19.69          69.60        19.97              20.04         0.64            23.79                   25.30  
 131072  20000          36.55          77.12        36.95              37.06         0.77            41.29                   44.42  
 262144  20000          70.43          117.97       71.00              71.17         0.94            75.59                   79.89  
 524288  20000          138.27         183.46       139.16             139.45        1.32            145.69                  148.75 
 1048576 20000          274.19         325.08       275.40             275.84        1.78            283.82                  288.10 
 2097152 20000          545.79         581.15       548.06             548.85        2.64            560.47                  566.56 
 4194304 20000          1089.68        1136.78      1092.97            1094.48       4.05            1110.64                 1119.01
 8388608 20000          2296.01        2345.48      2302.01            2304.98       6.43            2327.01                 2335.48
---------------------------------------------------------------------------------------


root@4bfed8618b1d:/benchmark/graph500-2.1.4/mpi# ib_read_bw -a --iter 50000 192.168.1.60                                  
---------------------------------------------------------------------------------------
                    RDMA_Read BW Test
 Dual-port       : OFF          Device         : mlx4_0
 Number of qps   : 1            Transport type : IB
 Connection type : RC           Using SRQ      : OFF
 TX depth        : 128
 CQ Moderation   : 100
 Mtu             : 2048[B]
 Link type       : IB
 Outstand reads  : 16
 rdma_cm QPs     : OFF
 Data ex. method : Ethernet
---------------------------------------------------------------------------------------
 local address: LID 0x03 QPN 0x33527 PSN 0x6db236 OUT 0x10 RKey 0xf0011b4c VAddr 0x007ff620b13000
 remote address: LID 0x0a QPN 0x2aa33 PSN 0x2b85a8 OUT 0x10 RKey 0x580103c1 VAddr 0x007f45c90b7000
---------------------------------------------------------------------------------------
 #bytes     #iterations    BW peak[MB/sec]    BW average[MB/sec]   MsgRate[Mpps]
 2          50000            0.00               9.08           4.757918
 4          50000            0.00               18.14          4.756009
 8          50000            0.00               36.31          4.758669
 16         50000            0.00               72.56          4.755327
 32         50000            0.00               144.84         4.746110
 64         50000            0.00               290.28         4.756025
 128        50000            0.00               581.26         4.761682
 256        50000            0.00               1162.52        4.761688
 512        50000            0.00               2158.67        4.420964
 1024       50000            0.00               2780.76        2.847496
 2048       50000            0.00               3265.82        1.672101
 4096       50000            0.00               3519.76        0.901060
 8192       50000            0.00               3660.40        0.468531
 16384      50000            0.00               3690.47        0.236190
 32768      50000            0.00               3692.53        0.118161
 65536      50000            0.00               3691.07        0.059057
 131072     50000            0.00               3691.21        0.029530
 262144     50000            0.00               3692.21        0.014769
 524288     50000            0.00               3688.68        0.007377
 1048576    50000            0.00               3667.59        0.003668
 2097152    50000            0.00               3667.02        0.001834
 4194304    50000            0.00               3666.68        0.000917
 8388608    50000            0.00               3666.47        0.000458
---------------------------------------------------------------------------------------

root@4bfed8618b1d:/benchmark/graph500-2.1.4/mpi# ib_read_lat -a --iter 20000 
192.168.1.60                                                                 
---------------------------------------------------------------------------------------
                    RDMA_Read Latency Test
 Dual-port       : OFF          Device         : mlx4_0
 Number of qps   : 1            Transport type : IB
 Connection type : RC           Using SRQ      : OFF
 TX depth        : 1
 Mtu             : 2048[B]
 Link type       : IB
 Outstand reads  : 16
 rdma_cm QPs     : OFF
 Data ex. method : Ethernet
---------------------------------------------------------------------------------------
 local address: LID 0x03 QPN 0x3352c PSN 0x344c7e OUT 0x10 RKey 0x18011b4d VAddr 0x007f5571f70000
 remote address: LID 0x0a QPN 0x2aa38 PSN 0xc278fc OUT 0x10 RKey 0x800103c1 VAddr 0x007fa47aed1000
---------------------------------------------------------------------------------------
 #bytes #iterations    t_min[usec]    t_max[usec]  t_typical[usec]    t_avg[usec]    t_stdev[usec]   99% percentile[usec]   99.9% percentile[usec]
 2       20000          1.91           13.87        1.99               2.01          0.32            2.13                    9.95   
 4       20000          1.92           11.95        1.99               2.01          0.32            2.13                    10.36  
 8       20000          1.92           11.79        1.99               2.01          0.30            2.13                    9.64   
 16      20000          1.93           11.86        1.99               2.01          0.27            2.14                    6.39   
 32      20000          1.93           61.18        2.00               2.02          0.31            2.14                    10.00  
 64      20000          1.95           12.06        2.02               2.04          0.30            2.16                    10.10  
 128     20000          1.99           11.90        2.05               2.07          0.31            2.19                    10.18  
 256     20000          2.07           11.51        2.13               2.14          0.27            2.27                    6.45   
 512     20000          2.25           12.54        2.32               2.34          0.32            2.46                    10.40  
 1024    20000          2.63           12.95        2.70               2.72          0.33            2.85                    10.28  
 2048    20000          3.38           13.54        3.45               3.48          0.37            3.62                    11.80  
 4096    20000          3.92           14.21        4.02               4.06          0.35            4.52                    11.40  
 8192    20000          4.98           16.64        5.08               5.16          0.47            5.57                    14.05  
 16384   20000          7.07           30.90        7.19               7.30          0.49            7.68                    15.67  
 32768   20000          11.23          21.77        11.53              11.57         0.57            11.89                   19.71  
 65536   20000          19.62          57.18        20.00              20.07         0.73            22.43                   28.74  
 131072  20000          36.37          48.59        36.96              37.09         0.95            43.51                   45.76  
 262144  20000          70.07          110.41       70.97              71.13         1.05            77.38                   79.81  
 524288  20000          137.79         207.70       139.01             139.21        1.19            145.65                  148.29 
 1048576 20000          273.30         370.87       275.04             275.30        1.59            282.10                  286.97 
 2097152 20000          544.72         583.48       547.27             547.50        1.48            554.67                  563.32 
 4194304 20000          1088.25        1171.13      1092.42            1092.56       2.05            1099.82                 1110.27
 8388608 20000          2177.92        2240.08      2184.09            2184.33       2.24            2192.22                 2202.42
---------------------------------------------------------------------------------------


root@4bfed8618b1d:/benchmark/graph500-2.1.4/mpi# ib_atomic_bw
 -a --iter 20000 192.168.1.60                                
---------------------------------------------------------------------------------------
                    Atomic FETCH_AND_ADD BW Test
 Dual-port       : OFF          Device         : mlx4_0
 Number of qps   : 1            Transport type : IB
 Connection type : RC           Using SRQ      : OFF
 TX depth        : 128
 CQ Moderation   : 100
 Mtu             : 2048[B]
 Link type       : IB
 Outstand reads  : 16
 rdma_cm QPs     : OFF
 Data ex. method : Ethernet
---------------------------------------------------------------------------------------
 local address: LID 0x03 QPN 0x33528 PSN 0x40ac7f
 remote address: LID 0x0a QPN 0x2aa34 PSN 0xe2ab25
---------------------------------------------------------------------------------------
 #bytes     #iterations    BW peak[MB/sec]    BW average[MB/sec]   MsgRate[Mpps]
Conflicting CPU frequency values detected: 2300.000000 != 2394.296000. CPU Frequency is not max.
 8          20000            18.79              18.67          2.446776
---------------------------------------------------------------------------------------

root@4bfed8618b1d:/benchmark/graph500-2.1.4/mpi# ib_atomic_lat -a --iter 20000 192.168.1
.60
---------------------------------------------------------------------------------------
                    Atomic FETCH_AND_ADD Latency Test
 Dual-port       : OFF          Device         : mlx4_0
 Number of qps   : 1            Transport type : IB
 Connection type : RC           Using SRQ      : OFF
 TX depth        : 1
 Mtu             : 2048[B]
 Link type       : IB
 Outstand reads  : 16
 rdma_cm QPs     : OFF
 Data ex. method : Ethernet
---------------------------------------------------------------------------------------
 local address: LID 0x03 QPN 0x3352d PSN 0xac60c2
 remote address: LID 0x0a QPN 0x2aa39 PSN 0xf859e
---------------------------------------------------------------------------------------
 #bytes #iterations    t_min[usec]    t_max[usec]  t_typical[usec]    t_avg[usec]    t_stdev[usec]   99% percentile[usec]   99.9% percentile[usec]
Conflicting CPU frequency values detected: 2299.921000 != 2397.578000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
 8       20000          2.27           14.36        2.34               2.37            0.31             2.56                    10.20  
---------------------------------------------------------------------------------------


root@4bfed8618b1d:/benchmark/graph500-2.1.4/mpi# ib_send_bw -
a --iter 20000 192.168.1.60                                  
---------------------------------------------------------------------------------------
                    Send BW Test
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
 local address: LID 0x03 QPN 0x33529 PSN 0x92faff
 remote address: LID 0x0a QPN 0x2aa35 PSN 0x5b085a
---------------------------------------------------------------------------------------
 #bytes     #iterations    BW peak[MB/sec]    BW average[MB/sec]   MsgRate[Mpps]
 2          20000            10.17              9.90           5.189724
 4          20000            20.79              19.81          5.192248
 8          20000            41.69              39.67          5.200191
 16         20000            82.70              78.89          5.169836
 32         20000            167.22             164.01         5.374154
 64         20000            333.50             327.86         5.371696
 128        20000            668.87             630.08         5.161640
 256        20000            1284.93            1229.07        5.034283
 512        20000            2563.10            2299.11        4.708583
 1024       20000            3191.34            3039.98        3.112943
 2048       20000            3367.40            3352.00        1.716223
 4096       20000            3517.39            3498.37        0.895582
 8192       20000            3589.46            3576.18        0.457751
 16384      20000            3621.06            3621.04        0.231747
 32768      20000            3643.60            3641.73        0.116535
 65536      20000            3653.52            3653.23        0.058452
 131072     20000            3661.66            3658.80        0.029270
 262144     20000            3660.86            3660.84        0.014643
 524288     20000            3661.63            3661.52        0.007323
 1048576    20000            3663.63            3662.15        0.003662
 2097152    20000            3664.67            3663.52        0.001832
 4194304    20000            3662.89            3662.36        0.000916
 8388608    20000            3662.23            3661.76            0.000458
---------------------------------------------------------------------------------------

root@4bfed8618b1d:/benchmark/graph500-2.1.4/mpi# ib_send_lat -a --iter 20000 192.168.1.6
0
---------------------------------------------------------------------------------------
                    Send Latency Test
 Dual-port       : OFF          Device         : mlx4_0
 Number of qps   : 1            Transport type : IB
 Connection type : RC           Using SRQ      : OFF
 TX depth        : 1
 Mtu             : 2048[B]
 Link type       : IB
 Max inline data : 236[B]
 rdma_cm QPs     : OFF
 Data ex. method : Ethernet
---------------------------------------------------------------------------------------
 local address: LID 0x03 QPN 0x3352e PSN 0x6fc43e
 remote address: LID 0x0a QPN 0x2aa3a PSN 0x3f5ccb
---------------------------------------------------------------------------------------
 #bytes #iterations    t_min[usec]    t_max[usec]  t_typical[usec]    t_avg[usec]    t_stdev[usec]   99% percentile[usec]   99.9% percentile[usec]
Conflicting CPU frequency values detected: 2300.000000 != 2400.000000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2397.265000. CPU Frequency is not max.
 2       20000          1.02           11.76        1.07               1.11            0.30             1.68                    5.00   
Conflicting CPU frequency values detected: 2300.000000 != 2392.421000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2400.000000. CPU Frequency is not max.
 4       20000          1.01           7.29         1.07               1.12            0.33             1.62                    5.80   
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2400.000000. CPU Frequency is not max.
 8       20000          1.03           9.40         1.09               1.12            0.29             1.63                    5.02   
Conflicting CPU frequency values detected: 2299.921000 != 2382.734000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2397.343000. CPU Frequency is not max.
 16      20000          1.03           8.42         1.09               1.13            0.33             1.64                    5.81   
Conflicting CPU frequency values detected: 2299.921000 != 2399.843000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2392.031000. CPU Frequency is not max.
 32      20000          1.05           24.87        1.10               1.15            0.35             1.69                    6.07   
Conflicting CPU frequency values detected: 2299.921000 != 2392.578000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2400.000000. CPU Frequency is not max.
 64      20000          1.11           7.52         1.16               1.21            0.34             1.76                    5.90   
Conflicting CPU frequency values detected: 2300.000000 != 2400.000000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
 128     20000          1.21           10.36        1.27               1.31            0.32             1.80                    5.83   
Conflicting CPU frequency values detected: 2299.921000 != 2397.265000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2392.265000. CPU Frequency is not max.
 256     20000          1.80           9.84         1.86               1.91            0.37             2.52                    6.81   
Conflicting CPU frequency values detected: 2300.000000 != 2399.921000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2300.000000 != 2399.843000. CPU Frequency is not max.
 512     20000          1.98           10.63        2.05               2.10            0.35             2.64                    7.09   
Conflicting CPU frequency values detected: 2299.921000 != 2389.218000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
 1024    20000          2.36           10.64        2.43               2.48            0.36             3.07                    7.47   
Conflicting CPU frequency values detected: 2300.000000 != 2400.000000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2300.000000 != 2394.531000. CPU Frequency is not max.
 2048    20000          3.12           11.05        3.20               3.23            0.27             3.74                    7.13   
Conflicting CPU frequency values detected: 2299.921000 != 2397.343000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
 4096    20000          3.68           17.60        3.77               3.86            0.64             4.48                    15.55  
Conflicting CPU frequency values detected: 2300.000000 != 2397.265000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2400.000000. CPU Frequency is not max.
 8192    20000          4.74           49.72        4.83               4.96            0.69             5.59                    16.63  
Conflicting CPU frequency values detected: 2300.000000 != 2390.390000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2300.000000 != 2392.500000. CPU Frequency is not max.
 16384   20000          6.82           20.70        6.92               7.11            0.70             7.69                    18.74  
Conflicting CPU frequency values detected: 2299.921000 != 2392.578000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
 32768   20000          11.00          59.15        11.63              11.47           0.87             13.84                   22.96  
Conflicting CPU frequency values detected: 2300.000000 != 2392.109000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2389.843000. CPU Frequency is not max.
 65536   20000          19.89          59.97        20.08              20.17           0.77             24.04                   31.27  
Conflicting CPU frequency values detected: 2300.000000 != 2400.000000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2400.000000. CPU Frequency is not max.
 131072  20000          36.76          75.16        37.07              37.21           0.98             41.58                   48.38  
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
 262144  20000          70.63          95.45        71.18              71.39           1.12             76.09                   82.44  
Conflicting CPU frequency values detected: 2300.000000 != 2400.000000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2300.000000 != 2397.109000. CPU Frequency is not max.
 524288  20000          138.31         184.90       139.23             139.59          1.64             147.75                  150.92 
Conflicting CPU frequency values detected: 2299.921000 != 2400.000000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2300.000000 != 2397.265000. CPU Frequency is not max.
 1048576 20000          274.25         319.06       275.47             276.00          1.95             284.72                  289.02 
Conflicting CPU frequency values detected: 2300.000000 != 2400.000000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
 2097152 20000          545.84         607.18       548.37             549.30          3.07             563.01                  569.89 
Conflicting CPU frequency values detected: 2299.921000 != 2397.265000. CPU Frequency is not max.
Conflicting CPU frequency values detected: 2299.921000 != 2399.921000. CPU Frequency is not max.
 4194304 20000          1089.19        1130.07      1092.85            1094.55         4.37             1111.08                 1119.19
Conflicting CPU frequency values detected: 2299.921000 != 2400.000000. CPU Frequency is not max.
 8388608 20000          2239.42        4189.77      2247.02            2252.46         65.03            2287.38                 3761.26
---------------------------------------------------------------------------------------
