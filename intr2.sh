1、ps -ef | grep firefox | grep -v grep | cut -c 9-15 | xargs kill -s 9

说明：
“grep firefox”的输出结果是，所有含有关键字“firefox”的进程。
“grep -v grep”是在列出的进程中去除含有关键字“grep”的进程。
“cut -c 9-15”是截取输入行的第9个字符到第15个字符，而这正好是进程号PID。
“xargs kill -s 9”中的xargs命令是用来把前面命令的输出结果（PID）作为“kill -s 9”命令的参数，并执行该命令。“kill -s 9”会强行杀掉指定进程。

2、使用pgrep：
grep！pgrep的p表明了这个命令是专门用于进程查询的grep。
查看火狐的PID
$ pgrep firefox
1827

$kill -s 9 1827

#3、使用pkill
pkill＝pgrep+kill
# pkill -9 firefox
#说明："-9" 即发送的信号是9，pkill与kill在这点的差别是：pkill无须 “s”，终止信号等级直接跟在 “-“ 后面。之前我一直以为是 "-s 9"，结果每次运行都无法终止进程。
