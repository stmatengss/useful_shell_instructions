uniq doudi_cb.csv > doudi_cb_uniq.csv
cat a > b
wc -l
sort doudi_cb.csv|uniq  > doudi_cb_uniq.csv
grep -vwf file1 file2
PATH = $PATH:$HOME/bin
sed -n '10,42p' file_name
filesize=`wc -c < filename`

du -sh file_name
zip -r mydata.zip mydata
：%s/vivian/sky/g
gggUG #整篇文章小写转化为大写
ggguG #整篇文章大写转化为小写
cat file1 >> file2
awk '{print $2}' a.txt >b.txt #从a.txt中取第一列并输出到b.txt中
set number
for file in `ls`
do
	echo $file
done
:%s/vivian/sky/g
date +%Y%m%d$H%M%S

cat -n 文件路径 | tail -n +5 | head -n 6 

5>>

grep '^yb' pdf_tables.data > pdf_tables_2.data
diff a b

if [ ! -f "$myFile" ]; then 
touch "$myFile" 
fi 

rsync A B

格式化全文： gg=G

自动缩进当前行： ==

在shell 中以 ， split 字符串如下
str="aaa,bbb,ccc,ddd"
 
我一般会用
echo $str |awk -F, '{print $1}' 这样的方式
或者是
echo $str|cut -d"," -f1 这样的方式
 
都能达到目的，但是由于文件很大，有很多行，上述方式需要开辟管道，会启动新进程，效率很低下。
 
在网上找了一下 存字符串的切分方式：
 
arr=(${line//,/ })  
year=${arr[0]}
userId=${arr[1]}
 
效率是最高的。


比如变量是str
str="this is a string"
要想在判断str中是否含有"this"这个字符串，下面的语句是可行的
[[ $str =~ "this" ]] && echo "\$str contains this" 
[[ $str =~ "that" ]] || echo "\$str does NOT contain this"

其实这里就是用到了"[[" 判断命令和 "=~"正则式匹配符号

echo "##### 方法 1 #####"  
while read line1  
do  
    echo $line1  
done < $1  
  
echo "##### 方法 2 #####"  
cat $1 | while read line2  
do  
    echo $line2  
done  
  
echo "##### 方法 3 #####"  
for line3 in $(<$1)  
do  
    echo $line3  
done  
