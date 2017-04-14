内核的 shmall 和 shmmax 参数
SHMMAX= 配置了最大的内存segment的大小 ------>这个设置的比SGA_MAX_SIZE大比较好。

SHMMIN= 最小的内存segment的大小

SHMMNI= 整个系统的内存segment的总个数

SHMSEG= 每个进程可以使用的内存segment的最大个数

配置信号灯（ semphore ）的参数：

SEMMSL= 每个semphore set里面的semphore数量 -----> 这个设置大于你的process的个数吧，否则你不得不分多个semphore set，好像有process+n之说，我忘了n是几了。

SEMMNI= 整个系统的semphore set总数

SEMMNS=整个系统的semphore总数


shmall 是全部允许使用的共享内存大小，shmmax 是单个段允许使用的大小。这两个可以设置为内存的 90%。例如 16G 内存，16*1024*1024*1024*90% = 15461882265，shmall 的大小为 15461882265/4k(getconf PAGESIZE可得到) = 3774873。
修改 /etc/sysctl.conf

kernel.shmmax=15461882265

kernel.shmall=3774873

kernel.msgmax=65535

kernel.msgmnb=65535

执行 sudo sysctl -p

可以使用 ipcs -l 看结果。ipcs -u 可以看到实际使用的情况

## linux 内存管理
 
一、前言
本文档针对OOP8生产环境，具体优化策略需要根据实际情况进行调整；本文档将在以下几个方面来阐述如何针对RedHat Enterprise Linux进行性能优化。
1)     Linux Proc文件系统，通过对Proc文件系统进行调整，达到性能优化的目的。
2)     Linux性能诊断工具，介绍如何使用Linux自带的诊断工具进行性能诊断。
加粗斜体表示可以直接运行的命令。
下划线表示文件的内容。
二、/proc/sys/kernel/优化
1)     /proc/sys/kernel/ctrl-alt-del
该文件有一个二进制值，该值控制系统在接收到ctrl+alt+delete按键组合时如何反应。这两个值分别是：
零（0）值，表示捕获ctrl+alt+delete，并将其送至 init 程序；这将允许系统可以安全地关闭和重启，就好象输入shutdown命令一样。
壹（1）值，表示不捕获ctrl+alt+delete，将执行非正常的关闭，就好象直接关闭电源一样。

缺省设置：0
建议设置：1，防止意外按下ctrl+alt+delete导致系统非正常重启。
2)     proc/sys/kernel/msgmax
该文件指定了从一个进程发送到另一个进程的消息的最大长度（bytes）。进程间的消息传递是在内核的内存中进行的，不会交换到磁盘上，所以如果增加该值，则将增加操作系统所使用的内存数量。

缺省设置：8192
3)     /proc/sys/kernel/msgmnb
该文件指定一个消息队列的最大长度（bytes）。

缺省设置：16384
4)     /proc/sys/kernel/msgmni
该文件指定消息队列标识的最大数目，即系统范围内最大多少个消息队列。

缺省设置：16
5)     /proc/sys/kernel/panic
该文件表示如果发生“内核严重错误（kernel panic）”，则内核在重新引导之前等待的时间（以秒为单位）。
零（0）秒，表示在发生内核严重错误时将禁止自动重新引导。

缺省设置：0
6)     proc/sys/kernel/shmall
该文件表示在任何给定时刻，系统上可以使用的共享内存的总量（bytes）。

缺省设置：2097152
7)     /proc/sys/kernel/shmmax
该文件表示内核所允许的最大共享内存段的大小（bytes）。

缺省设置：33554432
建议设置：物理内存 * 50%

实际可用最大共享内存段大小=shmmax * 98%，其中大约2%用于共享内存结构。
可以通过设置shmmax，然后执行ipcs -l来验证。
8)     /proc/sys/kernel/shmmni
该文件表示用于整个系统的共享内存段的最大数目（个）。

缺省设置：4096
9)     /proc/sys/kernel/threads-max
该文件表示内核所能使用的线程的最大数目。

缺省设置：2048
10) /proc/sys/kernel/sem
该文件用于控制内核信号量，信号量是System VIPC用于进程间通讯的方法。

