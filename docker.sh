sudo docker commit -m "init" -a="teng" cranky_keller teng/centos
sudo docker ps -l
docker create --net=host --device=/dev/infiniband/uverbs0 --device=/dev/infiniband/rdma_cm -t -i centos /bin/bash
docker images
