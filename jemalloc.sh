# add sbrk primary
./configure --with-jemalloc-prefix --enable-dss

# config lib path
cd bin/
LD_PRELOAD=`sh jemalloc-config --libdir`/libjemalloc.so.`sh jemalloc-config --revision`