建议设置：250 32000 100 128
第一列，表示每个信号集中的最大信号量数目。
第二列，表示系统范围内的最大信号量总数目。
第三列，表示每个信号发生时的最大系统操作数目。
第四列，表示系统范围内的最大信号集总数目。
所以，（第一列）*（第四列）=（第二列）

以上设置，可以通过执行ipcs -l来验证。
11) 待续。。。
三、/proc/sys/vm/优化
1)     /proc/sys/vm/block_dump
该文件表示是否打开Block Debug模式，用于记录所有的读写及Dirty Block写回动作。

缺省设置：0，禁用Block Debug模式
2)     /proc/sys/vm/dirty_background_ratio
该文件表示脏数据到达系统整体内存的百分比，此时触发pdflush进程把脏数据写回磁盘。

缺省设置：10
3)     /proc/sys/vm/dirty_expire_centisecs
该文件表示如果脏数据在内存中驻留时间超过该值，pdflush进程在下一次将把这些数据写回磁盘。

缺省设置：3000（1/100秒）
4)     /proc/sys/vm/dirty_ratio
该文件表示如果进程产生的脏数据到达系统整体内存的百分比，此时进程自行把脏数据写回磁盘。

缺省设置：40
5)     /proc/sys/vm/dirty_writeback_centisecs
该文件表示pdflush进程周期性间隔多久把脏数据写回磁盘。

缺省设置：500（1/100秒）
6)     /proc/sys/vm/vfs_cache_pressure
该文件表示内核回收用于directory和inode cache内存的倾向；缺省值100表示内核将根据pagecache和swapcache，把directory和inode cache保持在一个合理的百分比；降低该值低于100，将导致内核倾向于保留directory和inode cache；增加该值超过100，将导致内核倾向于回收directory和inode cache。

缺省设置：100
7)     /proc/sys/vm/min_free_kbytes
该文件表示强制Linux VM最低保留多少空闲内存（Kbytes）。

缺省设置：724（512M物理内存）
8)     /proc/sys/vm/nr_pdflush_threads
该文件表示当前正在运行的pdflush进程数量，在I/O负载高的情况下，内核会自动增加更多的pdflush进程。

缺省设置：2（只读）
9)     /proc/sys/vm/overcommit_memory
该文件指定了内核针对内存分配的策略，其值可以是0、1、2。
0， 表示内核将检查是否有足够的可用内存供应用进程使用；如果有足够的可用内存，内存申请允许；否则，内存申请失败，并把错误返回给应用进程。
1， 表示内核允许分配所有的物理内存，而不管当前的内存状态如何。
2， 表示内核允许分配超过所有物理内存和交换空间总和的内存（参照overcommit_ratio）。

缺省设置：0
10) /proc/sys/vm/overcommit_ratio
该文件表示，如果overcommit_memory=2，可以过载内存的百分比，通过以下公式来计算系统整体可用内存。
系统可分配内存=交换空间+物理内存*overcommit_ratio/100

缺省设置：50（%）
11) /proc/sys/vm/page-cluster
该文件表示在写一次到swap区的时候写入的页面数量，0表示1页，1表示2页，2表示4页。

缺省设置：3（2的3次方，8页）
12) /proc/sys/vm/swapiness
该文件表示系统进行交换行为的程度，数值（0-100）越高，越可能发生磁盘交换。

缺省设置：60
13) legacy_va_layout
该文件表示是否使用最新的32位共享内存mmap()系统调用，Linux支持的共享内存分配方式包括mmap()，Posix，System VIPC。
0， 使用最新32位mmap()系统调用。
1， 使用2.4内核提供的系统调用。

缺省设置：0
14) nr_hugepages
该文件表示系统保留的hugetlb页数。
15) hugetlb_shm_group
该文件表示允许使用hugetlb页创建System VIPC共享内存段的系统组ID。
16) 待续。。。
四、/proc/sys/fs/优化
1)     /proc/sys/fs/file-max
该文件指定了可以分配的文件句柄的最大数目。如果用户得到的错误消息声明由于打开
文件数已经达到了最大值，从而他们不能打开更多文件，则可能需要增加该值。

