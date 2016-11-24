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
