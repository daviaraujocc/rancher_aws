#!/bin/bash

#Instalação do docker

curl https://releases.rancher.com/install-docker/19.03.sh | sh

sudo usermod -aG docker ubuntu
