#### Install ####

sudo apt-get update
sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) \
 stable"
sudo apt-get update
sudo apt-get install docker-ce
docker login
docker pull stmatengss/centos-rdma


#### Usage ####
sudo docker commit -m "init" -a="teng" cranky_keller teng/centos
sudo docker ps -l
docker create --net=host --device=/dev/infiniband/uverbs0 --device=/dev/infiniband/rdma_cm -t -i centos /bin/bash
docker images
sudo docker tag stmatengss/centos-rdma stmatengss/centos-rdma
sudo docker push stmatengss/centos-rdma
docker login