缺省设置：4096
建议设置：65536
2)     /proc/sys/fs/file-nr
该文件与 file-max 相关，它有三个值：
已分配文件句柄的数目
已使用文件句柄的数目
文件句柄的最大数目
该文件是只读的，仅用于显示信息。
3)     待续。。。
五、/proc/sys/net/core/优化
该目录下的配置文件主要用来控制内核和网络层之间的交互行为。
1） /proc/sys/net/core/message_burst
写新的警告消息所需的时间（以 1/10 秒为单位）；在这个时间内系统接收到的其它警告消息会被丢弃。这用于防止某些企图用消息“淹没”系统的人所使用的拒绝服务（Denial of Service）攻击。

缺省设置：50（5秒）
2） /proc/sys/net/core/message_cost
该文件表示写每个警告消息相关的成本值。该值越大，越有可能忽略警告消息。

缺省设置：5
3） /proc/sys/net/core/netdev_max_backlog
该文件表示在每个网络接口接收数据包的速率比内核处理这些包的速率快时，允许送到队列的数据包的最大数目。

缺省设置：300
4） /proc/sys/net/core/optmem_max
该文件表示每个套接字所允许的最大缓冲区的大小。

缺省设置：10240
5） /proc/sys/net/core/rmem_default
该文件指定了接收套接字缓冲区大小的缺省值（以字节为单位）。

缺省设置：110592
6） /proc/sys/net/core/rmem_max
该文件指定了接收套接字缓冲区大小的最大值（以字节为单位）。

缺省设置：131071
7） /proc/sys/net/core/wmem_default
该文件指定了发送套接字缓冲区大小的缺省值（以字节为单位）。

缺省设置：110592
8） /proc/sys/net/core/wmem_max
该文件指定了发送套接字缓冲区大小的最大值（以字节为单位）。

缺省设置：131071
9） 待续。。。
六、/proc/sys/net/ipv4/优化
1)     /proc/sys/net/ipv4/ip_forward
该文件表示是否打开IP转发。
0，禁止
1，转发

缺省设置：0
2)     /proc/sys/net/ipv4/ip_default_ttl
该文件表示一个数据报的生存周期（Time To Live），即最多经过多少路由器。

缺省设置：64
增加该值会降低系统性能。
3)     /proc/sys/net/ipv4/ip_no_pmtu_disc
该文件表示在全局范围内关闭路径MTU探测功能。

缺省设置：0
4)     /proc/sys/net/ipv4/route/min_pmtu
该文件表示最小路径MTU的大小。

缺省设置：552
5)     /proc/sys/net/ipv4/route/mtu_expires
该文件表示PMTU信息缓存多长时间（秒）。

缺省设置：600（秒）
6)     /proc/sys/net/ipv4/route/min_adv_mss
该文件表示最小的MSS（Maximum Segment Size）大小，取决于第一跳的路由器MTU。

缺省设置：256（bytes）
6.1 IP Fragmentation
1)     /proc/sys/net/ipv4/ipfrag_low_thresh/proc/sys/net/ipv4/ipfrag_low_thresh
两个文件分别表示用于重组IP分段的内存分配最低值和最高值，一旦达到最高内存分配值，其它分段将被丢弃，直到达到最低内存分配值。

缺省设置：196608（ipfrag_low_thresh）
262144（ipfrag_high_thresh）
2)     /proc/sys/net/ipv4/ipfrag_time
该文件表示一个IP分段在内存中保留多少秒。

缺省设置：30（秒）
6.2 INET Peer Storage
1)     /proc/sys/net/ipv4/inet_peer_threshold
INET对端存储器某个合适值，当超过该阀值条目将被丢弃。该阀值同样决定生存
时间以及废物收集通过的时间间隔。条目越多，存活期越低，GC 间隔越短。

缺省设置：65664
2)     /proc/sys/net/ipv4/inet_peer_minttl
条目的最低存活期。在重组端必须要有足够的碎片(fragment)存活期。这个最低
存活期必须保证缓冲池容积是否少于 inet_peer_threshold。该值以 jiffies为
单位测量。

