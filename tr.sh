tr（translate缩写）主要用于删除文件中的控制字符，或进行字符转换。
语法：tr [–c/d/s/t] [SET1] [SET2]
SET1: 字符集1
SET2：字符集2
-c:complement，用SET2替换SET1中没有包含的字符
-d:delete，删除SET1中所有的字符，不转换
-s: squeeze-repeats，压缩SET1中重复的字符
-t: truncate-set1，将SET1用SET2转换，一般缺省为-t
 
1、去除重复的字符
#将连续的几个相同字符压缩为一个字符
$ echo aaacccddd | tr -s [a-z]
acd
$ echo aaacccddd | tr -s [abc]
acddd
 
2、删除空白行
#删除空白行就是删除换行符/n
#注意：这些空白行上只有回车符，没有空格符
$ cat test.txt
I love linux!
                                                                                                                          
                                                                                                                          
Hello World!
                                                                                                                          
Shell is worthy to been studied
 
#这里用换行符的转义字符\n
#注意：此处用-s删除了多余的换行符，如果用-d，则会删除所有的换行符                                                                                                                          
$ cat test.txt | tr -s ["\n"]
I love linux!
Hello World!
Shell is worthy to been studied
#也可以用八进制符\012，\012与\n都是换行符
$ cat test.txt | tr -s "[\012]"
I love linux!
Hello World!
Shell is worthy to been studied
 
3、大小写相互转换
#将语句中所有的小写字母变成大写字母,其中-t可省略
$ echo "Hello World I Love You" |tr [-t] [a-z] [A-Z]
HELLO WORLD I LOVE YOU
#将语句中所有的大写字母变成小写字母
$ echo "Hello World I Love You" |tr [A-Z] [a-z]
hello world i love you
#也可以利用字符类进行转换
#[:lower:]代表小写字母，[:upper:]代表大写字母
$ echo "Hello World I Love You" |tr [:lower:] [:upper:]
HELLO WORLD I LOVE YOU
 
4、删除指定的字符
$ cat test.txt
Monday     09:00
Tuesday    09:10
Wednesday  10:11
Thursday   11:30
Friday     08:00
Saturday   07:40
Sunday     10:00
#现在要删除处理星期之外的所有字符
#-d代表删除，[0-9]代表所有的数字，[: ]代表冒号和空格
$ cat test.txt | tr -d "[0-9][: ]"
Monday
Tuesday
Wednesday
Thursday
Friday
Saturday
Sunday
 
5、利用-c进行补集的替换
#有时候在文本中我们只知道要保留的一些字符，其他字符种类繁多，就可以使用补集的替换
$ cat test.txt
Monday     09:00
Tuesday    09:10
Wednesday  10:11
Thursday   11:30
Friday     08:00
Saturday   07:40
Sunday     10:00
#我们只需要星期，则思路就是除了字母，其他统统替换掉
#这里，-c：用换行符替换掉除了字母外的所有字符；-s：删除多余的换行符
cat test.txt|tr -cs  "[a-z][A-Z]" "\n"
Monday
Tuesday
Wednesday
Thursday
Friday
Saturday
Sunday
