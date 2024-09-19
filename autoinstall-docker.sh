#!/bin/bash

# This shell is for automating the installation of docker and docker-compose executable files.

echo -e "\033[34m[TASK 1] Update & Upgrade system version\033[0m"
sudo apt update && sudo apt upgrade -y

echo -e "\033[34m[TASK 2] Download get-docker && Install docker\033[0m"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo -e "\033[34m[TASK 3] Download docker-compose && chmod\033[0m"
sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo -e "\033[34m[TASK 4] local user docker run access rights\033[0m"
sudo groupadd docker
USER=$(who | awk '{print $1}' | sort | uniq)
sudo usermod -aG docker $USER

echo -e "\033[34m====================done====================\033[0m"