缺省设置：120
3)     /proc/sys/net/ipv4/inet_peer_maxttl
条目的最大存活期。在此期限到达之后，如果缓冲池没有耗尽压力的话(例如：缓
冲池中的条目数目非常少)，不使用的条目将会超时。该值以 jiffies为单位测量。

缺省设置：600
4)     /proc/sys/net/ipv4/inet_peer_gc_mintime
废物收集(GC)通过的最短间隔。这个间隔会影响到缓冲池中内存的高压力。 该值
以 jiffies为单位测量。

缺省设置：10

2006-10-31 16:33 清水飘萍
5)     /proc/sys/net/ipv4/inet_peer_gc_maxtime
废物收集(GC)通过的最大间隔，这个间隔会影响到缓冲池中内存的低压力。 该值
以 jiffies为单位测量。

缺省设置：120
6.3 TCP Variables
1)     /proc/sys/net/ipv4/tcp_syn_retries
该文件表示本机向外发起TCP SYN连接超时重传的次数，不应该高于255；该值仅仅针对外出的连接，对于进来的连接由tcp_retries1控制。

缺省设置：5
2)     /proc/sys/net/ipv4/tcp_keepalive_probes
该文件表示丢弃TCP连接前，进行最大TCP保持连接侦测的次数。保持连接仅在
SO_KEEPALIVE套接字选项被打开时才被发送。

缺省设置：9（次）
3)     /proc/sys/net/ipv4/tcp_keepalive_time
该文件表示从不再传送数据到向连接上发送保持连接信号之间所需的秒数。

缺省设置：7200（2小时）
4)     /proc/sys/net/ipv4/tcp_keepalive_intvl
该文件表示发送TCP探测的频率，乘以tcp_keepalive_probes表示断开没有相应的TCP连接的时间。

缺省设置：75（秒）
5)     /proc/sys/net/ipv4/tcp_retries1
该文件表示放弃回应一个TCP连接请求前进行重传的次数。

缺省设置：3
6)     /proc/sys/net/ipv4/tcp_retries2
该文件表示放弃在已经建立通讯状态下的一个TCP数据包前进行重传的次数。

缺省设置：15
7)     /proc/sys/net/ipv4/tcp_orphan_retries
在近端丢弃TCP连接之前，要进行多少次重试。默认值是 7 个，相当于 50秒–
16分钟，视 RTO 而定。如果您的系统是负载很大的web服务器，那么也许需
要降低该值，这类 sockets 可能会耗费大量的资源。另外参考
tcp_max_orphans。
8)     /proc/sys/net/ipv4/tcp_fin_timeout
对于本端断开的socket连接，TCP保持在FIN-WAIT-2状态的时间。对方可能
会断开连接或一直不结束连接或不可预料的进程死亡。默认值为 60 秒。过去在
2.2版本的内核中是 180 秒。您可以设置该值，但需要注意，如果您的机器为负
载很重的web服务器，您可能要冒内存被大量无效数据报填满的风险，
FIN-WAIT-2 sockets 的危险性低于 FIN-WAIT-1，因为它们最多只吃 1.5K
的内存，但是它们存在时间更长。另外参考 tcp_max_orphans。

缺省设置：60（秒）
9)     /proc/sys/net/ipv4/tcp_max_tw_buckets
系统在同时所处理的最大timewait sockets 数目。如果超过此数的话，
time-wait socket 会被立即砍除并且显示警告信息。之所以要设定这个限制，纯
粹为了抵御那些简单的 DoS 攻击，千万不要人为的降低这个限制，不过，如果
网络条件需要比默认值更多，则可以提高它(或许还要增加内存)。

缺省设置：180000
10) /proc/sys/net/ipv4/tcp_tw_recyle
打开快速 TIME-WAIT sockets 回收。除非得到技术专家的建议或要求，请不要随
意修改这个值。

缺省设置：0
11) /proc/sys/net/ipv4/tcp_tw_reuse
该文件表示是否允许重新应用处于TIME-WAIT状态的socket用于新的TCP连接。

