#!/bin/bash
sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-zookeeper:master-7285246 &&
sudo docker run -p 2181:2181 phedri/sdtd-zookeeper:master-7285246
