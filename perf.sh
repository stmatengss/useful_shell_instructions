gprof ./bin/test_skip_list | gprof2dot | dot -Tpng -o report.png

perf stat -e task-clock -i -I 200 -D 4000 -o back-end.cpu.6.data ./bin/test_queue -b  
perf stat -e task-clock -I 1000 -o front-end.cpu.6.data bin/test_bst -f -s teaker-10

watch -n 60 sudo perf stat -a sleep 60