缺省设置：0
12) /proc/sys/net/ipv4/tcp_max_orphans
系统所能处理不属于任何进程的TCP sockets最大数量。假如超过这个数量，那
么不属于任何进程的连接会被立即reset，并同时显示警告信息。之所以要设定这
个限制，纯粹为了抵御那些简单的 DoS 攻击，千万不要依赖这个或是人为的降
低这个限制。

缺省设置：8192
13) /proc/sys/net/ipv4/tcp_abort_on_overflow
当守护进程太忙而不能接受新的连接，就向对方发送reset消息，默认值是false。
这意味着当溢出的原因是因为一个偶然的猝发，那么连接将恢复状态。只有在你确
信守护进程真的不能完成连接请求时才打开该选项，该选项会影响客户的使用。

缺省设置：０
14) /proc/sys/net/ipv4/tcp_syncookies
该文件表示是否打开TCP同步标签(syncookie)，内核必须打开了 CONFIG_SYN_COOKIES项进行编译。 同步标签(syncookie)可以防止一个套接字在有过多试图连接到达时引起过载。

缺省设置：0
15) /proc/sys/net/ipv4/tcp_stdurg
使用 TCP urg pointer 字段中的主机请求解释功能。大部份的主机都使用老旧的
BSD解释，因此如果您在 Linux 打开它，或会导致不能和它们正确沟通。

缺省设置：0
16) /proc/sys/net/ipv4/tcp_max_syn_backlog
对于那些依然还未获得客户端确认的连接请求，需要保存在队列中最大数目。对于
超过 128Mb 内存的系统，默认值是 1024，低于 128Mb 的则为 128。如果
服务器经常出现过载，可以尝试增加这个数字。警告！假如您将此值设为大于
1024，最好修改 include/net/tcp.h 里面的 TCP_SYNQ_HSIZE，以保持
TCP_SYNQ_HSIZE*16 0)或者bytes-bytes/2^(-tcp_adv_win_scale)(如
果tcp_adv_win_scale 128Mb 32768-610000)则系统将忽略所有发送给自己
的ICMP ECHO请求或那些广播地址的请求。

缺省设置：1024
17) /proc/sys/net/ipv4/tcp_window_scaling
该文件表示设置tcp/ip会话的滑动窗口大小是否可变。参数值为布尔值，为1时表示可变，为0时表示不可变。tcp/ip通常使用的窗口最大可达到 65535 字节，对于高速网络，该值可能太小，这时候如果启用了该功能，可以使tcp/ip滑动窗口大小增大数个数量级，从而提高数据传输的能力。

缺省设置：1
18) /proc/sys/net/ipv4/tcp_sack
该文件表示是否启用有选择的应答（Selective Acknowledgment），这可以通过有选择地应答乱序接收到的报文来提高性能（这样可以让发送者只发送丢失的报文段）；（对于广域网通信来说）这个选项应该启用，但是这会增加对 CPU 的占用。

缺省设置：1
19) /proc/sys/net/ipv4/tcp_timestamps
该文件表示是否启用以一种比超时重发更精确的方法（请参阅 RFC 1323）来启用对 RTT 的计算；为了实现更好的性能应该启用这个选项。

缺省设置：1
20) /proc/sys/net/ipv4/tcp_fack
该文件表示是否打开FACK拥塞避免和快速重传功能。

缺省设置：1
21) /proc/sys/net/ipv4/tcp_dsack
该文件表示是否允许TCP发送“两个完全相同”的SACK。

缺省设置：1
22) /proc/sys/net/ipv4/tcp_ecn
该文件表示是否打开TCP的直接拥塞通告功能。

缺省设置：0
23) /proc/sys/net/ipv4/tcp_reordering
该文件表示TCP流中重排序的数据报最大数量。

缺省设置：3
24) /proc/sys/net/ipv4/tcp_retrans_collapse
该文件表示对于某些有bug的打印机是否提供针对其bug的兼容性。

缺省设置：1
25) /proc/sys/net/ipv4/tcp_wmem
该文件包含3个整数值，分别是：min，default，max
Min：为TCP socket预留用于发送缓冲的内存最小值。每个TCP socket都可以使用它。
Default：为TCP socket预留用于发送缓冲的内存数量，默认情况下该值会影响其它协议使用的net.core.wmem中default的 值，一般要低于net.core.wmem中default的值。
Max：为TCP socket预留用于发送缓冲的内存最大值。该值不会影响net.core.wmem_max，今天选择参数SO_SNDBUF则不受该值影响。默认值为128K。

