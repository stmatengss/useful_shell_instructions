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
