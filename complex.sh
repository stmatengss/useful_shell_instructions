# find string in file

for i in `find /etc/`
do
    num=`grep "hello" $i | wc -l`
    if [ $num -ne 0 ]; then
        echo $i
    fi
done

# awk fuuuuucking string

grep -Po '\[.*\]\(.*\)' file | sed 's/^.//' | sed 's/$.//'