缺省设置：4096 16384 131072
26) /proc/sys/net/ipv4/tcp_rmem
该文件包含3个整数值，分别是：min，default，max
Min：为TCP socket预留用于接收缓冲的内存数量，即使在内存出现紧张情况下TCP socket都至少会有这么多数量的内存用于接收缓冲。
Default：为TCP socket预留用于接收缓冲的内存数量，默认情况下该值影响其它协议使用的 net.core.wmem中default的值。该值决定了在tcp_adv_win_scale、tcp_app_win和tcp_app_win的 默认值情况下，TCP 窗口大小为65535。
Max：为TCP socket预留用于接收缓冲的内存最大值。该值不会影响 net.core.wmem中max的值，今天选择参数 SO_SNDBUF则不受该值影响。

缺省设置：4096 87380 174760
27) /proc/sys/net/ipv4/tcp_mem
该文件包含3个整数值，分别是：low，pressure，high
Low：当TCP使用了低于该值的内存页面数时，TCP不会考虑释放内存。
Pressure：当TCP使用了超过该值的内存页面数量时，TCP试图稳定其内存使用，进入pressure模式，当内存消耗低于low值时则退出pressure状态。
High：允许所有tcp sockets用于排队缓冲数据报的页面量。
一般情况下这些值是在系统启动时根据系统内存数量计算得到的。

缺省设置：24576 32768 49152
28) /proc/sys/net/ipv4/tcp_app_win
该文件表示保留max(window/2^tcp_app_win, mss)数量的窗口由于应用缓冲。当为0时表示不需要缓冲。

缺省设置：31
29) /proc/sys/net/ipv4/tcp_adv_win_scale
该文件表示计算缓冲开销bytes/2^tcp_adv_win_scale(如果tcp_adv_win_scale >; 0)或者bytes-bytes/2^(-tcp_adv_win_scale)(如果tcp_adv_win_scale <= 0）。

缺省设置：2
6.4 IP Variables
1)     /proc/sys/net/ipv4/ip_local_port_range
该文件表示TCP／UDP协议打开的本地端口号。

缺省设置：1024 4999
建议设置：32768 61000
2)     /proc/sys/net/ipv4/ip_nonlocal_bind
该文件表示是否允许进程邦定到非本地地址。

缺省设置：0
3)     /proc/sys/net/ipv4/ip_dynaddr
该参数通常用于使用拨号连接的情况，可以使系统动能够立即改变ip包的源地址为该ip地址，同时中断原有的tcp对话而用新地址重新发出一个syn请求 包，开始新的tcp对话。在使用ip欺骗时，该参数可以立即改变伪装地址为新的ip地址。该文件表示是否允许动态地址，如果该值非0，表示允许；如果该值 大于1，内核将通过log记录动态地址重写信息。

缺省设置：0
4)     /proc/sys/net/ipv4/icmp_echo_ignore_all/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
该文件表示内核是否忽略所有的ICMP ECHO请求，或忽略广播和多播请求。
0， 响应请求
1， 忽略请求

缺省设置：０
建议设置：1
5)     /proc/sys/net/ipv4/icmp_ratelimit
6)     /proc/sys/net/ipv4/icmp_ratemask
7)     /proc/sys/net/ipv4/icmp_ignore_bogus_error_reponses
某些路由器违背RFC1122标准，其对广播帧发送伪造的响应来应答。这种违背行
为通常会被以告警的方式记录在系统日志中。如果该选项设置为True，内核不会
记录这种警告信息。

缺省设置：0
8)     /proc/sys/net/ipv4/igmp_max_memberships
该文件表示多播组中的最大成员数量。

