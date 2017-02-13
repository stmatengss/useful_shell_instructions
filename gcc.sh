# if we have a c file name test.c

gcc -S test.c # translate the c lang into Assemble lang

gcc -c test.c # get the object file

gcc -DNODEBUG ... # Define a macro named NODEBUG

gcc -Og/O1/O2/O3 ... # The different levels of optmization

gcc -L/-l ... # contain the refer library when compiling
