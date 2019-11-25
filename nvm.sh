ndctl create-namespace
ndctl list -RuN -r region2
ndctl list -N
ndctl destroy-namespace namespace1.0 --force
ndctl create-namespace -e namespace1.0 --mode=devdax -f --align 2M
