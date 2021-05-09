#!/bin/bash

#Instalação do docker

curl https://releases.rancher.com/install-docker/19.03.sh | sh

sudo usermod -aG docker ubuntu

#instalação do kubectl

apt-get update && sudo apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
sudo apt-get install -y kubectl

#Pull e execução do rancher em container

sudo docker run -d --name rancher --restart=unless-stopped -v /opt/rancher:/var/lib/rancher  -p 80:80 -p 443:443 --privileged rancher/rancher:v2.4.3