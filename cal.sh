# SUM
cat data|awk '{sum+=$1} END {print "Sum = ", sum}'
 
# AVE
cat data|awk '{sum+=$1} END {print "Average = ", sum/NR}'
 
# MAX
cat data|awk 'BEGIN {max = 0} {if ($1>max) max=$1 fi} END {print "Max=", max}'
 
# MIN
awk 'BEGIN {min = 1999999} {if ($1<min) min=$1 fi} END {print "Min=", min}'

# WORDCOUNT
sort $1 | uniq -c | sort -n -r 
