mutt #
sendmail
postfix

echo ""|mail -s "" someone@some

who #lookup someone's tty id

wall "" #send message to someone else.

# tmp pip
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package

alternatives --install /usr/bin/java  java  /usr/java/jre1.6.0_21/bin/java  400

:w !sudo tee % # vim save by root

g++ -fopenmp ** #using OpenMP

time instruction #recording running time

find -name 'mpich' -type d #find dir

#1: 定位光标
#2: CTRL+v              #进入Visual Mode。
#3: j                 #选择要在哪些行加入？！
#4: I                 #一定是大写！
#5: 输入要插入的文本
#6: ESC 

find / -mtime 0 | grep xxxx

g++ -w file # inherbit warning

strings /usr/lib/libstdc++.so.6 | grep GLIBCXX  # you can see the version of your libarary

1.gcc版本
gcc -v 
cat /proc/version
2.查看内核版本
uname -a 
3.查看操作系统版本号]
lsb_release -a

aptitude # serach version

ar rcs  libxxx.a xx1.o xx2.o
ar x a.a
objdump -S obj

apt-get -f install
dpkg -l | grep -i 'xxxx'

aptitude search boost
apt-cache  showpkg libboost-all-dev

cloc # a very useful tool to calculate lines number of your code

netstate -atunlp
# -a all -t tcp -u udp -n port -l listening -p pid

ssh -p port -f -N -D 127.0.0.1:port  User@IP

du -b # bytes

df -f -ih # watcher of disk

sudo rm -vf /var/lib/apt/lists/* # solve the issue 'can't merge'
sudo apt-get update

lsmod | grep "xxx" # lookup the working state of linux kernel modules.

sudo apt-get -y --force-yes install # assure the alert automatically when installing the software

taskset # A tool for indicating a core to a thread

pgrep # find pid number through the pid name 

chown mail:mail log2012.log # change the previlge of somone

: '
# comment
'

cp -rf `ls srcdir | grep -E -v "^(exclude_file|exclude_dir)$"` destdir/  # cp exclusive some files

sudo visudo
Defaults env_reset , timestamp_timeout=x # change timeout value of the sudo previldge
