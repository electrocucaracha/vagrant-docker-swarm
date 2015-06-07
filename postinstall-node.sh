#! /bin/bash

sed -i "s/10.0.2.3/8.8.8.8/g" /etc/resolv.conf
apt-get update && apt-get upgrade

# Install docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh
service docker stop
sed -i "s/DOCKER_OPTS=/DOCKER_OPTS='-H tcp:\/\/0.0.0.0:2375'/g" /etc/init/docker.conf 
service docker start
