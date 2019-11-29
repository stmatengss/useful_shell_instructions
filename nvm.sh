# Config
ndctl create-namespace
ndctl list -RuN -r region2
ndctl list -N
ndctl destroy-namespace namespace1.0 --force
ndctl create-namespace -e namespace1.0 --mode=devdax -f --align 2M
ndctl create-namespace --no-autolabel --mode fsdax --map dev -e

# Profile
./mlc -o,0-2,W21,seq,30000,dram,2,pmem,/mnt/pmem1,25
./mlc --idle_latency -c0 -J/mnt/pmem0/mateng