缺省设置：20
6.5 Other Configuration
1)     /proc/sys/net/ipv4/conf/*/accept_redirects
如果主机所在的网段中有两个路由器，你将其中一个设置成了缺省网关，但是该网关
在收到你的ip包时发现该ip包必须经过另外一个路由器，这时这个路由器就会给你
发一个所谓的“重定向”icmp包，告诉将ip包转发到另外一个路由器。参数值为布尔
值，1表示接收这类重定向icmp 信息，0表示忽略。在充当路由器的linux主机上缺
省值为0，在一般的linux主机上缺省值为1。建议将其改为0以消除安全性隐患。
2)     /proc/sys/net/ipv4/*/accept_source_route
是否接受含有源路由信息的ip包。参数值为布尔值，1表示接受，0表示不接受。在
充当网关的linux主机上缺省值为1，在一般的linux主机上缺省值为0。从安全性角
度出发，建议关闭该功能。
3)     /proc/sys/net/ipv4/*/secure_redirects
其实所谓的“安全重定向”就是只接受来自网关的“重定向”icmp包。该参数就是
用来设置“安全重定向”功能的。参数值为布尔值，1表示启用，0表示禁止，缺省值
为启用。
4)     /proc/sys/net/ipv4/*/proxy_arp
设置是否对网络上的arp包进行中继。参数值为布尔值，1表示中继，0表示忽略，
缺省值为0。该参数通常只对充当路由器的linux主机有用。
七、性能优化策略
7.1 基本优化
1)     关闭后台守护进程
系统安装完后，系统会默认启动一些后台守护进程，有些进程并不是必需的；因此，关闭这些进程可以节省一部分物理内存消耗。以root身份登录系统，运行ntsysv，选中如下进程：
iptables
network
syslog
random
apmd
xinetd
vsftpd
crond
local
修改完后，重新启动系统。
如此，系统将仅仅启动选中的这些守护进程。
2)     减少终端连接数
系统默认启动6个终端，而实际上只需启动3个即可；以root身份登录系统，运行vi /etc/inittab，修改成如下：
# Run gettys in standard runlevels
1:2345:respawn:/sbin/mingetty tty1
2:2345:respawn:/sbin/mingetty tty2
3:2345:respawn:/sbin/mingetty tty3
#4:2345:respawn:/sbin/mingetty tty4
#5:2345:respawn:/sbin/mingetty tty5
#6:2345:respawn:/sbin/mingetty tty6
如上所述，注释掉4、5、6终端。
3)     待续。。。
7.2 网络优化
1)     优化系统套接字缓冲区
net.core.rmem_max=16777216
net.core.wmem_max=16777216
2)     优化TCP接收／发送缓冲区
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
3)     优化网络设备接收队列
net.core.netdev_max_backlog=3000
4)     关闭路由相关功能
net.ipv4.conf.lo.accept_source_route=0
net.ipv4.conf.all.accept_source_route=0
net.ipv4.conf.eth0.accept_source_route=0
net.ipv4.conf.default.accept_source_route=0

net.ipv4.conf.lo.accept_redirects=0
net.ipv4.conf.all.accept_redirects=0
net.ipv4.conf.eth0.accept_redirects=0
net.ipv4.conf.default.accept_redirects=0

net.ipv4.conf.lo.secure_redirects=0
net.ipv4.conf.all.secure_redirects=0
net.ipv4.conf.eth0.secure_redirects=0
net.ipv4.conf.default.secure_redirects=0

net.ipv4.conf.lo.send_redirects=0
net.ipv4.conf.all.send_redirects=0
net.ipv4.conf.eth0.send_redirects=0
net.ipv4.conf.default.send_redirects=0
5)     优化TCP协议栈
打开TCP SYN cookie选项，有助于保护服务器免受SyncFlood攻击。
net.ipv4.tcp_syncookies=1

打开TIME-WAIT套接字重用功能，对于存在大量连接的Web服务器非常有效。
net.ipv4.tcp_tw_recyle=1
net.ipv4.tcp_tw_reuse=1

减少处于FIN-WAIT-2连接状态的时间，使系统可以处理更多的连接。
net.ipv4.tcp_fin_timeout=30

减少TCP KeepAlive连接侦测的时间，使系统可以处理更多的连接。
net.ipv4.tcp_keepalive_time=1800

增加TCP SYN队列长度，使系统可以处理更多的并发连接。
net.ipv4.tcp_max_syn_backlog=8192
 
 
