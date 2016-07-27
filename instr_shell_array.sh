declare -A dic
dic=([key1]="value1" [key2]="value2" [key3]="value3")

#打印指定key的value
echo ${dic["key1"]}
#打印所有key值
echo ${!dic[*]}
#打印所有value
echo ${dic[*]}

#遍历key值
for key in $(echo ${!dic[*]})
do
        echo "$key : ${dic[$key]}"
done

echo "shell定义数组"

#数组
list=("value1" "value2" "value3")
#打印指定下标
echo ${list[1]}
#打印所有下标
echo ${!list[*]}
#打印数组下标
echo ${list[*]}
#数组增加一个元素
list=("${list[@]}" "value3")
