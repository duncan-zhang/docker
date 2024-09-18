#!/bin/bash

# This shell is for automating the installation of docker and docker-compose executable files.

echo "[TASK 1] Update & Upgrade system version"
sudo apt update && sudo apt upgrade -y

echo "[TASK 2] Download get-docker && Install docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "[TASK 3] Download docker-compose && chmod"
sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "[TASK 4] local user docker run access rights"
sudo groupadd docker
users=$(who | awk '{print $1}' | sort | uniq)
sudo usermod -aG docker $USER

